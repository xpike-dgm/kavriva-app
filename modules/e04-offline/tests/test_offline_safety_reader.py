import json
import sys
from pathlib import Path
from types import SimpleNamespace
import unittest

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "public"))
sys.path.insert(0, str(ROOT / "internal"))
from offline_safety_reader import read_safety_status, CONTEXT_KEYS, RETAINED
from offline_eligibility import production_gate, EligibilityDecision


class PublicSafetyReaderTests(unittest.TestCase):
    def setUp(self):
        self.context = {k: "fixture-" + k for k in CONTEXT_KEYS}

    def test_actual_existing_e4_production_gate_crosses_public_wire_without_authority(self):
        calls = []
        def reader(request):
            calls.append(request.copy())
            return production_gate(request)
        wire = read_safety_status(self.context, reader)
        self.assertEqual(calls, [self.context])
        self.assertEqual(json.loads(json.dumps(wire)), wire)
        self.assertEqual(wire["reason"], production_gate().reason)
        self.assertEqual(wire["context"], self.context)
        self.assertFalse(wire["physicalProgression"])
        self.assertEqual(wire["authority"], "NONE")
        self.assertEqual(wire["retainedContexts"], list(RETAINED))

    def test_absent_failed_or_invalid_readers_cannot_reopen(self):
        self.assertEqual(read_safety_status(self.context)["reason"],
                         "HELD_OFFLINE_SAFETY_READER_UNAVAILABLE")
        def fails(_): raise RuntimeError("private-credential-never-echo")
        for reader in (fails, lambda _: None):
            wire = read_safety_status(self.context, reader)
            self.assertEqual(wire["reason"], "HELD_OFFLINE_SAFETY_READER_FAILED")
            self.assertNotIn("private-credential", json.dumps(wire))
            self.assertFalse(wire["physicalProgression"])
        self.assertEqual(read_safety_status(self.context, 7)["reason"],
                         "HELD_INVALID_OFFLINE_SAFETY_RESPONSE")

    def test_forged_positive_ambiguous_type_authority_or_missing_recovery_is_rejected(self):
        valid = dict(reason=production_gate().reason, authority="NONE",
                     physical_progression=False, retained_contexts=RETAINED)
        for changed in ({"reason": "ALLOW"}, {"authority": "CANONICAL"},
                        {"physical_progression": True}, {"physical_progression": 0},
                        {"retained_contexts": ()}, {"retained_contexts": list(RETAINED)}):
            decision = SimpleNamespace(**(valid | changed))
            wire = read_safety_status(self.context, lambda _: decision)
            self.assertEqual(wire["reason"], "HELD_INVALID_OFFLINE_SAFETY_RESPONSE")
            self.assertFalse(wire["physicalProgression"])

    def test_every_real_negative_decision_reason_remains_negative(self):
        for reason in ("HELD_CACHED_CONTEXT_MISMATCH", "BLOCKED_CACHED_NEGATIVE_RESTRICTION",
                       "BLOCKED_CACHED_NEGATIVE_GENERATION", "HELD_UNTRUSTED_OFFLINE_CONTEXT",
                       "HELD_UNCLASSIFIED_RISK", "HELD_UNCERTAIN_RISK_DEPENDENCY"):
            wire = read_safety_status(self.context, lambda _: EligibilityDecision(reason, None))
            self.assertEqual(wire["reason"], reason)
            self.assertFalse(wire["physicalProgression"])

    def test_full_display_tuple_is_required_before_calling_reader(self):
        calls = []
        for key in CONTEXT_KEYS:
            for context in ({k: v for k, v in self.context.items() if k != key},
                            self.context | {key: ""}, self.context | {key: None},
                            self.context | {key: " padded "}):
                with self.assertRaisesRegex(ValueError, "^INVALID_DISPLAY_CONTEXT$"):
                    read_safety_status(context, lambda _: calls.append(True))
        with self.assertRaises(ValueError):
            read_safety_status(self.context | {"extra": "old"})
        self.assertEqual(calls, [])

    def test_reader_cannot_rebind_input_or_mutate_prior_output(self):
        original = self.context.copy()
        def reader(request):
            request["stepId"] = "reader-rebound"
            self.context["stepId"] = "foreign"
            return production_gate()
        first = read_safety_status(self.context, reader)
        self.assertEqual(first["context"], original)
        first["context"]["stepId"] = "forged"
        first["retainedContexts"].clear()
        second = read_safety_status(original, production_gate)
        self.assertEqual(second["context"], original)
        self.assertEqual(second["retainedContexts"], list(RETAINED))
        self.assertFalse(second["physicalProgression"])


if __name__ == "__main__":
    unittest.main()
