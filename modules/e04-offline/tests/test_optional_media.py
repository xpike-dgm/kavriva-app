import sys
from dataclasses import replace, FrozenInstanceError
from hashlib import sha256
from pathlib import Path
import unittest

sys.path.insert(0, str(Path(__file__).resolve().parents[1] / "internal"))
from core_composition import Scope, Reference, Entry, Declaration, Part, InvalidComposition, declaration_digest
from optional_media import (UserRequest, prepare_optional, request_optional, cancel_optional,
                            complete_optional, evict_optional, spec_digest, production_gate)


class OptionalMediaTests(unittest.TestCase):
    def setUp(self):
        self.scope = Scope("motorcycle-1", "task-1", "release-1", 1)
        self.parts = tuple(Part(self.scope, role, role.encode()) for role in
                           ("text", "steps", "warnings", "checks", "safe_stop", "recovery", "safety_media"))
        self.core = Declaration(self.scope, Reference("applicability", "1", "a" * 64),
                                Reference("compatibility", "1", "b" * 64), (),
                                tuple(Entry(p.part_id, p.part_id, sha256(p.payload).hexdigest()) for p in self.parts))
        self.pin = declaration_digest(self.core)
        self.payload = b"nonessential expanded fixture"
        self.ref = Reference("expanded-photo", "1", sha256(self.payload).hexdigest())
        self.initial = self.prepare()
        self.request = UserRequest("request-1", spec_digest(self.initial.spec), "USER_FETCH")

    def prepare(self, ref=None, size=None, classification="NONESSENTIAL"):
        return prepare_optional(self.core, self.scope, self.pin, self.parts,
                                self.ref if ref is None else ref,
                                len(self.payload) if size is None else size, classification)

    def active(self):
        return request_optional(self.initial, self.request)

    def test_initial_separate_record_does_not_start_automatic_fetch(self):
        self.assertEqual(self.initial.state, "ABSENT")
        self.assertIsNone(self.initial.active_request)
        self.assertEqual(self.initial.authority, "NONE")

    def test_explicit_bound_intent_and_same_active_retry(self):
        active = self.active()
        self.assertEqual(active.state, "REQUESTED")
        self.assertEqual(active.request_ids, ("request-1",))
        self.assertEqual(request_optional(active, self.request), active)
        for request in (None, True, {"explicit": True}, replace(self.request, action="AUTO_FETCH")):
            with self.assertRaisesRegex(InvalidComposition, "EXPLICIT_USER_REQUEST_REQUIRED"):
                request_optional(self.initial, request)

    def test_unknown_required_or_unclassified_cannot_be_optional(self):
        for label in (None, "UNKNOWN", "REQUIRED", "safety_media"):
            with self.assertRaisesRegex(InvalidComposition, "OPTIONAL_CLASSIFICATION_REQUIRED"):
                self.prepare(classification=label)
        for part in self.parts:
            with self.assertRaisesRegex(InvalidComposition, "CORE_ESSENTIAL_ON_DEMAND"):
                self.prepare(ref=Reference(part.part_id, "other", "f" * 64))

    def test_cancel_blocks_late_completion_and_reused_intent(self):
        cancelled = cancel_optional(self.active(), "request-1")
        self.assertEqual(cancelled.state, "CANCELLED")
        self.assertEqual(cancel_optional(cancelled, "request-1"), cancelled)
        with self.assertRaisesRegex(InvalidComposition, "STALE_OPTIONAL_REQUEST"):
            complete_optional(cancelled, "request-1", self.payload)
        with self.assertRaisesRegex(InvalidComposition, "REQUEST_REPLAY_AFTER_TERMINAL_STATE"):
            request_optional(cancelled, self.request)

    def test_fresh_explicit_refetch_after_cancel_rejects_old_attempt(self):
        cancelled = cancel_optional(self.active(), "request-1")
        active = request_optional(cancelled, replace(self.request, request_id="request-2"))
        with self.assertRaisesRegex(InvalidComposition, "STALE_OPTIONAL_REQUEST"):
            complete_optional(active, "request-1", self.payload)
        available = complete_optional(active, "request-2", self.payload)
        self.assertEqual(available.state, "AVAILABLE")
        self.assertEqual(available.authority, "NONE")

    def test_evict_and_fresh_refetch_preserves_core(self):
        before = (self.core, self.parts, self.pin)
        available = complete_optional(self.active(), "request-1", self.payload)
        evicted = evict_optional(available)
        self.assertEqual(evicted.state, "EVICTED")
        self.assertIsNone(evicted.completed_digest)
        self.assertEqual(evict_optional(evicted), evicted)
        with self.assertRaisesRegex(InvalidComposition, "REQUEST_REPLAY_AFTER_TERMINAL_STATE"):
            request_optional(evicted, self.request)
        active = request_optional(evicted, replace(self.request, request_id="request-2"))
        self.assertEqual(complete_optional(active, "request-2", self.payload).state, "AVAILABLE")
        self.assertEqual(before, (self.core, self.parts, self.pin))

    def test_incomplete_wrong_size_or_digest_never_available(self):
        for payload in (self.payload[:-1], bytearray(self.payload)):
            with self.assertRaisesRegex(InvalidComposition, "OPTIONAL_SIZE_MISMATCH"):
                complete_optional(self.active(), "request-1", payload)
        with self.assertRaisesRegex(InvalidComposition, "OPTIONAL_DIGEST_MISMATCH"):
            complete_optional(self.active(), "request-1", b"x" * len(self.payload))

    def test_size_revision_generation_and_media_identity_bind_user_request(self):
        for spec in (replace(self.initial.spec, declared_bytes=len(self.payload) + 1),
                     replace(self.initial.spec, media_ref=replace(self.ref, revision="2")),
                     replace(self.initial.spec, media_ref=replace(self.ref, object_id="other"))):
            with self.assertRaisesRegex(InvalidComposition, "REQUEST_CONTEXT_MISMATCH"):
                request_optional(replace(self.initial, spec=spec), self.request)

    def test_direct_forged_record_cannot_put_core_id_in_optional_lifecycle(self):
        spec = replace(self.initial.spec, media_ref=Reference("warnings", "1", "f" * 64))
        with self.assertRaisesRegex(InvalidComposition, "CORE_ESSENTIAL_ON_DEMAND"):
            request_optional(replace(self.initial, spec=spec), self.request)
        for spec in (replace(self.initial.spec, core_scope=replace(self.scope, generation=2)),
                     replace(self.initial.spec, core_declaration=replace(self.core, entries=self.core.entries[:-1]))):
            with self.assertRaisesRegex(InvalidComposition, "OPTIONAL_CORE_CONTEXT_MISMATCH"):
                request_optional(replace(self.initial, spec=spec), self.request)

    def test_illegal_cancel_evict_or_second_fetch_state(self):
        with self.assertRaisesRegex(InvalidComposition, "STALE_OPTIONAL_REQUEST"):
            cancel_optional(self.active(), "other-request")
        with self.assertRaisesRegex(InvalidComposition, "OPTIONAL_EVICTION_STATE_CONFLICT"):
            evict_optional(self.active())
        available = complete_optional(self.active(), "request-1", self.payload)
        with self.assertRaisesRegex(InvalidComposition, "OPTIONAL_REQUEST_STATE_CONFLICT"):
            request_optional(available, replace(self.request, request_id="request-2"))

    def test_hostile_mutable_invalid_and_forged_inconsistent_state_rejected(self):
        class Hostile:
            def __getattribute__(self, name):
                raise AssertionError("untrusted callback")
        for record in (Hostile(), replace(self.initial, request_ids=[]),
                       replace(self.initial, state="AVAILABLE"),
                       replace(self.active(), request_ids=("wrong-id",)),
                       replace(self.active(), completed_digest=self.ref.digest)):
            with self.assertRaises(InvalidComposition):
                request_optional(record, self.request)
        for size in (True, 0, -1):
            with self.assertRaisesRegex(InvalidComposition, "INVALID_OPTIONAL_SPEC"):
                self.prepare(size=size)

    def test_immutable_no_authority_and_production_gate_cannot_be_opened(self):
        available = complete_optional(self.active(), "request-1", self.payload)
        with self.assertRaises(FrozenInstanceError):
            available.authority = "ALLOW"
        touched = []
        for request in (available, {"classified": True, "real_user": True, "encrypted": True},
                        lambda: touched.append(True)):
            self.assertEqual(production_gate(request).authority, "NONE")
            self.assertEqual(production_gate(request).reason, "HELD_CANONICAL_OPTIONAL_SOURCE_AND_RUNTIME_MISSING")
        self.assertEqual(touched, [])

    def test_unrepresentable_declared_size_has_finite_error(self):
        # Serializer stress fixture, never a production byte-size policy limit.
        with self.assertRaisesRegex(InvalidComposition, "^OPTIONAL_SPEC_ENCODING_FAILED$"):
            self.prepare(size=10 ** 5000)


if __name__ == "__main__":
    unittest.main()
