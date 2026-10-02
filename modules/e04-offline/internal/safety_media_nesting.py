"""Internal safety-subset check; no generator, media classifier or size policy."""
from dataclasses import dataclass
import re

from core_composition import Reference, InvalidComposition, check_composition


@dataclass(frozen=True)
class NestedCore:
    required_core_bytes: int
    safety_subset_bytes: int
    safety_media_ids: tuple[str, ...]

    @property
    def authority(self):
        return "NONE"


def check_nesting(declaration, expected_scope, expected_digest, core_parts,
                  on_demand_refs=()):
    """Every declared safety byte stays inside the same verified supplied core.

    The safety byte count is a subset of required_core_bytes, never another
    budget. This function accepts no size target and never trims the core.
    On-demand references are only untrusted plan declarations; rejecting overlap
    does not authenticate their source, classification or runtime eligibility.
    """
    check_composition(declaration, expected_scope, expected_digest, core_parts)
    if type(on_demand_refs) is not tuple:
        raise InvalidComposition("MUTABLE_ON_DEMAND_PLAN")
    core_ids = {entry.part_id for entry in declaration.entries}
    seen = set()
    for ref in on_demand_refs:
        if (type(ref) is not Reference or type(ref.object_id) is not str
                or re.fullmatch(r"[A-Za-z0-9][A-Za-z0-9_.:-]*", ref.object_id) is None
                or type(ref.revision) is not str
                or re.fullmatch(r"[A-Za-z0-9][A-Za-z0-9_.:-]*", ref.revision) is None
                or type(ref.digest) is not str
                or re.fullmatch(r"[0-9a-f]{64}", ref.digest) is None):
            raise InvalidComposition("INVALID_ON_DEMAND_REFERENCE")
        if ref.object_id in core_ids:
            raise InvalidComposition("CORE_ESSENTIAL_ON_DEMAND")
        if ref.object_id in seen:
            raise InvalidComposition("DUPLICATE_ON_DEMAND_REFERENCE")
        seen.add(ref.object_id)
    safety_ids = tuple(entry.part_id for entry in declaration.entries
                       if entry.role == "safety_media")
    safety_set = set(safety_ids)
    total = sum(len(part.payload) for part in core_parts)
    subset = sum(len(part.payload) for part in core_parts if part.part_id in safety_set)
    return NestedCore(total, subset, safety_ids)
