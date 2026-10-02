"""Internal proposal tags; no extraction, authenticated receipt or tool authority.

Producer and transformation references are caller-trusted metadata. The future
canonical writer must verify them and the permitted data boundary separately.
Candidate text is opaque data, never parsed as policy, classification or actions.
"""

from __future__ import annotations

import hashlib
from dataclasses import dataclass, field
from enum import Enum

from quarantine_pipeline import Record, State, Subject, _record, _subject


class Outcome(str, Enum):
    CANDIDATE = "CANDIDATE"
    FAILED = "FAILED"
    UNSUPPORTED = "UNSUPPORTED"
    UNKNOWN = "UNKNOWN"


class Reason(str, Enum):
    REVIEW_REQUIRED = "REVIEW_REQUIRED"
    EXTRACTION_FAILED = "EXTRACTION_FAILED"
    SOURCE_UNSUPPORTED = "SOURCE_UNSUPPORTED"
    EXTRACTION_UNKNOWN = "EXTRACTION_UNKNOWN"
    PROVIDER_UNAVAILABLE = "PROVIDER_UNAVAILABLE"
    INPUT_PROCESSING_HELD = "INPUT_PROCESSING_HELD"


REASONS = {
    Outcome.CANDIDATE: frozenset({Reason.REVIEW_REQUIRED}),
    Outcome.FAILED: frozenset({Reason.EXTRACTION_FAILED}),
    Outcome.UNSUPPORTED: frozenset({Reason.SOURCE_UNSUPPORTED}),
    Outcome.UNKNOWN: frozenset({Reason.EXTRACTION_UNKNOWN, Reason.PROVIDER_UNAVAILABLE,
                                Reason.INPUT_PROCESSING_HELD}),
}


class ProposalError(ValueError):
    def __init__(self, reason: str):
        self.reason = reason
        super().__init__(reason)


@dataclass(frozen=True)
class Transformation:
    input_subject: Subject
    input_receipt_ref: str
    run_id: str
    kind: str
    producer_ref: str
    provider_or_local_engine_ref: str
    model_or_engine_ref: str
    model_or_engine_version: str
    configuration_fingerprint: str
    result_ref: str


@dataclass(frozen=True)
class TaggedProposal:
    input_record: Record = field(repr=False)
    transformation: Transformation
    outcome: Outcome
    reason: Reason
    output_digest: str | None
    candidate_text: str | None = field(repr=False)

    @property
    def content_status(self) -> str:
        return "UNTRUSTED_PROPOSAL"

    @property
    def authority(self) -> str:
        return "NONE"

    @property
    def requires_human_review(self) -> bool:
        return True

    @property
    def classification(self) -> str:
        return self.input_record.subject.classification


def _text(value: object) -> bool:
    return type(value) is str and bool(value.strip())


def tag_proposal(input_record: Record, transformation: Transformation,
                 outcome: Outcome, reason: Reason,
                 candidate_text: str | None = None) -> TaggedProposal:
    """Bind an extraction result as proposal data, never approval or permission.

    This factory performs structural policy checks and hashes the exact UTF-8
    output. It cannot authenticate the supplied input, run or receipt and cannot
    prove that the named provider actually processed those bytes.
    """
    _record(input_record)
    if (input_record.state in {State.RECEIVED_UNTRUSTED, State.EXPIRED, State.DELETED_BY_POLICY}
            or not input_record.history):
        raise ProposalError("INPUT_PROCESSING_HELD")
    if type(transformation) is not Transformation:
        raise ProposalError("TRANSFORMATION_REQUIRED")
    _subject(transformation.input_subject)
    if (transformation.input_subject != input_record.subject
            or transformation.input_receipt_ref != input_record.history[-1].observation.receipt_ref):
        raise ProposalError("INPUT_PROVENANCE_MISMATCH")
    if any(not _text(v) for v in (
        transformation.input_receipt_ref, transformation.run_id, transformation.kind,
        transformation.producer_ref, transformation.provider_or_local_engine_ref,
        transformation.model_or_engine_ref, transformation.model_or_engine_version,
        transformation.result_ref,
    )):
        raise ProposalError("TRANSFORMATION_PROVENANCE_MISSING")
    if transformation.kind not in {"AI", "OCR"}:
        raise ProposalError("TRANSFORMATION_KIND_UNSUPPORTED")
    config = transformation.configuration_fingerprint
    if (type(config) is not str or len(config) != 64
            or any(c not in "0123456789abcdef" for c in config)):
        raise ProposalError("CONFIGURATION_FINGERPRINT_INVALID")
    if type(outcome) is not Outcome:
        raise ProposalError("OUTCOME_UNKNOWN")
    if type(reason) is not Reason:
        raise ProposalError("OUTCOME_REASON_INVALID")
    if reason not in REASONS[outcome]:
        raise ProposalError("OUTCOME_REASON_MISMATCH")
    if outcome == Outcome.CANDIDATE:
        if input_record.state not in {
            State.SCANNED, State.RENDERED_UNTRUSTED_PREVIEW,
            State.HUMAN_CLASSIFIED, State.SAFE_FOR_HUMAN_REVIEW,
        }:
            raise ProposalError("INPUT_PROCESSING_HELD")
        if not _text(candidate_text):
            raise ProposalError("CANDIDATE_TEXT_REQUIRED")
        try:
            encoded = candidate_text.encode("utf-8")
        except UnicodeError:
            raise ProposalError("OUTPUT_ENCODING_INVALID") from None
        digest = hashlib.sha256(encoded).hexdigest()
    else:
        if candidate_text is not None:
            raise ProposalError("FAILED_EXTRACTION_VALUE_FORBIDDEN")
        digest = None
    return TaggedProposal(input_record, transformation, outcome, reason, digest, candidate_text)
