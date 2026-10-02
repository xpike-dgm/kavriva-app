"""Qualitative ordering of declared disposable objects, never disk deletion.

Supplied classification/protection IDs are not trusted storage membership.
Actual cleanup requires a canonical classifier and proven encrypted runtime.
"""
from dataclasses import dataclass

from core_composition import Assessment, InvalidComposition, _id
from stage_verify_promote import Disposable, SpaceDeclaration, DISPOSABLE_ORDER, _space


@dataclass(frozen=True)
class EvictionOrder:
    ordered: tuple[Disposable, ...]

    @property
    def authority(self): return "NONE"


def order_eviction(candidates, protected_ids=()):
    """Order every validated candidate, retaining input order within class ties.

    Zero required space invokes the accepted validator only: it is not a disk
    signal, selected threshold, permission to clean, or estimate of freed bytes.
    This proposal neither chooses how many objects to delete nor deletes any.
    """
    if type(protected_ids) is not tuple:
        raise InvalidComposition("INVALID_PROTECTED_OBJECT_IDS")
    for identity in protected_ids:
        if not _id(identity):
            raise InvalidComposition("INVALID_PROTECTED_OBJECT_IDS")
    if len(set(protected_ids)) != len(protected_ids):
        raise InvalidComposition("DUPLICATE_PROTECTED_OBJECT_ID")
    _space(SpaceDeclaration(0, 0, candidates), set(protected_ids), 0)
    ordered = tuple(sorted(candidates, key=lambda item: DISPOSABLE_ORDER.index(item.data_class)))
    return EvictionOrder(ordered)


def production_gate(request=None):
    return Assessment("HELD_CANONICAL_STORAGE_CLASSIFICATION_AND_ENCRYPTED_CLEANUP_RUNTIME_MISSING")
