import sys
from dataclasses import FrozenInstanceError
from pathlib import Path
import unittest

sys.path.insert(0,str(Path(__file__).resolve().parents[1]/"internal"))
from core_composition import InvalidComposition
from ledger_states import STATE_MEANINGS, NONCANONICAL_RECEIPTS, describe_state, local_receipt_gate, production_gate


class LedgerStateTests(unittest.TestCase):
    def test_exact_eight_canonical_states_no_silent_fallback(self):
        self.assertEqual(tuple(row.state for row in STATE_MEANINGS),
                         ("PENDING","SUBMITTED","ACCEPTED","CONFLICT","HELD","FAILED","OUTCOME_UNKNOWN","RECONCILING"))
        self.assertEqual(len({row.state for row in STATE_MEANINGS}),8)
        self.assertEqual(len({row.meaning for row in STATE_MEANINGS}),8)

    def test_accepted_label_does_not_supply_a_canonical_receipt(self):
        description=describe_state("ACCEPTED")
        self.assertEqual(description.meaning,"ACCEPTANCE_REQUIRES_CANONICAL_E3_RECEIPT")
        self.assertFalse(description.canonical_acceptance)
        self.assertEqual(description.authority,"NONE")
        self.assertTrue(local_receipt_gate(description).reason.startswith("HELD_"))

    def test_submitted_unknown_reconciling_distinct_from_acceptance(self):
        submitted=describe_state("SUBMITTED")
        unknown=describe_state("OUTCOME_UNKNOWN")
        reconciling=describe_state("RECONCILING")
        self.assertEqual(submitted.meaning,"SUBMISSION_IS_NOT_CANONICAL_ACCEPTANCE")
        self.assertIn("CANONICAL_LOOKUP",unknown.meaning)
        self.assertIn("PENDING_CANONICAL_E3_LOOKUP",reconciling.meaning)
        for state in (submitted,unknown,reconciling):
            self.assertFalse(state.canonical_acceptance)
            self.assertEqual(state.authority,"NONE")

    def test_conflict_failure_hold_preserve_identified_user_work(self):
        self.assertEqual(describe_state("CONFLICT").meaning,"PRESERVE_CONFLICT_NO_SILENT_LAST_WRITE_WINS")
        self.assertIn("WITHOUT_ERASING_USER_WORK",describe_state("FAILED").meaning)
        self.assertIn("RETAINED_WITHOUT_SUCCESS",describe_state("HELD").meaning)
        for state in STATE_MEANINGS:
            self.assertEqual(state.preservation_rule,
                             "RETAIN_OPERATION_IDENTITY_FINGERPRINT_AND_EXPECTED_VERSION_GENERATION")
            self.assertFalse(state.canonical_acceptance)

    def test_six_noncanonical_receipts_never_accept(self):
        self.assertEqual(NONCANONICAL_RECEIPTS,frozenset({"LOCAL_WRITE","HTTP_SUCCESS","EMPTY_QUEUE",
                                                       "DRIFT_TRANSACTION","REALTIME_EVENT","PUSH_RECEIPT"}))
        for receipt in NONCANONICAL_RECEIPTS:
            self.assertEqual(local_receipt_gate(receipt).reason,"HELD_CANONICAL_E3_OPERATION_ACCEPTANCE_MISSING")
            self.assertEqual(local_receipt_gate({receipt:True}).authority,"NONE")
            with self.assertRaisesRegex(InvalidComposition,"UNKNOWN_LEDGER_STATE"):
                describe_state(receipt)

    def test_unknown_malformed_or_mutable_state_rejected(self):
        for label in ("", "accepted", "ALLOW", "QUEUED", "ACCEPTED ", "RESTORE_QUARANTINE"):
            with self.assertRaisesRegex(InvalidComposition,"UNKNOWN_LEDGER_STATE"):describe_state(label)
        for label in (None,True,1,{},[],("PENDING",)):
            with self.assertRaisesRegex(InvalidComposition,"INVALID_LEDGER_STATE"):describe_state(label)

    def test_hostile_types_and_subclasses_not_invoked(self):
        class Hostile:
            def __getattr__(self,name):raise AssertionError("attribute invoked")
            def __eq__(self,other):raise AssertionError("equality invoked")
        class HostileString(str):
            def __eq__(self,other):raise AssertionError("subclass equality invoked")
        for label in (Hostile(),HostileString("ACCEPTED")):
            with self.assertRaises(InvalidComposition):describe_state(label)
            self.assertTrue(local_receipt_gate(label).reason.startswith("HELD_"))
            self.assertTrue(production_gate(label).reason.startswith("HELD_"))

    def test_immutable_meanings_and_coherent_forgery_production_held(self):
        with self.assertRaises(FrozenInstanceError):describe_state("PENDING").state="ACCEPTED"
        for claim in (describe_state("ACCEPTED"),{"state":"ACCEPTED","e3_verified":True,"encrypted":True},lambda:"ALLOW"):
            self.assertEqual(production_gate(claim).reason,
                             "HELD_OPERATION_IDENTITY_E3_LOOKUP_AND_ENCRYPTED_LEDGER_RUNTIME_MISSING")


if __name__ == "__main__":unittest.main()
