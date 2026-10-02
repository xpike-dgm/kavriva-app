"""Pure stage/verify/all-or-nothing replacement contract; no storage promotion.

References, classifications, free space and current pins are supplied data.
Coherent declarations are not trusted compatibility, authority or disk evidence.
"""
from dataclasses import dataclass

from core_composition import (Scope, Reference, Declaration, Part, Assessment,
                              InvalidComposition, declaration_digest, check_composition,
                              _scope, _reference, _id, _digest)


DISPOSABLE_ORDER = ("INVALID_OR_ORPHAN_TEMP", "NONESSENTIAL_MEDIA",
                    "OLD_INACTIVE_REFETCHABLE_CACHE", "REBUILDABLE_PROJECTION")
PROTECTED = frozenset({"ACTIVE_TASK_COMPLETE_PACKAGE", "REQUIRED_SAFETY_MEDIA",
                       "DURABLE_USER_DATA", "PENDING_OR_ACCEPTED_OPERATION_TRUTH",
                       "PROTECTED_AUDIT_OR_AUTHORITY", "NEGATIVE_FLOOR"})


@dataclass(frozen=True)
class Stage:
    declaration: Declaration
    expected_scope: Scope
    expected_digest: str
    parts: tuple[Part, ...]

    @property
    def authority(self): return "NONE"


@dataclass(frozen=True)
class VerificationContext:
    applicability: Reference
    compatibility: Reference
    dependencies: tuple[Reference, ...]


@dataclass(frozen=True)
class VerifiedCandidate:
    stage: Stage
    context: VerificationContext

    @property
    def authority(self): return "NONE"


@dataclass(frozen=True)
class Disposable:
    object_id: str
    data_class: str
    byte_count: int


@dataclass(frozen=True)
class SpaceDeclaration:
    free_bytes: int  # Already excludes the retained old package's occupancy.
    verification_extra_bytes: int
    disposable: tuple[Disposable, ...]


@dataclass(frozen=True)
class PromotionProposal:
    expected_current_digest: str | None
    replacement: VerifiedCandidate
    retained_previous: VerifiedCandidate | None
    peak_package_bytes: int
    proposed_cleanup_ids: tuple[str, ...]

    @property
    def authority(self): return "NONE"


def _stage(stage):
    if type(stage) is not Stage:
        raise InvalidComposition("INVALID_STAGE")
    _scope(stage.expected_scope)
    if not _digest(stage.expected_digest):
        raise InvalidComposition("INVALID_MANIFEST_PIN")
    try:
        actual = declaration_digest(stage.declaration)
    except InvalidComposition:
        raise
    except (ValueError, TypeError, OverflowError, RecursionError):
        raise InvalidComposition("STAGE_CONTEXT_ENCODING_FAILED") from None
    if stage.declaration.scope != stage.expected_scope or actual != stage.expected_digest:
        raise InvalidComposition("STAGE_CONTEXT_MISMATCH")
    if type(stage.parts) is not tuple:
        raise InvalidComposition("MUTABLE_STAGE")
    for part in stage.parts:
        if type(part) is not Part or type(part.payload) is not bytes:
            raise InvalidComposition("INVALID_STAGE_PART")
        _scope(part.scope)
        if not _id(part.part_id):
            raise InvalidComposition("INVALID_STAGE_PART")


def stage_package(declaration, expected_scope, expected_digest, parts):
    """An immutable stage may still be incomplete; it cannot be actionable."""
    stage = Stage(declaration, expected_scope, expected_digest, parts)
    _stage(stage)
    return stage


def verify_stage(stage, context):
    _stage(stage)
    if type(context) is not VerificationContext:
        raise InvalidComposition("VERIFICATION_CONTEXT_REQUIRED")
    _reference(context.applicability)
    _reference(context.compatibility)
    if type(context.dependencies) is not tuple:
        raise InvalidComposition("INVALID_DEPENDENCY_CONTEXT")
    for ref in context.dependencies:
        _reference(ref)
    if len({ref.object_id for ref in context.dependencies}) != len(context.dependencies):
        raise InvalidComposition("INVALID_DEPENDENCY_CONTEXT")
    declared = stage.declaration
    if declared.applicability != context.applicability:
        raise InvalidComposition("APPLICABILITY_CONTEXT_MISMATCH")
    if declared.compatibility != context.compatibility:
        raise InvalidComposition("COMPATIBILITY_CONTEXT_MISMATCH")
    if declared.dependencies != context.dependencies:
        raise InvalidComposition("DEPENDENCY_CONTEXT_MISMATCH")
    check_composition(declared, stage.expected_scope, stage.expected_digest, stage.parts)
    return VerifiedCandidate(stage, context)


def _verified(candidate):
    if type(candidate) is not VerifiedCandidate:
        raise InvalidComposition("VERIFIED_CANDIDATE_REQUIRED")
    # Never trust a caller's constructed 'verified' marker.
    return verify_stage(candidate.stage, candidate.context)


def _space(space, protected_ids, required_additional):
    if (type(space) is not SpaceDeclaration or type(space.free_bytes) is not int
            or space.free_bytes < 0 or type(space.verification_extra_bytes) is not int
            or space.verification_extra_bytes < 0 or type(space.disposable) is not tuple):
        raise InvalidComposition("INVALID_SPACE_DECLARATION")
    seen = set()
    for item in space.disposable:
        if (type(item) is not Disposable or not _id(item.object_id)
                or type(item.data_class) is not str or type(item.byte_count) is not int
                or item.byte_count < 1):
            raise InvalidComposition("INVALID_DISPOSABLE_DECLARATION")
        if item.data_class in PROTECTED or item.object_id in protected_ids:
            raise InvalidComposition("PROTECTED_EVICTION_FORBIDDEN")
        if item.data_class not in DISPOSABLE_ORDER:
            raise InvalidComposition("UNKNOWN_EVICTION_CLASS")
        if item.object_id in seen:
            raise InvalidComposition("DUPLICATE_DISPOSABLE")
        seen.add(item.object_id)
    available = space.free_bytes
    cleanup = []
    for item in sorted(space.disposable, key=lambda row: DISPOSABLE_ORDER.index(row.data_class)):
        if available >= required_additional:
            break
        available += item.byte_count
        cleanup.append(item.object_id)
    return tuple(cleanup) if available >= required_additional else None


def propose_promotion(current, candidate, expected_current_digest, space):
    """Return one whole replacement proposal or hold; mutate nothing.

    Actual encrypted storage must implement atomic compare-and-swap and crash
    recovery before this proposal could be used. No runtime gate opens here.
    """
    candidate = _verified(candidate)
    old_bytes = 0
    if current is None:
        if expected_current_digest is not None:
            raise InvalidComposition("CURRENT_PIN_MISMATCH")
    else:
        current = _verified(current)
        if not _digest(expected_current_digest) or current.stage.expected_digest != expected_current_digest:
            raise InvalidComposition("CURRENT_PIN_MISMATCH")
        old, new = current.stage.expected_scope, candidate.stage.expected_scope
        if (old.motorcycle_id, old.task_id) != (new.motorcycle_id, new.task_id):
            raise InvalidComposition("TRANSITION_SELECTED_SCOPE_MISMATCH")
        if new.generation <= old.generation:
            raise InvalidComposition("STALE_PACKAGE_GENERATION")
        old_bytes = sum(len(part.payload) for part in current.stage.parts)
    if type(space) is not SpaceDeclaration or type(space.verification_extra_bytes) is not int:
        raise InvalidComposition("INVALID_SPACE_DECLARATION")
    new_bytes = sum(len(part.payload) for part in candidate.stage.parts)
    protected_ids = {entry.part_id for entry in candidate.stage.declaration.entries}
    if current is not None:
        protected_ids.update(entry.part_id for entry in current.stage.declaration.entries)
    cleanup = _space(space, protected_ids, new_bytes + space.verification_extra_bytes)
    if cleanup is None:
        return Assessment("HELD_INSUFFICIENT_STAGING_SPACE")
    return PromotionProposal(expected_current_digest, candidate, current,
                             old_bytes + new_bytes + space.verification_extra_bytes, cleanup)


def production_gate(request=None):
    return Assessment("HELD_CANONICAL_PACKAGE_SOURCE_AND_ATOMIC_ENCRYPTED_STORE_MISSING")
