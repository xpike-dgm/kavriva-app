"""Internal optional-media lifecycle model; no network or disk implementation.

Intent, classification and state are supplied declarations, not authentication.
All outputs intrinsically NONE. A runtime consumer still needs canonical E3
source/classification, real E1 user intent and proven encrypted storage/transfer.
"""
from dataclasses import dataclass, replace
from hashlib import sha256
import json

from core_composition import (Scope, Reference, Declaration, Assessment, InvalidComposition,
                              declaration_digest,
                              _scope, _reference, _id, _digest)
from safety_media_nesting import check_nesting


@dataclass(frozen=True)
class OptionalSpec:
    core_declaration: Declaration
    core_scope: Scope
    core_digest: str
    media_ref: Reference
    declared_bytes: int
    classification: str


@dataclass(frozen=True)
class UserRequest:
    request_id: str
    spec_digest: str
    action: str


@dataclass(frozen=True)
class OptionalRecord:
    spec: OptionalSpec
    state: str
    request_ids: tuple[str, ...]
    active_request: UserRequest | None
    completed_digest: str | None

    @property
    def authority(self):
        return "NONE"


def spec_digest(spec):
    if type(spec) is not OptionalSpec:
        raise InvalidComposition("INVALID_OPTIONAL_SPEC")
    _scope(spec.core_scope)
    _reference(spec.media_ref)
    if (not _digest(spec.core_digest) or type(spec.declared_bytes) is not int
            or spec.declared_bytes < 1):
        raise InvalidComposition("INVALID_OPTIONAL_SPEC")
    if (declaration_digest(spec.core_declaration) != spec.core_digest
            or spec.core_declaration.scope != spec.core_scope):
        raise InvalidComposition("OPTIONAL_CORE_CONTEXT_MISMATCH")
    if spec.media_ref.object_id in {entry.part_id for entry in spec.core_declaration.entries}:
        raise InvalidComposition("CORE_ESSENTIAL_ON_DEMAND")
    if type(spec.classification) is not str or spec.classification != "NONESSENTIAL":
        raise InvalidComposition("OPTIONAL_CLASSIFICATION_REQUIRED")
    scope, ref = spec.core_scope, spec.media_ref
    fields = ((scope.motorcycle_id, scope.task_id, scope.release_id, scope.generation),
              spec.core_digest, (ref.object_id, ref.revision, ref.digest),
              spec.declared_bytes, spec.classification)
    try:
        encoded = json.dumps(fields, separators=(",", ":"), ensure_ascii=True).encode("ascii")
    except (ValueError, TypeError, OverflowError, RecursionError):
        raise InvalidComposition("OPTIONAL_SPEC_ENCODING_FAILED") from None
    return sha256(encoded).hexdigest()


def _request(request, spec):
    if (type(request) is not UserRequest or not _id(request.request_id)
            or not _digest(request.spec_digest) or type(request.action) is not str
            or request.action != "USER_FETCH"):
        raise InvalidComposition("EXPLICIT_USER_REQUEST_REQUIRED")
    if request.spec_digest != spec_digest(spec):
        raise InvalidComposition("REQUEST_CONTEXT_MISMATCH")


def _record(record):
    if type(record) is not OptionalRecord:
        raise InvalidComposition("INVALID_OPTIONAL_RECORD")
    spec_digest(record.spec)
    if (type(record.state) is not str
            or record.state not in {"ABSENT", "REQUESTED", "AVAILABLE", "CANCELLED", "EVICTED"}
            or type(record.request_ids) is not tuple
            or any(not _id(i) for i in record.request_ids)
            or len(set(record.request_ids)) != len(record.request_ids)):
        raise InvalidComposition("INVALID_OPTIONAL_RECORD")
    if record.state == "REQUESTED":
        _request(record.active_request, record.spec)
        if (not record.request_ids or record.active_request.request_id != record.request_ids[-1]
                or record.completed_digest is not None):
            raise InvalidComposition("INVALID_OPTIONAL_RECORD")
    elif record.active_request is not None:
        raise InvalidComposition("INVALID_OPTIONAL_RECORD")
    if record.state == "ABSENT":
        if record.request_ids or record.completed_digest is not None:
            raise InvalidComposition("INVALID_OPTIONAL_RECORD")
    elif not record.request_ids:
        raise InvalidComposition("INVALID_OPTIONAL_RECORD")
    if record.state == "AVAILABLE":
        if not _digest(record.completed_digest) or record.completed_digest != record.spec.media_ref.digest:
            raise InvalidComposition("INVALID_OPTIONAL_RECORD")
    elif record.completed_digest is not None:
        raise InvalidComposition("INVALID_OPTIONAL_RECORD")


def prepare_optional(core, expected_scope, expected_core_digest, core_parts,
                     media_ref, declared_bytes, classification):
    """Exclude all required IDs; initial state creates no automatic fetch."""
    check_nesting(core, expected_scope, expected_core_digest, core_parts, (media_ref,))
    spec = OptionalSpec(core, expected_scope, expected_core_digest, media_ref, declared_bytes, classification)
    spec_digest(spec)
    return OptionalRecord(spec, "ABSENT", (), None, None)


def request_optional(record, request):
    _record(record)
    _request(request, record.spec)
    if record.state == "REQUESTED" and request == record.active_request:
        return record
    if record.state not in {"ABSENT", "CANCELLED", "EVICTED"}:
        raise InvalidComposition("OPTIONAL_REQUEST_STATE_CONFLICT")
    if request.request_id in record.request_ids:
        raise InvalidComposition("REQUEST_REPLAY_AFTER_TERMINAL_STATE")
    return replace(record, state="REQUESTED", request_ids=record.request_ids + (request.request_id,),
                   active_request=request, completed_digest=None)


def cancel_optional(record, request_id):
    _record(record)
    if not _id(request_id):
        raise InvalidComposition("INVALID_REQUEST_ID")
    if record.state == "CANCELLED" and request_id == record.request_ids[-1]:
        return record
    if record.state != "REQUESTED" or request_id != record.active_request.request_id:
        raise InvalidComposition("STALE_OPTIONAL_REQUEST")
    return replace(record, state="CANCELLED", active_request=None)


def complete_optional(record, request_id, payload):
    _record(record)
    if (not _id(request_id) or record.state != "REQUESTED"
            or request_id != record.active_request.request_id):
        raise InvalidComposition("STALE_OPTIONAL_REQUEST")
    if type(payload) is not bytes or len(payload) != record.spec.declared_bytes:
        raise InvalidComposition("OPTIONAL_SIZE_MISMATCH")
    if sha256(payload).hexdigest() != record.spec.media_ref.digest:
        raise InvalidComposition("OPTIONAL_DIGEST_MISMATCH")
    return replace(record, state="AVAILABLE", active_request=None,
                   completed_digest=record.spec.media_ref.digest)


def evict_optional(record):
    _record(record)
    if record.state == "EVICTED":
        return record
    if record.state not in {"AVAILABLE", "CANCELLED"}:
        raise InvalidComposition("OPTIONAL_EVICTION_STATE_CONFLICT")
    return replace(record, state="EVICTED", completed_digest=None)


def production_gate(request=None):
    return Assessment("HELD_CANONICAL_OPTIONAL_SOURCE_AND_RUNTIME_MISSING")
