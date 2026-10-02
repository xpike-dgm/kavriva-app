"""Declarative interruption and OS-saver policy; no executing retry scheduler.

Capabilities and OS states are supplied declarations. Numeric retry settings,
real resumability and durable encrypted staging require separate evidence.
"""
from dataclasses import dataclass

from core_composition import Assessment, InvalidComposition
from required_auto_transfer import TransferProposal, plan_transfers, _item


SAVER_STATES = frozenset({"NORMAL", "DATA_SAVER", "LOW_DATA_MODE", "CONSTRAINED", "UNKNOWN"})
RESUME_CAPABILITIES = frozenset({"SUPPORTED", "UNSUPPORTED", "UNKNOWN"})


@dataclass(frozen=True)
class ExecutionPolicy:
    proposal: TransferProposal
    saver_state: str
    resume_capability: str
    interrupted: bool
    execution_state: str
    retry_mode: str

    @property
    def confirmation_required(self): return False

    @property
    def retry_values(self): return "HELD_UNSELECTED"

    @property
    def authority(self): return "NONE"


def _proposal(proposal):
    if type(proposal) is not TransferProposal or type(proposal.ordered) is not tuple:
        raise InvalidComposition("INVALID_TRANSFER_PROPOSAL")
    expected = plan_transfers(proposal.need, proposal.optional, proposal.transport)
    for member in proposal.ordered:
        _item(member)
    if proposal.ordered != expected.ordered:
        raise InvalidComposition("TRANSFER_PROPOSAL_MISMATCH")


def transfer_policy(proposal, saver_state="UNKNOWN", resume_capability="UNKNOWN", interrupted=False):
    """Preserve a required-first plan without dispatching or choosing retry values.

    Normal means eligibility under the supplied OS declaration only. Constraints
    delay without confirmation. Supported interrupted transfers describe bounded
    resumable retry, but the unselected bounds prevent any actual retry here.
    Unsupported capability must not imply that resume or restart is implemented.
    """
    _proposal(proposal)
    if type(saver_state) is not str or saver_state not in SAVER_STATES:
        raise InvalidComposition("INVALID_SAVER_STATE")
    if type(resume_capability) is not str or resume_capability not in RESUME_CAPABILITIES:
        raise InvalidComposition("INVALID_RESUME_CAPABILITY")
    if type(interrupted) is not bool:
        raise InvalidComposition("INVALID_INTERRUPTION_STATE")
    execution = ("DECLARED_OS_ELIGIBLE" if saver_state == "NORMAL"
                 else "HELD_OS_STATE_UNKNOWN" if saver_state == "UNKNOWN"
                 else "DELAYED_OS_CONSTRAINT")
    retry = ("NOT_INTERRUPTED" if not interrupted
             else "RESUMABLE_BOUNDED_WHERE_SUPPORTED_VALUES_HELD" if resume_capability == "SUPPORTED"
             else "RESUME_UNSUPPORTED" if resume_capability == "UNSUPPORTED"
             else "HELD_RESUME_CAPABILITY_UNKNOWN")
    return ExecutionPolicy(proposal, saver_state, resume_capability, interrupted, execution, retry)


def production_gate(request=None):
    return Assessment("HELD_CANONICAL_OS_RESUME_RETRY_VALUES_AND_ENCRYPTED_RUNTIME_MISSING")
