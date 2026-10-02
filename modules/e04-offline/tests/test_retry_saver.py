import sys
from dataclasses import replace, FrozenInstanceError
from pathlib import Path
import unittest

sys.path.insert(0, str(Path(__file__).resolve().parents[1] / "internal"))
from core_composition import InvalidComposition
from required_auto_transfer import TransferItem, plan_transfers
from retry_saver import SAVER_STATES, RESUME_CAPABILITIES, transfer_policy, production_gate
import test_required_auto_transfer as accepted_fixture


class RetrySaverTests(unittest.TestCase):
    def setUp(self):
        # Reuse accepted same-capsule fixture, not an OS or source adapter.
        fixture = accepted_fixture.RequiredAutoTransferTests()
        fixture.setUp()
        self.need, self.optional = fixture.need, fixture.requested
        self.plan = plan_transfers(self.need, (self.optional,), "CELLULAR")

    def test_normal_is_declared_eligibility_only_not_dispatch(self):
        result = transfer_policy(self.plan, "NORMAL", "SUPPORTED")
        self.assertEqual(result.execution_state, "DECLARED_OS_ELIGIBLE")
        self.assertEqual(result.authority, "NONE")
        self.assertEqual(result.retry_mode, "NOT_INTERRUPTED")

    def test_savers_delay_without_confirmation(self):
        for state in ("DATA_SAVER", "LOW_DATA_MODE", "CONSTRAINED"):
            result = transfer_policy(self.plan, state, "SUPPORTED", True)
            self.assertEqual(result.execution_state, "DELAYED_OS_CONSTRAINT")
            self.assertFalse(result.confirmation_required)
            self.assertEqual(result.proposal, self.plan)

    def test_unknown_saver_holds_without_user_gate(self):
        result = transfer_policy(self.plan)
        self.assertEqual(result.execution_state, "HELD_OS_STATE_UNKNOWN")
        self.assertFalse(result.confirmation_required)

    def test_supported_interruption_describes_bounded_resume_but_values_held(self):
        result = transfer_policy(self.plan, "NORMAL", "SUPPORTED", True)
        self.assertEqual(result.retry_mode, "RESUMABLE_BOUNDED_WHERE_SUPPORTED_VALUES_HELD")
        self.assertEqual(result.retry_values, "HELD_UNSELECTED")
        self.assertEqual(result.authority, "NONE")

    def test_unsupported_and_unknown_never_claim_resume(self):
        for capability, reason in (("UNSUPPORTED", "RESUME_UNSUPPORTED"),
                                   ("UNKNOWN", "HELD_RESUME_CAPABILITY_UNKNOWN")):
            self.assertEqual(transfer_policy(self.plan, "NORMAL", capability, True).retry_mode, reason)

    def test_all_transports_constraints_and_capabilities_preserve_priority(self):
        for transport in ("WIFI", "CELLULAR", "ROAMING", "UNKNOWN", "OFFLINE"):
            plan = plan_transfers(self.need, (self.optional,), transport)
            for saver in SAVER_STATES:
                for capability in RESUME_CAPABILITIES:
                    for interrupted in (False, True):
                        result = transfer_policy(plan, saver, capability, interrupted)
                        self.assertEqual(result.proposal.ordered, self.plan.ordered)
                        self.assertEqual(tuple(i.kind for i in result.proposal.ordered),
                                         ("REQUIRED_CORE", "EXPLICIT_NONESSENTIAL"))
                        self.assertFalse(result.confirmation_required)
                        self.assertEqual(result.retry_values, "HELD_UNSELECTED")
                        self.assertEqual(result.authority, "NONE")

    def test_no_new_optional_intent_or_required_need_is_created(self):
        plan = plan_transfers(replace(self.need, task_requires_content=False))
        result = transfer_policy(plan, "DATA_SAVER", "SUPPORTED", True)
        self.assertEqual(result.proposal.ordered, ())
        self.assertEqual(result.proposal.optional, ())
        self.assertEqual(result.proposal.need.task_requires_content, False)

    def test_omitted_reordered_or_extra_proposal_members_rejected(self):
        for ordered in ((), self.plan.ordered[::-1], self.plan.ordered[1:],
                        self.plan.ordered + self.plan.ordered[:1]):
            with self.assertRaisesRegex(InvalidComposition, "TRANSFER_PROPOSAL_MISMATCH"):
                transfer_policy(replace(self.plan, ordered=ordered))

    def test_mutable_invalid_context_and_invalid_labels_rejected(self):
        for plan in (replace(self.plan, ordered=list(self.plan.ordered)),
                     replace(self.plan, optional=[]),
                     replace(self.plan, need=replace(self.need, classification="NONESSENTIAL"))):
            with self.assertRaises(InvalidComposition): transfer_policy(plan)
        for saver in (None, [], 1, "ALLOW", "normal"):
            with self.assertRaisesRegex(InvalidComposition, "INVALID_SAVER_STATE"):
                transfer_policy(self.plan, saver)
        for capability in (True, {}, "ALLOW", "supported"):
            with self.assertRaisesRegex(InvalidComposition, "INVALID_RESUME_CAPABILITY"):
                transfer_policy(self.plan, "NORMAL", capability)
        for interrupted in (0, 1, None, "yes"):
            with self.assertRaisesRegex(InvalidComposition, "INVALID_INTERRUPTION_STATE"):
                transfer_policy(self.plan, "NORMAL", "SUPPORTED", interrupted)

    def test_hostile_members_labels_and_callbacks_not_invoked(self):
        class Hostile:
            def __eq__(self, other): raise AssertionError("equality invoked")
            def __hash__(self): raise AssertionError("hash invoked")
            def __getattr__(self, name): raise AssertionError("attribute invoked")
        hostile = Hostile()
        for ordered in ((hostile,), (TransferItem("REQUIRED_CORE", hostile),)):
            with self.assertRaises(InvalidComposition): transfer_policy(replace(self.plan, ordered=ordered))
        with self.assertRaises(InvalidComposition): transfer_policy(hostile)
        with self.assertRaises(InvalidComposition): transfer_policy(self.plan, hostile)
        with self.assertRaises(InvalidComposition): transfer_policy(self.plan, "NORMAL", hostile)
        self.assertTrue(production_gate(hostile).reason.startswith("HELD_"))

    def test_immutable_policy_and_no_partial_or_completion_authority(self):
        result = transfer_policy(self.plan, "NORMAL", "SUPPORTED", True)
        with self.assertRaises(FrozenInstanceError): result.execution_state = "ALLOW"
        self.assertEqual(result.proposal, self.plan)
        self.assertEqual(result.authority, "NONE")
        self.assertEqual(self.optional.state, "REQUESTED")

    def test_coherent_forged_capability_and_state_cannot_open_runtime(self):
        result = transfer_policy(self.plan, "NORMAL", "SUPPORTED", True)
        for claim in (result, {"os_verified": True, "retry_bounds": 1, "encrypted": True}, lambda: "ALLOW"):
            self.assertEqual(production_gate(claim).reason,
                             "HELD_CANONICAL_OS_RESUME_RETRY_VALUES_AND_ENCRYPTED_RUNTIME_MISSING")


if __name__ == "__main__": unittest.main()
