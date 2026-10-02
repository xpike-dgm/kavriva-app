"""Fixture publication expectations only; no transaction or publication authority.

E3 canonical floors and E5 authenticated authority/protected audit have no
release-specific public adapter yet. production_gate therefore always HELD.
"""

from dataclasses import dataclass
import hashlib
import json
import re

from snapshot_binding import ReviewBinding, require_exact_binding


class TransitionError(ValueError):
    def __init__(self, reason):
        self.reason = reason
        super().__init__(reason)


class FatalAuthorityError(TransitionError):
    """A backward generation is an authority fault, not a retry or rollback."""


@dataclass(frozen=True)
class PublicationRequest:
    scope_id: str
    operation_id: str
    expected_release_generation: int
    expected_floor_generation: int
    target_release_generation: int
    binding_fingerprint: str


@dataclass(frozen=True)
class FixtureCurrent:
    scope_id: str
    release_generation: int
    floor_generation: int
    suspended: bool
    restore_quarantined: bool


@dataclass(frozen=True)
class FixtureReceipt:
    scope_id: str
    operation_id: str
    request_fingerprint: str
    resulting_release_generation: int
    floor_generation: int


@dataclass(frozen=True)
class Assessment:
    reason: str
    request_fingerprint: str | None = None

    @property
    def authority(self):
        return "NONE"


def _id(value):
    return (type(value) is str and bool(value)
            and not any(c.isspace() or ord(c) < 32 for c in value))


def _generation(value):
    return type(value) is int and value >= 0


def _digest(value):
    return type(value) is str and bool(re.fullmatch(r"[0-9a-f]{64}", value))


def request_fingerprint(request):
    if (type(request) is not PublicationRequest or not _id(request.scope_id)
            or not _id(request.operation_id) or not _digest(request.binding_fingerprint)
            or any(not _generation(value) for value in (
                request.expected_release_generation, request.expected_floor_generation,
                request.target_release_generation))):
        raise TransitionError("REQUEST_INVALID")
    if request.target_release_generation <= request.expected_release_generation:
        raise FatalAuthorityError("RELEASE_GENERATION_BACKWARD_OR_EQUAL")
    # Not a release content format: exact supplied operation intent only.
    raw = json.dumps([request.scope_id, request.operation_id,
                      request.expected_release_generation, request.expected_floor_generation,
                      request.target_release_generation, request.binding_fingerprint],
                     separators=(",", ":"), ensure_ascii=True).encode("ascii")
    return hashlib.sha256(raw).hexdigest()


def assess_fixture_transition(request, current, binding, *, server_time, previous=None):
    """No locks, writer, authentic receipt or effect: structural fixtures only."""
    fingerprint = request_fingerprint(request)
    if (type(current) is not FixtureCurrent or not _id(current.scope_id)
            or not _generation(current.release_generation)
            or not _generation(current.floor_generation)
            or type(current.suspended) is not bool
            or type(current.restore_quarantined) is not bool):
        raise TransitionError("CURRENT_FIXTURE_INVALID")
    if type(binding) is not ReviewBinding:
        raise TransitionError("EXACT_REVIEW_BINDING_REQUIRED")
    require_exact_binding(binding, binding.snapshot, server_time=server_time)
    if request.binding_fingerprint != binding.binding_fingerprint:
        return Assessment("REVIEW_BINDING_CHANGED")
    if current.scope_id != request.scope_id:
        return Assessment("SCOPE_CHANGED")
    # Restore/stale metadata cannot pretend to lower either committed generation.
    if current.floor_generation < request.expected_floor_generation:
        raise FatalAuthorityError("FLOOR_GENERATION_BACKWARD")
    if current.release_generation < request.expected_release_generation:
        raise FatalAuthorityError("RELEASE_GENERATION_BACKWARD")
    if current.restore_quarantined:
        return Assessment("RESTORE_QUARANTINED")
    if current.floor_generation != request.expected_floor_generation:
        return Assessment("NEGATIVE_FENCE_CHANGED")
    if current.suspended:
        return Assessment("SUSPENDED")
    if previous is not None:
        if (type(previous) is not FixtureReceipt or not _id(previous.scope_id)
                or not _id(previous.operation_id) or not _digest(previous.request_fingerprint)
                or not _generation(previous.resulting_release_generation)
                or not _generation(previous.floor_generation)):
            raise TransitionError("PRIOR_FIXTURE_INVALID")
        if (previous.scope_id != request.scope_id or previous.operation_id != request.operation_id
                or previous.request_fingerprint != fingerprint):
            return Assessment("OPERATION_IDENTITY_CONFLICT")
        if (previous.resulting_release_generation != request.target_release_generation
                or previous.floor_generation != request.expected_floor_generation
                or current.release_generation != previous.resulting_release_generation):
            return Assessment("PRIOR_FIXTURE_MISMATCH")
        return Assessment("FIXTURE_RETRY_STRUCTURE_MATCH", fingerprint)
    if current.release_generation != request.expected_release_generation:
        return Assessment("CURRENT_RELEASE_CHANGED")
    return Assessment("FIXTURE_STRUCTURE_MATCH", fingerprint)


def production_gate(*args, **kwargs):
    # Never enter fixture evaluation, acquire a connection or perform an effect.
    return Assessment("HELD_CANONICAL_RELEASE_TRANSACTION_MISSING")
