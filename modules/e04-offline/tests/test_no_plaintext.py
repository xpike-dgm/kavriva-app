import sys
from dataclasses import FrozenInstanceError, replace
from pathlib import Path
import unittest

sys.path.insert(0, str(Path(__file__).resolve().parents[1] / "internal"))
from core_composition import InvalidComposition
from no_plaintext import (LocalStorageIntent, StorageAssessment, OPERATIONS,
                          REPRESENTATIONS, evaluate, guarded_dispatch, production_gate)


class Hostile:
    def __getattribute__(self, name):
        raise AssertionError("must not inspect supplied effect or hostile value")
    def __call__(self, *args, **kwargs):
        raise AssertionError("must not invoke a closed storage effect")
    def __eq__(self, other):
        raise AssertionError("must check exact types first")
    def __hash__(self):
        raise AssertionError("must check exact types first")


class NoPlaintextTests(unittest.TestCase):
    def test_plaintext_all_local_operation_routes_blocked(self):
        expected={"READ", "WRITE", "STAGE", "PROMOTE", "COPY", "BACKUP",
                  "RESTORE", "MIGRATE", "EXPORT", "FALLBACK"}
        self.assertEqual(OPERATIONS, expected)
        for operation in expected:
            with self.subTest(operation=operation):
                verdict=evaluate(LocalStorageIntent(operation, "PLAINTEXT"))
                self.assertEqual(verdict.reason, "BLOCKED_PLAINTEXT_LOCAL_STORAGE")
                self.assertEqual(verdict.authority, "NONE")
                self.assertFalse(verdict.local_storage_ready)

    def test_declared_encrypted_or_unknown_never_opens_storage(self):
        self.assertEqual(REPRESENTATIONS, {"PLAINTEXT", "ENCRYPTED", "UNKNOWN"})
        for operation in OPERATIONS:
            for representation in ("ENCRYPTED", "UNKNOWN"):
                with self.subTest(operation=operation, representation=representation):
                    verdict=evaluate(LocalStorageIntent(operation, representation))
                    self.assertTrue(verdict.reason.startswith("HELD_"))
                    self.assertIn("KEY_CUSTODY", verdict.reason)
                    self.assertEqual(verdict.authority, "NONE")
                    self.assertFalse(verdict.local_storage_ready)

    def test_effect_not_invoked_on_any_closed_route(self):
        calls=[]
        def write():
            calls.append("storage write")
            raise AssertionError("must remain closed")
        for operation in OPERATIONS:
            for representation in REPRESENTATIONS:
                verdict=guarded_dispatch(LocalStorageIntent(operation,representation),write)
                self.assertFalse(verdict.local_storage_ready)
        self.assertEqual(calls, [])

    def test_closed_gate_does_not_inspect_effect(self):
        for representation in REPRESENTATIONS:
            verdict=guarded_dispatch(LocalStorageIntent("BACKUP", representation),Hostile())
            self.assertFalse(verdict.local_storage_ready)
        self.assertFalse(guarded_dispatch(LocalStorageIntent("READ","UNKNOWN")).local_storage_ready)

    def test_invalid_intent_rejects_before_effect(self):
        class IntentSubclass(LocalStorageIntent): pass
        for bad in (None, {}, [], ("WRITE","PLAINTEXT"), Hostile(),
                    IntentSubclass("WRITE","PLAINTEXT")):
            with self.subTest(type=type(bad).__name__):
                with self.assertRaisesRegex(InvalidComposition,"^INVALID_LOCAL_STORAGE_INTENT$"):
                    guarded_dispatch(bad,Hostile())

    def test_operation_type_and_unknown_values_fail_finitely(self):
        class TextSubclass(str): pass
        for bad in (None, False, 10**5000, [], {}, Hostile(), TextSubclass("WRITE"),
                    "", "write", "DELETE", "WRITE secret/key/path"):
            with self.assertRaisesRegex(InvalidComposition,"^INVALID_LOCAL_STORAGE_OPERATION$"):
                guarded_dispatch(LocalStorageIntent(bad,"PLAINTEXT"),Hostile())

    def test_representation_type_and_unknown_values_fail_finitely(self):
        class TextSubclass(str): pass
        for bad in (None, True, 10**5000, [], {}, Hostile(), TextSubclass("PLAINTEXT"),
                    "", "plaintext", "HTTPS", "SERVER_ENCRYPTED", "secret/key/path"):
            with self.assertRaisesRegex(InvalidComposition,"^INVALID_LOCAL_STORAGE_REPRESENTATION$"):
                guarded_dispatch(LocalStorageIntent("RESTORE",bad),Hostile())

    def test_immutable_intent_and_intrinsic_negative_assessment(self):
        intent=LocalStorageIntent("WRITE","PLAINTEXT")
        with self.assertRaises(FrozenInstanceError): intent.representation="ENCRYPTED"
        verdict=evaluate(intent)
        with self.assertRaises(FrozenInstanceError): verdict.reason="ALLOW"
        with self.assertRaises(FrozenInstanceError): verdict.local_storage_ready=True
        forged=StorageAssessment("ALLOW")
        self.assertFalse(forged.local_storage_ready)
        self.assertEqual(forged.authority,"NONE")
        self.assertFalse(evaluate(replace(intent,representation="ENCRYPTED")).local_storage_ready)

    def test_complete_claimed_encryption_metadata_not_production_proof(self):
        claims={"encrypted":True, "verified":True, "key_custody":"proven",
                "device_proof":"passed", "https":True, "server_at_rest":True,
                "backup_encrypted":True, "runtime_ready":True, "effect":Hostile()}
        verdict=production_gate(claims)
        self.assertTrue(verdict.reason.startswith("HELD_"))
        self.assertFalse(verdict.local_storage_ready)
        self.assertEqual(verdict.authority,"NONE")
        self.assertEqual(production_gate(Hostile()),verdict)
        self.assertEqual(production_gate(),verdict)

    def test_no_fallback_after_encrypted_hold_or_invalid_declaration(self):
        calls=[]
        encrypted=guarded_dispatch(LocalStorageIntent("WRITE","ENCRYPTED"),lambda:calls.append("encrypted"))
        fallback=guarded_dispatch(LocalStorageIntent("FALLBACK","PLAINTEXT"),lambda:calls.append("plaintext"))
        self.assertTrue(encrypted.reason.startswith("HELD_"))
        self.assertTrue(fallback.reason.startswith("BLOCKED_"))
        with self.assertRaises(InvalidComposition):
            guarded_dispatch(LocalStorageIntent("WRITE","INVALID"),lambda:calls.append("fallback"))
        self.assertEqual(calls,[])


if __name__ == "__main__":
    unittest.main()
