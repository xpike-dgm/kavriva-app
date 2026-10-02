"""Exact immutable snapshot binding; supplied reviewer/source references are fixtures.

No authenticated approval, complete canonical source, current permission or effect
is provided. Fingerprints bind supplied bytes; they cannot certify their meaning.
"""

from base64 import b64encode
from dataclasses import dataclass, field
from datetime import datetime, timezone
import hashlib
import json
import re


SECTION_NAMES = ("claims", "content", "applicability", "findings", "uncertainty", "conditions")


class BindingError(ValueError):
    def __init__(self, reason: str):
        self.reason = reason
        super().__init__(reason)


@dataclass(frozen=True)
class Reference:
    ref_id: str
    revision: int
    digest: str


@dataclass(frozen=True)
class Section:
    name: str
    payload: bytes = field(repr=False)


@dataclass(frozen=True)
class Artifact:
    artifact_id: str
    revision: int
    payload: bytes = field(repr=False)
    transformation_inputs: tuple[Reference, ...]


@dataclass(frozen=True)
class Snapshot:
    snapshot_id: str
    revision: int
    sections: tuple[Section, ...] = field(repr=False)
    sources: tuple[Reference, ...]
    media: tuple[Artifact, ...] = field(repr=False)
    dependencies: tuple[Reference, ...]
    evidence: tuple[Reference, ...]
    derived: tuple[Artifact, ...] = field(repr=False)
    transformation_inputs: tuple[Reference, ...]
    policy: Reference
    expires_at: datetime
    consequence_class: str


@dataclass(frozen=True)
class Review:
    snapshot_id: str
    revision: int
    snapshot_fingerprint: str
    reviewer_ref: str
    reviewer_role: str
    reviewer_scope_ref: str
    reviewed_at: datetime
    expires_at: datetime
    policy: Reference
    rationale_ref: str


@dataclass(frozen=True)
class ReviewBinding:
    snapshot: Snapshot = field(repr=False)
    review: Review = field(repr=False)
    binding_fingerprint: str

    @property
    def authority(self) -> str:
        return "NONE"


def _ref(value):
    return (type(value) is str and bool(value)
            and not any(char.isspace() or ord(char) < 32 for char in value))


def _digest(value):
    return type(value) is str and bool(re.fullmatch(r"[0-9a-f]{64}", value))


def _revision(value):
    return type(value) is int and value > 0


def _time(value):
    return type(value) is datetime and value.tzinfo is timezone.utc


def _reference(value):
    if (type(value) is not Reference or not _ref(value.ref_id)
            or not _revision(value.revision) or not _digest(value.digest)):
        raise BindingError("REFERENCE_INVALID")
    return [value.ref_id, value.revision, value.digest]


def _references(values):
    if type(values) is not tuple:
        raise BindingError("REFERENCE_SET_INVALID")
    result = [_reference(value) for value in values]
    if len({(value[0], value[1]) for value in result}) != len(result):
        raise BindingError("REFERENCE_DUPLICATE")
    return result


def _artifacts(values, *, derived):
    if type(values) is not tuple:
        raise BindingError("ARTIFACT_SET_INVALID")
    result = []
    for value in values:
        if (type(value) is not Artifact or not _ref(value.artifact_id)
                or not _revision(value.revision) or type(value.payload) is not bytes
                or not value.payload):
            raise BindingError("ARTIFACT_INVALID")
        inputs = _references(value.transformation_inputs)
        if derived and not inputs:
            raise BindingError("DERIVATION_INPUTS_REQUIRED")
        result.append([value.artifact_id, value.revision,
                       b64encode(value.payload).decode("ascii"), inputs])
    if len({(value[0], value[1]) for value in result}) != len(result):
        raise BindingError("ARTIFACT_DUPLICATE")
    return result


def _fingerprint(value):
    # Internal envelope only: opaque section/artifact bytes are not parsed or
    # normalized. This chooses no product content, export or publication format.
    raw = json.dumps(value, sort_keys=True, separators=(",", ":"),
                     ensure_ascii=True).encode("ascii")
    return hashlib.sha256(raw).hexdigest()


def snapshot_fingerprint(snapshot: Snapshot) -> str:
    if (type(snapshot) is not Snapshot or not _ref(snapshot.snapshot_id)
            or not _revision(snapshot.revision) or not _time(snapshot.expires_at)
            or not _ref(snapshot.consequence_class)
            or type(snapshot.sections) is not tuple
            or len(snapshot.sections) != len(SECTION_NAMES)):
        raise BindingError("SNAPSHOT_CONTEXT_INVALID")
    sections = []
    for value, name in zip(snapshot.sections, SECTION_NAMES):
        if (type(value) is not Section or type(value.name) is not str or value.name != name
                or type(value.payload) is not bytes or not value.payload):
            raise BindingError("SNAPSHOT_SECTION_REQUIRED")
        sections.append([name, b64encode(value.payload).decode("ascii")])
    sources = _references(snapshot.sources)
    if not sources:
        raise BindingError("SOURCE_CONTEXT_REQUIRED")
    return _fingerprint({
        "snapshot_id": snapshot.snapshot_id, "revision": snapshot.revision,
        "sections": sections, "sources": sources,
        "media": _artifacts(snapshot.media, derived=False),
        "dependencies": _references(snapshot.dependencies),
        "evidence": _references(snapshot.evidence),
        "derived": _artifacts(snapshot.derived, derived=True),
        "transformation_inputs": _references(snapshot.transformation_inputs),
        "policy": _reference(snapshot.policy), "expires_at": snapshot.expires_at.isoformat(),
        "consequence_class": snapshot.consequence_class,
    })


def bind_review(snapshot: Snapshot, review: Review, *, server_time: datetime) -> ReviewBinding:
    fingerprint = snapshot_fingerprint(snapshot)
    if (type(review) is not Review or not _time(server_time)
            or any(not _ref(value) for value in (
                review.snapshot_id, review.reviewer_ref, review.reviewer_role,
                review.reviewer_scope_ref, review.rationale_ref,
            )) or not _revision(review.revision) or not _digest(review.snapshot_fingerprint)
            or not _time(review.reviewed_at) or not _time(review.expires_at)):
        raise BindingError("REVIEW_CONTEXT_INVALID")
    policy = _reference(review.policy)
    if review.reviewer_role not in {"domain_reviewer", "safety_approver"}:
        raise BindingError("REVIEW_ROLE_INVALID")
    if (review.snapshot_id != snapshot.snapshot_id or review.revision != snapshot.revision
            or review.snapshot_fingerprint != fingerprint or review.policy != snapshot.policy):
        raise BindingError("REVIEW_SNAPSHOT_MISMATCH")
    if (review.reviewed_at > server_time or review.expires_at <= server_time
            or snapshot.expires_at <= server_time):
        raise BindingError("REVIEW_OR_SNAPSHOT_STALE")
    binding_fingerprint = _fingerprint({
        "snapshot": fingerprint, "reviewer": review.reviewer_ref,
        "role": review.reviewer_role, "scope": review.reviewer_scope_ref,
        "reviewed_at": review.reviewed_at.isoformat(), "expires_at": review.expires_at.isoformat(),
        "policy": policy, "rationale": review.rationale_ref,
    })
    return ReviewBinding(snapshot, review, binding_fingerprint)


def require_exact_binding(binding: ReviewBinding, candidate: Snapshot,
                          *, server_time: datetime) -> None:
    """Validate immutable linkage; success is never current publication authority."""
    if type(binding) is not ReviewBinding or not _digest(binding.binding_fingerprint):
        raise BindingError("REVIEW_BINDING_INVALID")
    original = bind_review(binding.snapshot, binding.review, server_time=server_time)
    if original.binding_fingerprint != binding.binding_fingerprint:
        raise BindingError("REVIEW_BINDING_CHANGED")
    if snapshot_fingerprint(candidate) != snapshot_fingerprint(binding.snapshot):
        raise BindingError("SNAPSHOT_CHANGED")
