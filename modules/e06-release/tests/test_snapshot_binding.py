"""Exact linkage fixtures; no real approval, current permission or publishing."""

from dataclasses import FrozenInstanceError, replace
from datetime import datetime, timedelta, timezone
from pathlib import Path
import sys
import unittest

sys.path.insert(0, str(Path(__file__).resolve().parents[1] / "internal"))
from snapshot_binding import (Artifact, BindingError, Reference, Review, SECTION_NAMES,
                              Section, Snapshot, bind_review, require_exact_binding,
                              snapshot_fingerprint)


def fixture():
    now = datetime(2026, 10, 2, 12, tzinfo=timezone.utc)
    source = Reference("fixture-source", 1, "a" * 64)
    renderer = Reference("fixture-renderer", 1, "d" * 64)
    policy = Reference("fixture-policy", 1, "e" * 64)
    snapshot = Snapshot(
        "fixture-snapshot", 1,
        tuple(Section(name, ("fixture-" + name).encode()) for name in SECTION_NAMES),
        (source,), (Artifact("fixture-photo", 1, b"fixture-photo-bytes", ()),),
        (Reference("fixture-dependency", 1, "b" * 64),),
        (Reference("fixture-evidence", 1, "c" * 64),),
        (Artifact("fixture-rendered", 1, b"fixture-rendered-bytes", (source, renderer)),),
        (renderer,), policy, now + timedelta(hours=2), "fixture-high-consequence",
    )
    review = Review(snapshot.snapshot_id, snapshot.revision, snapshot_fingerprint(snapshot),
                    "fixture-reviewer", "domain_reviewer", "fixture-review-scope",
                    now - timedelta(seconds=1), now + timedelta(hours=1), policy,
                    "fixture-rationale-ref")
    return snapshot, review, now


class SnapshotBindingTests(unittest.TestCase):
    def test_exact_snapshot_and_review_bind_without_publication_authority(self):
        snapshot, review, now = fixture()
        binding = bind_review(snapshot, review, server_time=now)
        require_exact_binding(binding, snapshot, server_time=now)
        self.assertEqual(binding.authority, "NONE")
        self.assertNotIn("fixture-content", repr(binding))
        self.assertNotIn("fixture-reviewer", repr(binding))

    def test_snapshot_and_bound_review_are_immutable(self):
        snapshot, review, now = fixture()
        binding = bind_review(snapshot, review, server_time=now)
        for value, field, change in ((snapshot, "revision", 2), (review, "reviewer_ref", "other"),
                                     (binding, "binding_fingerprint", "f" * 64)):
            with self.assertRaises(FrozenInstanceError):
                setattr(value, field, change)
        with self.assertRaises(TypeError):
            replace(binding, authority="ALLOW")

    def test_any_required_section_edit_invalidates_old_binding(self):
        snapshot, review, now = fixture()
        binding = bind_review(snapshot, review, server_time=now)
        for index, name in enumerate(SECTION_NAMES):
            with self.subTest(section=name):
                sections = list(snapshot.sections)
                sections[index] = replace(sections[index], payload=b"changed-exact-bytes")
                with self.assertRaisesRegex(BindingError, "SNAPSHOT_CHANGED"):
                    require_exact_binding(binding, replace(snapshot, sections=tuple(sections)), server_time=now)

    def test_whitespace_bytes_are_not_normalized_away(self):
        snapshot, review, now = fixture()
        binding = bind_review(snapshot, review, server_time=now)
        first = replace(snapshot.sections[0], payload=snapshot.sections[0].payload + b" ")
        with self.assertRaisesRegex(BindingError, "SNAPSHOT_CHANGED"):
            require_exact_binding(binding, replace(snapshot, sections=(first,) + snapshot.sections[1:]),
                                  server_time=now)

    def test_source_dependency_evidence_and_transform_edits_change_fingerprint(self):
        snapshot, review, now = fixture()
        binding = bind_review(snapshot, review, server_time=now)
        for field in ("sources", "dependencies", "evidence", "transformation_inputs"):
            refs = getattr(snapshot, field)
            changed = (replace(refs[0], digest="f" * 64),) + refs[1:]
            with self.assertRaisesRegex(BindingError, "SNAPSHOT_CHANGED"):
                require_exact_binding(binding, replace(snapshot, **{field: changed}), server_time=now)

    def test_media_and_derived_bytes_or_transformation_inputs_change_binding(self):
        snapshot, review, now = fixture()
        binding = bind_review(snapshot, review, server_time=now)
        for field in ("media", "derived"):
            artifacts = getattr(snapshot, field)
            changed = (replace(artifacts[0], payload=b"changed-artifact"),)
            with self.assertRaisesRegex(BindingError, "SNAPSHOT_CHANGED"):
                require_exact_binding(binding, replace(snapshot, **{field: changed}), server_time=now)
        derived = replace(snapshot.derived[0], transformation_inputs=(Reference("other", 1, "f" * 64),))
        with self.assertRaisesRegex(BindingError, "SNAPSHOT_CHANGED"):
            require_exact_binding(binding, replace(snapshot, derived=(derived,)), server_time=now)

    def test_snapshot_identity_revision_policy_expiry_and_consequence_are_bound(self):
        snapshot, review, now = fixture()
        binding = bind_review(snapshot, review, server_time=now)
        for delta in ({"snapshot_id": "other"}, {"revision": 2},
                      {"policy": replace(snapshot.policy, revision=2)},
                      {"expires_at": snapshot.expires_at + timedelta(seconds=1)},
                      {"consequence_class": "different-consequence"}):
            with self.assertRaisesRegex(BindingError, "SNAPSHOT_CHANGED"):
                require_exact_binding(binding, replace(snapshot, **delta), server_time=now)

    def test_new_candidate_preserves_old_and_cannot_reuse_old_review(self):
        snapshot, review, now = fixture()
        old_binding = bind_review(snapshot, review, server_time=now)
        candidate = replace(snapshot, snapshot_id="new-candidate", revision=2)
        with self.assertRaisesRegex(BindingError, "REVIEW_SNAPSHOT_MISMATCH"):
            bind_review(candidate, review, server_time=now)
        require_exact_binding(old_binding, snapshot, server_time=now)
        new_review = replace(review, snapshot_id=candidate.snapshot_id, revision=2,
                             snapshot_fingerprint=snapshot_fingerprint(candidate))
        self.assertNotEqual(bind_review(candidate, new_review, server_time=now).binding_fingerprint,
                            old_binding.binding_fingerprint)

    def test_reviewer_role_scope_time_expiry_policy_and_rationale_are_bound(self):
        snapshot, review, now = fixture()
        binding = bind_review(snapshot, review, server_time=now)
        for delta in ({"reviewer_ref": "other-reviewer"}, {"reviewer_role": "safety_approver"},
                      {"reviewer_scope_ref": "other-scope"}, {"rationale_ref": "other-rationale"},
                      {"reviewed_at": review.reviewed_at - timedelta(seconds=1)},
                      {"expires_at": review.expires_at + timedelta(seconds=1)}):
            with self.assertRaisesRegex(BindingError, "REVIEW_BINDING_CHANGED"):
                require_exact_binding(replace(binding, review=replace(review, **delta)), snapshot,
                                      server_time=now)
        with self.assertRaisesRegex(BindingError, "REVIEW_SNAPSHOT_MISMATCH"):
            bind_review(snapshot, replace(review, policy=replace(review.policy, revision=2)), server_time=now)

    def test_expired_snapshot_review_or_future_review_rejected(self):
        snapshot, review, now = fixture()
        for delta in ({"reviewed_at": now + timedelta(seconds=1)}, {"expires_at": now}):
            with self.assertRaisesRegex(BindingError, "REVIEW_OR_SNAPSHOT_STALE"):
                bind_review(snapshot, replace(review, **delta), server_time=now)
        expired = replace(snapshot, expires_at=now)
        matching = replace(review, snapshot_fingerprint=snapshot_fingerprint(expired))
        with self.assertRaisesRegex(BindingError, "REVIEW_OR_SNAPSHOT_STALE"):
            bind_review(expired, matching, server_time=now)

    def test_missing_duplicate_or_unknown_sections_and_sources_rejected(self):
        snapshot, _, _ = fixture()
        for sections in (snapshot.sections[:5], snapshot.sections[:-1] + (snapshot.sections[0],),
                         (Section("unknown", b"fixture"),) + snapshot.sections[1:],
                         (Section("claims", b""),) + snapshot.sections[1:]):
            with self.assertRaises(BindingError):
                snapshot_fingerprint(replace(snapshot, sections=sections))
        with self.assertRaisesRegex(BindingError, "SOURCE_CONTEXT_REQUIRED"):
            snapshot_fingerprint(replace(snapshot, sources=()))

    def test_duplicate_reference_version_or_artifact_is_rejected(self):
        snapshot, _, _ = fixture()
        with self.assertRaisesRegex(BindingError, "REFERENCE_DUPLICATE"):
            snapshot_fingerprint(replace(snapshot, evidence=snapshot.evidence * 2))
        with self.assertRaisesRegex(BindingError, "ARTIFACT_DUPLICATE"):
            snapshot_fingerprint(replace(snapshot, media=snapshot.media * 2))
        versions = (snapshot.evidence[0], replace(snapshot.evidence[0], revision=2))
        self.assertNotEqual(snapshot_fingerprint(replace(snapshot, evidence=versions)),
                            snapshot_fingerprint(snapshot))

    def test_derived_artifact_cannot_omit_transformation_context(self):
        snapshot, _, _ = fixture()
        with self.assertRaisesRegex(BindingError, "DERIVATION_INPUTS_REQUIRED"):
            snapshot_fingerprint(replace(snapshot, derived=(replace(snapshot.derived[0], transformation_inputs=()),)))

    def test_mutable_bytes_boolean_revisions_and_timezone_callbacks_rejected(self):
        snapshot, review, now = fixture()
        for delta in ({"revision": True}, {"sections": list(snapshot.sections)},
                      {"expires_at": now.replace(tzinfo=None)}):
            with self.assertRaises(BindingError):
                snapshot_fingerprint(replace(snapshot, **delta))
        with self.assertRaises(BindingError):
            snapshot_fingerprint(replace(snapshot, sections=(Section("claims", bytearray(b"mutable")),)
                                        + snapshot.sections[1:]))
        with self.assertRaises(BindingError):
            bind_review(snapshot, review, server_time=now.replace(tzinfo=None))

    def test_bare_allow_and_untrusted_equality_cannot_stand_for_review(self):
        class Trap:
            def __eq__(self, other):
                raise AssertionError("UNTRUSTED_COMPARISON")
            def __ne__(self, other):
                raise AssertionError("UNTRUSTED_COMPARISON")
        snapshot, review, now = fixture()
        with self.assertRaisesRegex(BindingError, "REVIEW_CONTEXT_INVALID"):
            bind_review(snapshot, "ALLOW", server_time=now)
        with self.assertRaisesRegex(BindingError, "REVIEW_CONTEXT_INVALID"):
            bind_review(snapshot, replace(review, reviewer_ref=Trap()), server_time=now)
        with self.assertRaisesRegex(BindingError, "REFERENCE_INVALID"):
            bind_review(snapshot, replace(review, policy=replace(review.policy, digest=Trap())), server_time=now)


if __name__ == "__main__":
    unittest.main()
