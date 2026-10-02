"""Declared config/review linkage fixtures, no deployable product format."""
from dataclasses import FrozenInstanceError, replace
from pathlib import Path
import sys
import unittest

sys.path.insert(0, str(Path(__file__).resolve().parents[1] / "internal"))
from config_release import (CapabilityEnvelope, ConfigError, ConfigRelease, GRAPH_SLOTS,
                            GraphEntry, KINDS, bind_typed_config, config_envelope,
                            require_exact_config)
from snapshot_binding import Reference, bind_review, snapshot_fingerprint
from test_snapshot_binding import fixture


def setup():
    config = ConfigRelease("fixture-config", 1, "configuration", b"opaque-fixture-config",
                           ("fixture-existing-semantic",), Reference("fixture-author", 1, "a" * 64),
                           "fixture-consequence",
                           tuple(GraphEntry(slot, Reference("fixture-" + slot, 1, "b" * 64))
                                 for slot in GRAPH_SLOTS),
                           CapabilityEnvelope(Reference("fixture-capability", 1, "c" * 64),
                                              ("fixture-existing-semantic", "fixture-other")), False)
    snapshot, review, now = fixture()
    content = replace(snapshot.sections[1], payload=config_envelope(config))
    snapshot = replace(snapshot, sections=snapshot.sections[:1] + (content,) + snapshot.sections[2:])
    review = replace(review, snapshot_fingerprint=snapshot_fingerprint(snapshot))
    return config, bind_review(snapshot, review, server_time=now), now


class ConfigReleaseTests(unittest.TestCase):
    def test_exact_typed_versioned_reviewed_declaration_has_no_authority(self):
        config, review, now = setup()
        bound = bind_typed_config(config, review, server_time=now)
        require_exact_config(bound, config, server_time=now)
        self.assertEqual(bound.authority, "NONE")
        self.assertNotIn("opaque-fixture", repr(bound))
        with self.assertRaises(FrozenInstanceError):
            bound.config = None

    def test_all_meaning_change_kinds_need_their_own_exact_review(self):
        config, review, now = setup()
        for kind in KINDS:
            candidate = replace(config, kind=kind)
            if kind == config.kind:
                bind_typed_config(candidate, review, server_time=now)
            else:
                with self.assertRaisesRegex(ConfigError, "REVIEWED_CONFIG_CHANGED"):
                    bind_typed_config(candidate, review, server_time=now)

    def test_identity_revision_kind_payload_author_consequence_and_semantics_bound(self):
        config, review, now = setup()
        bound = bind_typed_config(config, review, server_time=now)
        for delta in ({"config_id": "other"}, {"revision": 2}, {"kind": "template"},
                      {"payload": config.payload + b" "},
                      {"author": replace(config.author, digest="d" * 64)},
                      {"consequence_class": "other"}, {"declared_semantics": ("fixture-other",)}):
            with self.assertRaisesRegex(ConfigError, "CONFIG_CHANGED"):
                require_exact_config(bound, replace(config, **delta), server_time=now)

    def test_each_graph_slot_identity_revision_and_digest_changes_need_review(self):
        config, review, now = setup()
        bound = bind_typed_config(config, review, server_time=now)
        for index, entry in enumerate(config.graph):
            for delta in ({"ref_id": "other"}, {"revision": 2}, {"digest": "d" * 64}):
                graph = list(config.graph)
                graph[index] = replace(entry, reference=replace(entry.reference, **delta))
                with self.subTest(slot=entry.slot, delta=delta):
                    with self.assertRaisesRegex(ConfigError, "CONFIG_CHANGED"):
                        require_exact_config(bound, replace(config, graph=tuple(graph)), server_time=now)

    def test_capability_revision_digest_and_supported_meaning_are_bound(self):
        config, review, now = setup()
        bound = bind_typed_config(config, review, server_time=now)
        for delta in ({"reference": replace(config.capability.reference, revision=2)},
                      {"reference": replace(config.capability.reference, digest="d" * 64)},
                      {"supported_semantics": config.capability.supported_semantics + ("new",)}):
            with self.assertRaisesRegex(ConfigError, "CONFIG_CHANGED"):
                require_exact_config(bound, replace(config, capability=replace(config.capability, **delta)),
                                     server_time=now)

    def test_outside_declared_capability_never_accepts(self):
        config, _, _ = setup()
        with self.assertRaisesRegex(ConfigError, "OUTSIDE_DECLARED_CAPABILITY_ENVELOPE"):
            config_envelope(replace(config, declared_semantics=("fixture-new-runtime-code",)))

    def test_explicit_suspension_clear_and_boolean_standin_rejected(self):
        config, _, _ = setup()
        with self.assertRaisesRegex(ConfigError, "CONFIG_CANNOT_CLEAR_SUSPENSION"):
            config_envelope(replace(config, clears_suspension=True))
        with self.assertRaisesRegex(ConfigError, "TYPED_CONFIG_REQUIRED"):
            config_envelope(replace(config, clears_suspension=0))

    def test_missing_duplicate_unknown_or_reordered_graph_rejected(self):
        config, _, _ = setup()
        for graph in (config.graph[:7], config.graph[:-1] + (config.graph[0],),
                      (replace(config.graph[0], slot="unknown"),) + config.graph[1:],
                      tuple(reversed(config.graph))):
            with self.assertRaisesRegex(ConfigError, "COMPLETE_RELEASE_GRAPH_REQUIRED"):
                config_envelope(replace(config, graph=graph))

    def test_missing_duplicate_and_mutable_semantics_or_payload_rejected(self):
        config, _, _ = setup()
        for delta in ({"declared_semantics": ()}, {"declared_semantics": config.declared_semantics * 2},
                      {"declared_semantics": list(config.declared_semantics)},
                      {"payload": bytearray(config.payload)}, {"graph": list(config.graph)},
                      {"revision": True}):
            with self.assertRaises(ConfigError):
                config_envelope(replace(config, **delta))

    def test_old_candidate_preserved_changed_review_cannot_be_reused(self):
        config, review, now = setup()
        original = config_envelope(config)
        candidate = replace(config, revision=2, payload=b"new-fixture")
        with self.assertRaisesRegex(ConfigError, "REVIEWED_CONFIG_CHANGED"):
            bind_typed_config(candidate, review, server_time=now)
        self.assertEqual(config_envelope(config), original)
        bind_typed_config(config, review, server_time=now)

    def test_stale_bare_or_mutated_review_never_accepts(self):
        config, review, now = setup()
        with self.assertRaisesRegex(ConfigError, "EXACT_REVIEW_REQUIRED"):
            bind_typed_config(config, "ALLOW", server_time=now)
        with self.assertRaisesRegex(ValueError, "STALE"):
            bind_typed_config(config, review, server_time=review.review.expires_at)
        changed = replace(review.review, rationale=replace(review.review.rationale, revision=2))
        with self.assertRaisesRegex(ValueError, "REVIEW_BINDING_CHANGED"):
            bind_typed_config(config, replace(review, review=changed), server_time=now)

    def test_callbacks_or_mutable_reference_labels_never_compared(self):
        config, _, _ = setup()
        class Trap:
            def __eq__(self, other):
                raise AssertionError("CALLBACK")
        for delta in ({"kind": Trap()}, {"config_id": Trap()},
                      {"author": replace(config.author, digest=Trap())},
                      {"capability": replace(config.capability, supported_semantics=(Trap(),))}):
            with self.assertRaises(ConfigError):
                config_envelope(replace(config, **delta))


if __name__ == "__main__":
    unittest.main()
