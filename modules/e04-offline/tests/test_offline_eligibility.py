import sys
from dataclasses import FrozenInstanceError, replace
from pathlib import Path
import unittest

sys.path.insert(0, str(Path(__file__).resolve().parents[1] / "internal"))
import test_core_composition as fixtures
from core_composition import InvalidComposition
from full_package_fallback import PackageTarget
from offline_eligibility import (ConsequenceOrder, RiskDependency, CachedEnforcement,
                                 NEGATIVE_FLAGS, ANOMALIES, assess_risk,
                                 merge_cached_enforcement, evaluate_gate, production_gate)


class OfflineEligibilityTests(unittest.TestCase):
    def setUp(self):
        fixture = fixtures.CoreCompositionTests()
        fixture.setUp()
        self.scope = fixture.scope
        self.target = PackageTarget(fixture.declaration, fixture.scope, fixture.pin)
        self.cached = CachedEnforcement(self.scope, fixture.pin, 0, ())
        # Fixture-only labels/order, deliberately not a chosen risk taxonomy.
        self.order = ConsequenceOrder(("fixture-low", "fixture-medium", "fixture-high"))
        self.dependencies = (RiskDependency("claim", "fixture-low", "CURRENT"),
                             RiskDependency("step", "fixture-high", "CURRENT"),
                             RiskDependency("safety", "fixture-medium", "CURRENT"))

    def gate(self, **changes):
        args = dict(target=self.target, cached=self.cached, order=self.order,
                    dependencies=self.dependencies)
        args.update(changes)
        return evaluate_gate(**args)

    def test_highest_dependent_claim_step_and_safety_consequence_inherited(self):
        for values in (self.dependencies, tuple(reversed(self.dependencies))):
            result = assess_risk(self.order, values)
            self.assertEqual(result.inherited_consequence, "fixture-high")
            self.assertEqual(result.reason, "DECLARED_CONSEQUENCE_ONLY")
            self.assertEqual(result.authority, "NONE")
        self.assertFalse(self.gate().physical_progression)

    def test_stale_disputed_missing_unknown_cannot_lower_high_consequence(self):
        for state in ("STALE", "DISPUTED", "MISSING", "UNKNOWN"):
            values = (self.dependencies[0], replace(self.dependencies[1], state=state))
            result = self.gate(dependencies=values)
            self.assertEqual(result.inherited_consequence, "fixture-high")
            self.assertEqual(result.reason, "HELD_UNCERTAIN_RISK_DEPENDENCY")
            self.assertFalse(result.physical_progression)

    def test_unclassified_unknown_or_empty_dependencies_hold(self):
        for values in ((), (RiskDependency("claim", None, "CURRENT"),),
                       self.dependencies + (RiskDependency("unknown", "other-policy", "CURRENT"),)):
            result = self.gate(dependencies=values)
            self.assertEqual(result.reason, "HELD_UNCLASSIFIED_RISK")
            self.assertFalse(result.physical_progression)
        self.assertEqual(self.gate(dependencies=self.dependencies +
                         (RiskDependency("unknown", None, "MISSING"),)).inherited_consequence,
                         "fixture-high")

    def test_internal_ops_connectivity_never_supplies_commit_authority(self):
        self.assertEqual(self.gate(kind="INTERNAL_OPS_MUTATION").reason,
                         "HELD_INTERNAL_OPS_ONLINE_ONLY")
        self.assertEqual(self.gate(kind="INTERNAL_OPS_MUTATION", connected=True).reason,
                         "HELD_CURRENT_E3_COMMIT_AUTHORIZATION_REQUIRED")
        self.assertFalse(self.gate(kind="INTERNAL_OPS_MUTATION", connected=True).physical_progression)

    def test_each_cached_negative_restriction_blocks_physical_progression(self):
        for flag in NEGATIVE_FLAGS:
            result = self.gate(cached=replace(self.cached, negative_flags=(flag,)))
            self.assertEqual(result.reason, "BLOCKED_CACHED_NEGATIVE_RESTRICTION")
            self.assertFalse(result.physical_progression)
            self.assertEqual(result.retained_contexts, ("TEACHING_HISTORY", "SAFE_STOP_RECOVERY"))

    def test_equal_or_newer_cached_negative_generation_wins(self):
        for generation in (1, 2, 100):
            self.assertEqual(self.gate(cached=replace(self.cached, negative_generation=generation)).reason,
                             "BLOCKED_CACHED_NEGATIVE_GENERATION")

    def test_cache_merge_cannot_lower_floor_or_locally_clear_restrictions(self):
        old = replace(self.cached, negative_generation=4, negative_flags=("RECALL",))
        observed = replace(self.cached, scope=replace(self.scope, generation=2, release_id="release-2"),
                           manifest_digest="a" * 64, negative_generation=1, negative_flags=("DELETION",))
        merged = merge_cached_enforcement(old, observed)
        self.assertEqual(merged.negative_generation, 4)
        self.assertEqual(merged.negative_flags, ("DELETION", "RECALL"))
        self.assertEqual(merged.scope, observed.scope)
        self.assertEqual(merge_cached_enforcement(merged, replace(merged, negative_generation=0,
                         negative_flags=())).negative_flags, merged.negative_flags)
        self.assertEqual(old.negative_generation, 4)
        self.assertEqual(merged.authority, "NONE")

    def test_cached_cross_scope_stale_and_equal_generation_conflicts_rejected(self):
        for field in ("motorcycle_id", "task_id"):
            with self.assertRaisesRegex(InvalidComposition, "CACHED_SELECTED_SCOPE_MISMATCH"):
                merge_cached_enforcement(self.cached, replace(self.cached,
                                         scope=replace(self.scope, **{field: "other"})))
        with self.assertRaisesRegex(InvalidComposition, "STALE_CACHED_CONTEXT"):
            merge_cached_enforcement(replace(self.cached, scope=replace(self.scope, generation=2)), self.cached)
        for observed in (replace(self.cached, manifest_digest="b" * 64),
                         replace(self.cached, scope=replace(self.scope, release_id="other"))):
            with self.assertRaisesRegex(InvalidComposition, "CONFLICTING_CACHED_CONTEXT"):
                merge_cached_enforcement(self.cached, observed)
            self.assertEqual(self.gate(cached=observed).reason, "HELD_CACHED_CONTEXT_MISMATCH")

    def test_restore_clock_old_client_mixed_context_never_creates_authority(self):
        for anomaly in ANOMALIES:
            result = self.gate(anomalies=(anomaly,), connected=True)
            self.assertEqual(result.reason, "HELD_UNTRUSTED_OFFLINE_CONTEXT")
            self.assertFalse(result.physical_progression)

    def test_malformed_mutable_duplicate_and_hostile_values_rejected_before_use(self):
        class Hostile:
            def __eq__(self, other): raise AssertionError("callback")
            def __bool__(self): raise AssertionError("callback")
        class Label(str):
            def __hash__(self): raise AssertionError("callback")
        for changes in (dict(connected=1), dict(connected=Hostile()), dict(kind=Label("PHYSICAL_APPLICATION")),
                        dict(anomalies=["CLOCK_ANOMALY"]), dict(anomalies=(Hostile(),)),
                        dict(dependencies=list(self.dependencies)),
                        dict(dependencies=self.dependencies + self.dependencies[:1]),
                        dict(order=ConsequenceOrder(("fixture-low", "fixture-low"))),
                        dict(cached=replace(self.cached, negative_generation=True)),
                        dict(cached=replace(self.cached, negative_flags=(Label("RECALL"),))),
                        dict(cached=replace(self.cached, negative_flags=("RECALL", "RECALL"))),
                        dict(dependencies=(RiskDependency("claim", Hostile(), "CURRENT"),)),
                        dict(target=replace(self.target, expected_digest="c" * 64))):
            with self.subTest(changes=changes):
                with self.assertRaises(InvalidComposition): self.gate(**changes)
        with self.assertRaises(InvalidComposition):
            merge_cached_enforcement(replace(self.cached, negative_flags=("RECALL",)), Hostile())

    def test_coherent_false_context_and_production_flags_still_held_immutable(self):
        result = self.gate(connected=True)
        self.assertEqual(result.authority, "NONE")
        self.assertIn("CANONICAL_TAXONOMY_WINDOWS", result.reason)
        self.assertFalse(result.physical_progression)
        for obj, field in ((result, "reason"), (self.cached, "negative_generation"),
                           (self.order, "labels"), (self.dependencies[0], "state")):
            with self.assertRaises(FrozenInstanceError): setattr(obj, field, None)
        for supplied in (dict(allow=True, canonical=True, taxonomy_verified=True), lambda: True, result):
            held = production_gate(supplied)
            self.assertEqual(held.authority, "NONE")
            self.assertFalse(held.physical_progression)
            self.assertIn("HELD_", held.reason)


if __name__ == "__main__":
    unittest.main()
