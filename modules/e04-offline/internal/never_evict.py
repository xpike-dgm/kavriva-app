"""Six-class routine-eviction protection, using supplied classification only."""
from dataclasses import dataclass

from core_composition import Assessment, InvalidComposition, _id
from stage_verify_promote import PROTECTED, DISPOSABLE_ORDER
from eviction_order import order_eviction


@dataclass(frozen=True)
class StorageClassification:
    object_id: str
    data_classes: tuple[str, ...]


def _classification(declaration):
    if (type(declaration) is not StorageClassification or not _id(declaration.object_id)
            or type(declaration.data_classes) is not tuple):
        raise InvalidComposition("INVALID_STORAGE_CLASSIFICATION")
    for label in declaration.data_classes:
        if type(label) is not str or not label:
            raise InvalidComposition("INVALID_STORAGE_CLASSIFICATION")
    if len(set(declaration.data_classes)) != len(declaration.data_classes):
        raise InvalidComposition("DUPLICATE_STORAGE_CLASSIFICATION")


def assess_protection(declaration):
    """Protection dominates ambiguity; disposable-only is never permission."""
    _classification(declaration)
    labels = declaration.data_classes
    if any(label in PROTECTED for label in labels):
        return Assessment("NEVER_EVICT_PROTECTED_CLASS")
    if not labels or any(label not in DISPOSABLE_ORDER for label in labels):
        return Assessment("HELD_STORAGE_CLASSIFICATION_UNKNOWN")
    if len(labels) != 1:
        return Assessment("HELD_STORAGE_CLASSIFICATION_CONFLICT")
    return Assessment("DECLARED_DISPOSABLE_ONLY")


def guard_eviction(candidates, classifications, protected_ids=()):
    """Return an ordered proposal only for matching singleton declarations.

    Both inventory facts and candidate labels may be coherently false. This
    guard is not a canonical classifier, storage transaction or delete API.
    Extra classified inventory objects need not be cleanup candidates.
    """
    if type(classifications) is not tuple:
        raise InvalidComposition("MUTABLE_STORAGE_CLASSIFICATIONS")
    facts = {}
    decisions = {}
    for declaration in classifications:
        decision = assess_protection(declaration)
        if declaration.object_id in facts:
            raise InvalidComposition("DUPLICATE_STORAGE_OBJECT_CLASSIFICATION")
        facts[declaration.object_id] = declaration
        decisions[declaration.object_id] = decision.reason
    ordered = order_eviction(candidates, protected_ids)
    for candidate in ordered.ordered:
        if candidate.object_id not in facts:
            raise InvalidComposition("STORAGE_CLASSIFICATION_REQUIRED")
        decision = decisions[candidate.object_id]
        if decision == "NEVER_EVICT_PROTECTED_CLASS":
            raise InvalidComposition("PROTECTED_EVICTION_FORBIDDEN")
        if decision != "DECLARED_DISPOSABLE_ONLY":
            raise InvalidComposition(decision)
        if facts[candidate.object_id].data_classes != (candidate.data_class,):
            raise InvalidComposition("STORAGE_CLASSIFICATION_MISMATCH")
    return ordered


def production_gate(request=None):
    return Assessment("HELD_CANONICAL_PROTECTED_STORAGE_SOURCE_AND_ENCRYPTED_RUNTIME_MISSING")
