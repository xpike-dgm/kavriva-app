"""Internal ADR-014 route proposals; no provider or canonical verification."""
from dataclasses import dataclass

PROPOSAL_CATEGORIES = (
    "KNOWN_TASK",
    "SYMPTOM_DIAGNOSTIC_FLOW",
    "MORE_CLARIFICATION_NEEDED",
    "UNSUPPORTED_UNKNOWN",
    "SAFETY_HOLD_ESCALATION",
)
_REFERENCE_CATEGORIES = PROPOSAL_CATEGORIES[:2]


class InvalidProposal(ValueError):
    """Finite local validation failure, without echoing untrusted content."""


@dataclass(frozen=True)
class Proposal:
    category: str
    target_reference: str | None = None

    def __post_init__(self) -> None:
        if type(self.category) is not str or self.category not in PROPOSAL_CATEGORIES:
            raise InvalidProposal("HELD_UNKNOWN_PROPOSAL_CATEGORY")
        if self.category in _REFERENCE_CATEGORIES:
            if type(self.target_reference) is not str or not self.target_reference.strip():
                raise InvalidProposal("HELD_TARGET_REFERENCE_MISSING_OR_INVALID")
        elif self.target_reference is not None:
            raise InvalidProposal("HELD_UNEXPECTED_TARGET_REFERENCE")

    @property
    def authority(self) -> str:
        return "NONE"

    @property
    def verification(self) -> str:
        return "HELD_E3_SIX_DIMENSION_VERIFICATION_MISSING"

    @property
    def physical_progression(self) -> bool:
        return False

    @property
    def reason_code(self) -> str:
        if self.category == "SAFETY_HOLD_ESCALATION":
            return "HELD_SAFETY_OR_INVALID_PROPOSAL"
        if self.category == "UNSUPPORTED_UNKNOWN":
            return "HELD_UNSUPPORTED_OR_UNKNOWN"
        if self.category == "MORE_CLARIFICATION_NEEDED":
            return "PROPOSED_MORE_OBSERVABLE_EVIDENCE_NEEDED"
        return "PROPOSED_TARGET_REFERENCE_NOT_VERIFIED"


def propose(category: object, target_reference: object = None) -> Proposal:
    """Bound supplied model inputs; references are opaque, not approved targets."""
    try:
        return Proposal(category, target_reference)
    except InvalidProposal:
        return Proposal("SAFETY_HOLD_ESCALATION")


def production_gate(*untrusted_claims: object, **untrusted_named_claims: object) -> str:
    """Missing actual E3 verification never becomes model/tool action authority."""
    return "HELD_E3_SIX_DIMENSION_VERIFICATION_MISSING"
