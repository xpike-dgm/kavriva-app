"""Complete-package-first fetch planning, not download or delta execution.

Supplied target/base references grant no canonical source or runtime authority.
Every returned plan still requires complete-byte verification and safe storage.
"""
from dataclasses import dataclass

from core_composition import Scope, Declaration, Assessment, InvalidComposition, _scope, _digest
from stage_verify_promote import Stage, _stage, _verified


@dataclass(frozen=True)
class PackageTarget:
    declaration: Declaration
    expected_scope: Scope
    expected_digest: str


@dataclass(frozen=True)
class DeltaHint:
    base_scope: Scope
    base_digest: str
    target_scope: Scope
    target_digest: str


@dataclass(frozen=True)
class FetchPlan:
    mode: str
    target: PackageTarget
    required_part_ids: tuple[str, ...]
    reason: str

    @property
    def authority(self): return "NONE"


def _target(target):
    if type(target) is not PackageTarget:
        raise InvalidComposition("INVALID_PACKAGE_TARGET")
    # Validate complete pinned metadata only; no package bytes exist in a plan.
    _stage(Stage(target.declaration, target.expected_scope, target.expected_digest, ()))


def _hint_matches(hint, current, target):
    if type(hint) is not DeltaHint:
        return False
    try:
        _scope(hint.base_scope)
        _scope(hint.target_scope)
    except InvalidComposition:
        return False
    if not _digest(hint.base_digest) or not _digest(hint.target_digest):
        return False
    return (hint.base_scope == current.stage.expected_scope
            and hint.base_digest == current.stage.expected_digest
            and hint.target_scope == target.expected_scope
            and hint.target_digest == target.expected_digest)


def plan_fetch(current, target, delta_hint=None):
    """Plan the complete selected target, never an actionable partial update.

    Even exact-base hints use the complete baseline: delta optimization remains
    deferred until measured savings and exact-base/ordering/verification proof.
    A bad current declaration may permit a fetch *plan*, never stale-use rights.
    """
    _target(target)
    reason = "MISSING_DELTA_COMPLETE_PACKAGE"
    base = None
    if current is not None:
        try:
            base = _verified(current)
        except InvalidComposition:
            reason = "UNUSABLE_BASE_COMPLETE_PACKAGE"
    if base is not None:
        old, new = base.stage.expected_scope, target.expected_scope
        if (old.motorcycle_id, old.task_id) != (new.motorcycle_id, new.task_id):
            raise InvalidComposition("FALLBACK_SELECTED_SCOPE_MISMATCH")
        if new.generation <= old.generation:
            raise InvalidComposition("STALE_FETCH_TARGET")
    if delta_hint is not None:
        if base is None:
            reason = "MISSING_OR_UNUSABLE_BASE_COMPLETE_PACKAGE"
        elif _hint_matches(delta_hint, base, target):
            reason = "DELTA_DEFERRED_COMPLETE_PACKAGE"
        else:
            reason = "STALE_OR_INVALID_DELTA_COMPLETE_PACKAGE"
    return FetchPlan("COMPLETE_PACKAGE", target,
                     tuple(entry.part_id for entry in target.declaration.entries), reason)


def production_gate(request=None):
    return Assessment("HELD_CANONICAL_PACKAGE_FETCH_AND_RUNTIME_MISSING")
