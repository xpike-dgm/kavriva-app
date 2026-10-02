"""ADR009 R5 state meanings only; no persisted ledger or canonical receipts."""
from dataclasses import dataclass

from core_composition import Assessment, InvalidComposition


@dataclass(frozen=True)
class StateMeaning:
    state: str
    meaning: str

    @property
    def preservation_rule(self):
        return "RETAIN_OPERATION_IDENTITY_FINGERPRINT_AND_EXPECTED_VERSION_GENERATION"

    @property
    def canonical_acceptance(self): return False

    @property
    def authority(self): return "NONE"


STATE_MEANINGS = (
    StateMeaning("PENDING", "IDENTIFIED_USER_WORK_AWAITING_SUBMISSION"),
    StateMeaning("SUBMITTED", "SUBMISSION_IS_NOT_CANONICAL_ACCEPTANCE"),
    StateMeaning("ACCEPTED", "ACCEPTANCE_REQUIRES_CANONICAL_E3_RECEIPT"),
    StateMeaning("CONFLICT", "PRESERVE_CONFLICT_NO_SILENT_LAST_WRITE_WINS"),
    StateMeaning("HELD", "BLOCKED_WORK_RETAINED_WITHOUT_SUCCESS"),
    StateMeaning("FAILED", "FAILURE_RECORDED_WITHOUT_ERASING_USER_WORK"),
    StateMeaning("OUTCOME_UNKNOWN", "UNKNOWN_RESULT_REQUIRES_CANONICAL_LOOKUP"),
    StateMeaning("RECONCILING", "RESOLUTION_PENDING_CANONICAL_E3_LOOKUP"),
)


NONCANONICAL_RECEIPTS = frozenset({"LOCAL_WRITE", "HTTP_SUCCESS", "EMPTY_QUEUE",
                                  "DRIFT_TRANSACTION", "REALTIME_EVENT", "PUSH_RECEIPT"})


def describe_state(state):
    """Describe a known label without asserting that the operation is in it."""
    if type(state) is not str:
        raise InvalidComposition("INVALID_LEDGER_STATE")
    for description in STATE_MEANINGS:
        if description.state == state:
            return description
    raise InvalidComposition("UNKNOWN_LEDGER_STATE")


def local_receipt_gate(observation=None):
    return Assessment("HELD_CANONICAL_E3_OPERATION_ACCEPTANCE_MISSING")


def production_gate(request=None):
    return Assessment("HELD_OPERATION_IDENTITY_E3_LOOKUP_AND_ENCRYPTED_LEDGER_RUNTIME_MISSING")
