"""Fixture separation tests; actual canonical privileged source is missing."""

from dataclasses import FrozenInstanceError, replace
from datetime import datetime, timedelta, timezone
from pathlib import Path
import sys
import unittest

sys.path.insert(0, str(Path(__file__).resolve().parents[1] / "internal"))
from publication_independence import (Binding, Change, ROLES, assess_fixture_structure,
                                      publication_gate)


def fixture():
    now = datetime(2026, 10, 2, 12, tzinfo=timezone.utc)
    change = Change("fixture-change", "a" * 64, "technical_content", "fixture-policy",
                    "high_consequence_publication")
    # These dates are fixture values, not a selected session-duration policy.
    bindings = tuple(Binding(change, role, "human", "principal-" + role,
                             ("human-" + role,), True, "assignment-" + role,
                             "session-" + role, "assurance-" + role,
                             now - timedelta(seconds=1), now + timedelta(seconds=1))
                     for role in ROLES)
    return change, bindings, now


class PublicationIndependenceTests(unittest.TestCase):
    def held(self, change, bindings, now, reason):
        assessment = publication_gate(change, bindings, server_time=now)
        self.assertEqual((assessment.state, assessment.reason), ("HELD", reason))
        self.assertEqual(assessment.authority, "NONE")

    def test_distinct_fixture_roles_never_open_actual_publication(self):
        change, bindings, now = fixture()
        assessment = assess_fixture_structure(change, bindings, server_time=now)
        self.assertEqual(assessment.state, "FIXTURE_STRUCTURE_MATCH")
        self.assertEqual(assessment.authority, "NONE")
        self.held(change, bindings, now, "CANONICAL_PRIVILEGED_IDENTITY_SOURCE_MISSING")

    def test_different_accounts_of_same_human_cannot_self_approve(self):
        change, bindings, now = fixture()
        modified = replace(bindings[1], controlling_humans=bindings[0].controlling_humans)
        self.held(change, (bindings[0], modified) + bindings[2:], now, "PER_CHANGE_HUMAN_COLLAPSE")

    def test_service_account_controlled_by_author_cannot_publish(self):
        change, bindings, now = fixture()
        modified = replace(bindings[3], principal_kind="service",
                           controlling_humans=bindings[0].controlling_humans)
        self.held(change, bindings[:3] + (modified,), now, "PER_CHANGE_HUMAN_COLLAPSE")

    def test_emergency_account_cannot_bypass_positive_publication_independence(self):
        change, bindings, now = fixture()
        modified = replace(bindings[3], principal_kind="emergency",
                           controlling_humans=bindings[0].controlling_humans)
        self.held(change, bindings[:3] + (modified,), now, "PER_CHANGE_HUMAN_COLLAPSE")

    def test_partial_overlap_in_multi_controller_chain_is_collapse(self):
        change, bindings, now = fixture()
        modified = replace(bindings[2], principal_kind="service",
                           controlling_humans=("second-controller", bindings[0].controlling_humans[0]))
        self.held(change, bindings[:2] + (modified,) + bindings[3:], now, "PER_CHANGE_HUMAN_COLLAPSE")

    def test_unknown_incomplete_or_duplicate_controlling_humans_hold(self):
        change, bindings, now = fixture()
        for delta in ({"controlling_humans": ()}, {"control_chain_complete": False},
                      {"control_chain_complete": "true"}, {"controlling_humans": ("h", "h")},
                      {"controlling_humans": ("",)}):
            modified = replace(bindings[0], **delta)
            self.held(change, (modified,) + bindings[1:], now, "CONTROLLING_HUMAN_UNKNOWN")

    def test_missing_duplicate_or_unknown_roles_hold(self):
        change, bindings, now = fixture()
        self.held(change, bindings[:3], now, "INDEPENDENT_ROLES_MISSING")
        for role in ("author", "administrator", "ALLOW"):
            modified = replace(bindings[1], role=role)
            self.held(change, (bindings[0], modified) + bindings[2:], now, "ROLE_BINDING_INVALID")

    def test_exact_change_source_domain_and_policy_bind_each_role(self):
        change, bindings, now = fixture()
        for delta in ({"operation_id": "other-change"}, {"subject_digest": "b" * 64},
                      {"authority_domain": "backend_service"}, {"policy_version": "other-policy"},
                      {"packet_kind": "ordinary"}):
            modified = replace(bindings[0], change=replace(change, **delta))
            self.held(change, (modified,) + bindings[1:], now, "PUBLICATION_PACKET_MISMATCH")

    def test_stale_or_future_observation_and_expiry_at_now_hold(self):
        change, bindings, now = fixture()
        for delta in ({"valid_until": now}, {"valid_until": now - timedelta(seconds=1)},
                      {"observed_at": now + timedelta(seconds=1)}):
            modified = replace(bindings[0], **delta)
            self.held(change, (modified,) + bindings[1:], now, "ASSIGNMENT_OR_SESSION_STALE")

    def test_unknown_timezone_or_missing_assurance_and_session_hold(self):
        change, bindings, now = fixture()
        modified = replace(bindings[0], observed_at=now.replace(tzinfo=None))
        self.held(change, (modified,) + bindings[1:], now, "ASSIGNMENT_OR_SESSION_STALE")
        for field in ("session_ref", "assignment_ref", "assurance_ref", "principal_ref"):
            modified = replace(bindings[0], **{field: ""})
            self.held(change, (modified,) + bindings[1:], now, "ROLE_BINDING_INVALID")

    def test_shared_principal_session_or_assignment_is_rejected(self):
        change, bindings, now = fixture()
        for field, reason in (("principal_ref", "PER_CHANGE_HUMAN_COLLAPSE"),
                              ("session_ref", "SESSION_OR_ASSIGNMENT_REUSED"),
                              ("assignment_ref", "SESSION_OR_ASSIGNMENT_REUSED")):
            modified = replace(bindings[1], **{field: getattr(bindings[0], field)})
            self.held(change, (bindings[0], modified) + bindings[2:], now, reason)

    def test_other_release_domains_and_negative_emergency_profiles_stay_unimplemented(self):
        change, bindings, now = fixture()
        for domain in ("consumer_binary", "emergency_suspension", "future_ota", "unknown"):
            self.held(replace(change, authority_domain=domain), bindings, now,
                      "RELEASE_PROFILE_NOT_IMPLEMENTED")
        self.held(replace(change, packet_kind="negative_emergency"), bindings, now,
                  "RELEASE_PROFILE_NOT_IMPLEMENTED")

    def test_type_and_equality_callbacks_cannot_spoof_context(self):
        class Trap:
            def __eq__(self, other):
                raise AssertionError("UNTRUSTED_COMPARISON")
            def __ne__(self, other):
                raise AssertionError("UNTRUSTED_COMPARISON")
        change, bindings, now = fixture()
        for field in ("operation_id", "subject_digest", "authority_domain", "policy_version"):
            modified = replace(bindings[0], change=replace(change, **{field: Trap()}))
            self.held(change, (modified,) + bindings[1:], now, "ROLE_BINDING_INVALID")
        modified = replace(bindings[0], principal_ref=Trap())
        self.held(change, (modified,) + bindings[1:], now, "ROLE_BINDING_INVALID")

    def test_assessment_is_immutable_and_cannot_be_given_authority(self):
        change, bindings, now = fixture()
        assessment = publication_gate(change, bindings, server_time=now)
        with self.assertRaises(FrozenInstanceError):
            assessment.state = "ALLOW"
        with self.assertRaises(TypeError):
            replace(assessment, authority="ALLOW")


if __name__ == "__main__":
    unittest.main()
