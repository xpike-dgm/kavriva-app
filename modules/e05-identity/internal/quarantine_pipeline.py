"""Internal E5 processing policy, never authorization or a verified receipt store.

Inputs must come from a later authenticated canonical producer/writer. This pure
module does not authenticate scanner, human or receipt strings, persist state,
render files, release an object, or establish technical correctness.
"""

from __future__ import annotations

from dataclasses import dataclass, replace
from enum import Enum


class State(str, Enum):
    RECEIVED_UNTRUSTED = "RECEIVED_UNTRUSTED"
    QUARANTINED = "QUARANTINED"
    IDENTIFIED = "IDENTIFIED"
    VALIDATED = "VALIDATED"
    SCANNED = "SCANNED"
    RENDERED_UNTRUSTED_PREVIEW = "RENDERED_UNTRUSTED_PREVIEW"
    HUMAN_CLASSIFIED = "HUMAN_CLASSIFIED"
    SAFE_FOR_HUMAN_REVIEW = "SAFE_FOR_HUMAN_REVIEW"
    REJECTED = "REJECTED"
    SCAN_FAILED = "SCAN_FAILED"
    SCAN_UNKNOWN = "SCAN_UNKNOWN"
    PARSING_FAILED = "PARSING_FAILED"
    MALICIOUS = "MALICIOUS"
    SUSPICIOUS = "SUSPICIOUS"
    EXPIRED = "EXPIRED"
    DELETED_BY_POLICY = "DELETED_BY_POLICY"


CHAIN = tuple(State)[:8]
KINDS = ("quarantine", "identify", "validate", "scan", "isolated_preview",
         "human_classification", "review_readiness")
CLASSIFICATIONS = frozenset({"private", "shared", "community", "official", "security"})
LIFECYCLE_END = frozenset({State.EXPIRED, State.DELETED_BY_POLICY})


class PipelineError(ValueError):
    def __init__(self, reason: str):
        self.reason = reason
        super().__init__(reason)


@dataclass(frozen=True)
class Subject:
    object_id: str
    generation: int
    digest: str
    manifest_fingerprint: str
    classification: str
    policy_version: str


@dataclass(frozen=True)
class Observation:
    subject: Subject
    receipt_ref: str
    producer_ref: str
    kind: str
    reason: str


@dataclass(frozen=True)
class Transition:
    previous: State
    current: State
    previous_subject: Subject
    current_subject: Subject
    observation: Observation


@dataclass(frozen=True)
class Record:
    subject: Subject
    state: State = State.RECEIVED_UNTRUSTED
    history: tuple[Transition, ...] = ()


def _text(value: object) -> bool:
    return type(value) is str and bool(value.strip())


def _subject(subject: Subject) -> None:
    if type(subject) is not Subject:
        raise PipelineError("INVALID_SUBJECT")
    if not _text(subject.object_id) or not _text(subject.policy_version):
        raise PipelineError("SUBJECT_CONTEXT_MISSING")
    if type(subject.generation) is not int or subject.generation < 1:
        raise PipelineError("INVALID_GENERATION")
    for value in (subject.digest, subject.manifest_fingerprint):
        if (type(value) is not str or len(value) != 64
                or any(c not in "0123456789abcdef" for c in value)):
            raise PipelineError("INVALID_SUBJECT_DIGEST")
    if type(subject.classification) is not str or subject.classification not in CLASSIFICATIONS:
        raise PipelineError("CLASSIFICATION_UNKNOWN")


def _record(record: Record) -> None:
    if type(record) is not Record or type(record.state) is not State:
        raise PipelineError("INVALID_RECORD")
    _subject(record.subject)
    if type(record.history) is not tuple or any(type(x) is not Transition for x in record.history):
        raise PipelineError("INVALID_HISTORY")
    if not record.history and record.state != State.RECEIVED_UNTRUSTED:
        raise PipelineError("INITIAL_STATE_REQUIRED")
    state = State.RECEIVED_UNTRUSTED
    subject = record.history[0].previous_subject if record.history else record.subject
    _subject(subject)
    receipts = set()
    for step in record.history:
        _subject(step.previous_subject)
        _subject(step.current_subject)
        obs = step.observation
        if (type(step.previous) is not State or step.previous != state or step.previous_subject != subject
                or type(step.current) is not State or type(obs) is not Observation
                or obs.subject != step.current_subject
                or any(not _text(v) for v in (obs.receipt_ref, obs.producer_ref, obs.kind, obs.reason))
                or obs.receipt_ref in receipts):
            raise PipelineError("INVALID_HISTORY")
        _subject(obs.subject)
        if obs.kind == "policy_reevaluation":
            valid = (state not in LIFECYCLE_END and state != State.RECEIVED_UNTRUSTED
                     and step.current == State.QUARANTINED
                     and subject.policy_version != step.current_subject.policy_version
                     and replace(subject, policy_version=step.current_subject.policy_version) == step.current_subject)
        elif step.current in CHAIN:
            valid = (subject == step.current_subject and state in CHAIN[:-1]
                     and CHAIN[CHAIN.index(state) + 1] == step.current
                     and KINDS[CHAIN.index(state)] == obs.kind)
        else:
            valid = (subject == step.current_subject and _allowed_failure(state, step.current)
                     and obs.kind == step.current.value.lower())
        if not valid:
            raise PipelineError("INVALID_HISTORY")
        receipts.add(obs.receipt_ref)
        state, subject = step.current, step.current_subject
    if state != record.state or subject != record.subject:
        raise PipelineError("HISTORY_CONTEXT_MISMATCH")


def _allowed_failure(state: State, target: State) -> bool:
    if state == State.DELETED_BY_POLICY:
        return False
    if target == State.DELETED_BY_POLICY:
        return True
    if target == State.EXPIRED:
        return state not in LIFECYCLE_END
    if state not in CHAIN:
        return False
    if target in {State.SCAN_FAILED, State.SCAN_UNKNOWN}:
        return state == State.VALIDATED
    if target == State.PARSING_FAILED:
        return state in {State.QUARANTINED, State.IDENTIFIED, State.VALIDATED, State.SCANNED}
    if target == State.REJECTED:
        return True
    if target in {State.MALICIOUS, State.SUSPICIOUS}:
        return state != State.RECEIVED_UNTRUSTED
    return False


def _observation(record: Record, observation: Observation, subject: Subject) -> None:
    if type(observation) is not Observation:
        raise PipelineError("OBSERVATION_REQUIRED")
    _subject(observation.subject)
    if observation.subject != subject:
        raise PipelineError("OBSERVATION_CONTEXT_MISMATCH")
    if any(not _text(v) for v in (observation.receipt_ref, observation.producer_ref,
                                 observation.kind, observation.reason)):
        raise PipelineError("OBSERVATION_CONTEXT_MISSING")
    if any(x.observation.receipt_ref == observation.receipt_ref for x in record.history):
        raise PipelineError("RECEIPT_REPLAY")


def _append(record: Record, target: State, observation: Observation,
            subject: Subject | None = None) -> Record:
    current_subject = record.subject if subject is None else subject
    step = Transition(record.state, target, record.subject, current_subject, observation)
    return Record(current_subject, target, record.history + (step,))


def receive(subject: Subject) -> Record:
    """Record a trusted intake subject; a fingerprint is not authenticated proof."""
    _subject(subject)
    return Record(subject)


def advance(record: Record, observation: Observation) -> Record:
    """Advance one processing stage; never approve, publish or grant file access."""
    _record(record)
    if record.state not in CHAIN[:-1]:
        raise PipelineError("PROCESSING_BLOCKED")
    index = CHAIN.index(record.state)
    _observation(record, observation, record.subject)
    if observation.kind != KINDS[index]:
        raise PipelineError("STAGE_OBSERVATION_MISMATCH")
    return _append(record, CHAIN[index + 1], observation)


def fail(record: Record, target: State, observation: Observation) -> Record:
    """Explicit fail/hold/lifecycle branch; an unknown scan cannot mean clean."""
    _record(record)
    if type(target) is not State or target in CHAIN:
        raise PipelineError("FAILURE_STATE_REQUIRED")
    if record.state == State.DELETED_BY_POLICY:
        raise PipelineError("LIFECYCLE_CLOSED")
    if not _allowed_failure(record.state, target):
        raise PipelineError("FAILURE_STAGE_MISMATCH")
    _observation(record, observation, record.subject)
    if observation.kind != target.value.lower():
        raise PipelineError("FAILURE_OBSERVATION_MISMATCH")
    return _append(record, target, observation)


def reevaluate(record: Record, new_subject: Subject, observation: Observation) -> Record:
    """Restart the same immutable object under changed policy, retaining history.

    The caller must separately authorize and authenticate the correction producer.
    Replacement bytes, changed classification/lineage/retention or expired/deleted
    sources require a distinct governed intake; they cannot borrow this history.
    """
    _record(record)
    _subject(new_subject)
    if record.state in LIFECYCLE_END or record.state == State.RECEIVED_UNTRUSTED:
        raise PipelineError("REEVALUATION_BLOCKED")
    if replace(record.subject, policy_version=new_subject.policy_version) != new_subject:
        raise PipelineError("IMMUTABLE_SOURCE_CHANGED")
    if new_subject.policy_version == record.subject.policy_version:
        raise PipelineError("POLICY_CHANGE_REQUIRED")
    _observation(record, observation, new_subject)
    if observation.kind != "policy_reevaluation":
        raise PipelineError("REEVALUATION_OBSERVATION_REQUIRED")
    return _append(record, State.QUARANTINED, observation, new_subject)
