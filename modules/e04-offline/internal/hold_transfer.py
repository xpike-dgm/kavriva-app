"""Held or declared staging proposal; never an executing transfer/store API."""
from dataclasses import dataclass, replace

from core_composition import Assessment, InvalidComposition
from stage_verify_promote import SpaceDeclaration, PromotionProposal, _verified, propose_promotion
from never_evict import guard_eviction


@dataclass(frozen=True)
class StagingOutcome:
    reason: str
    promotion: PromotionProposal | None

    @property
    def authority(self): return "NONE"

    @property
    def transfer_ready(self): return False


def assess_staging(current, candidate, expected_current_digest, space, classifications=()):
    """Retain protected truth and hold if disposable proposals cannot fit staging.

    free_bytes is supplied capacity already excluding the retained old package.
    Cleanup IDs are proposals, never receipts of actual deletion or freed space.
    Even a sufficient declared budget cannot open transfer or physical promotion.
    """
    if type(space) is not SpaceDeclaration:
        raise InvalidComposition("INVALID_SPACE_DECLARATION")
    candidate = _verified(candidate)
    current = _verified(current) if current is not None else None
    protected_ids = {entry.part_id for entry in candidate.stage.declaration.entries}
    if current is not None:
        protected_ids.update(entry.part_id for entry in current.stage.declaration.entries)
    cleanup = guard_eviction(space.disposable, classifications, tuple(sorted(protected_ids)))
    promotion = propose_promotion(current, candidate, expected_current_digest,
                                  replace(space, disposable=cleanup.ordered))
    if type(promotion) is Assessment:
        return StagingOutcome(promotion.reason, None)
    return StagingOutcome("DECLARED_STAGING_PROPOSAL_ONLY", promotion)


def production_gate(request=None):
    return Assessment("HELD_CANONICAL_CAPACITY_CLASSIFICATION_AND_ENCRYPTED_TRANSFER_RUNTIME_MISSING")
