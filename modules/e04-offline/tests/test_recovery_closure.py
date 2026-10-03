import sys
from dataclasses import FrozenInstanceError, replace
from pathlib import Path
import unittest

sys.path.insert(0, str(Path(__file__).resolve().parents[1] / "internal"))
import test_core_composition as fixtures
from core_composition import Reference, InvalidComposition, declaration_digest
from stage_verify_promote import Stage, VerificationContext, VerifiedCandidate
from recovery_closure import (RecoveryEdge, RecoveryCoverage, RecoveryGraph,
                              graph_digest, check_closure, production_gate)


class RecoveryClosureTests(unittest.TestCase):
    def setUp(self):
        fixture = fixtures.CoreCompositionTests()
        fixture.setUp()
        self.fixture = fixture
        self.graph = RecoveryGraph(fixture.scope, fixture.declaration.compatibility,
                                   "start", ("start", "branch", "terminal"),
                                   (RecoveryEdge("start", "branch"), RecoveryEdge("start", "terminal")),
                                   tuple(RecoveryCoverage(state, "safe_stop", "recovery")
                                         for state in ("start", "branch", "terminal")))
        self.candidate, self.reference = self.bind(self.graph)

    def bind(self, graph):
        ref = Reference("fixture-recovery-graph", "fixture-rev-1", graph_digest(graph))
        declared = replace(self.fixture.declaration, dependencies=self.fixture.declaration.dependencies + (ref,))
        context = VerificationContext(declared.applicability, declared.compatibility, declared.dependencies)
        return VerifiedCandidate(Stage(declared, declared.scope, declaration_digest(declared),
                                       self.fixture.parts), context), ref

    def check(self, graph=None, **kwargs):
        graph = self.graph if graph is None else graph
        candidate, ref = self.bind(graph)
        return check_closure(candidate, graph, ref, **kwargs)

    def test_complete_branches_and_terminal_states_remain_model_only(self):
        result = self.check(evidence_status="CURRENT")
        self.assertEqual(result.reachable_states, ("branch", "start", "terminal"))
        self.assertEqual(result.uncovered_states, ())
        self.assertEqual(result.reason, "DECLARED_CLOSURE_COMPLETE_CANONICAL_SOURCE_AND_OFFLINE_AUTHORITY_HELD")
        self.assertEqual(result.authority, "NONE")
        self.assertFalse(result.physical_start)

    def test_cycle_traversal_terminates_without_losing_reachable_coverage(self):
        graph = replace(self.graph, edges=self.graph.edges + (RecoveryEdge("branch", "start"),
                        RecoveryEdge("terminal", "terminal")))
        self.assertEqual(self.check(graph, evidence_status="CURRENT").reachable_states,
                         ("branch", "start", "terminal"))

    def test_every_reachable_state_requires_both_safe_stop_and_recovery(self):
        for state in self.graph.states:
            for field in (None, "safe_stop_part", "recovery_part"):
                coverage = tuple(c for c in self.graph.coverage if c.state != state) if field is None else \
                           tuple(replace(c, **{field: None}) if c.state == state else c for c in self.graph.coverage)
                result = self.check(replace(self.graph, coverage=coverage), evidence_status="CURRENT")
                self.assertEqual(result.reason, "HELD_INCOMPLETE_RECOVERY_CLOSURE")
                self.assertEqual(result.uncovered_states, (state,))
                self.assertFalse(result.physical_start)

    def test_unreachable_states_need_no_mapping_but_all_graph_data_is_validated(self):
        graph = replace(self.graph, states=self.graph.states + ("unreachable",))
        self.assertEqual(self.check(graph, evidence_status="CURRENT").uncovered_states, ())
        with self.assertRaisesRegex(InvalidComposition, "INVALID_RECOVERY_EDGE"):
            self.check(replace(graph, edges=graph.edges + (RecoveryEdge("unreachable", "undeclared"),)))
        with self.assertRaisesRegex(InvalidComposition, "RECOVERY_PART_ROLE_MISMATCH"):
            self.check(replace(graph, coverage=graph.coverage + (RecoveryCoverage("unreachable", "text", "recovery"),)))

    def test_coverage_maps_exact_role_appropriate_parts_inside_compact_core(self):
        for part, reason in (("missing", "RECOVERY_PART_NOT_IN_COMPACT_CORE"),
                             ("text", "RECOVERY_PART_ROLE_MISMATCH"),
                             ("safety_media", "RECOVERY_PART_ROLE_MISMATCH")):
            graph = replace(self.graph, coverage=(replace(self.graph.coverage[0], safe_stop_part=part),)
                            + self.graph.coverage[1:])
            with self.assertRaisesRegex(InvalidComposition, reason): self.check(graph)

    def test_all_package_bytes_and_current_dependency_context_reverified(self):
        for candidate, reason in ((replace(self.candidate, stage=replace(self.candidate.stage,
                                       parts=self.candidate.stage.parts[:-1])), "INCOMPLETE_CORE"),
                                  (replace(self.candidate, stage=replace(self.candidate.stage,
                                       parts=(replace(self.candidate.stage.parts[0], payload=b"corrupt"),)
                                       + self.candidate.stage.parts[1:])), "PAYLOAD_DIGEST_MISMATCH"),
                                  (replace(self.candidate, context=replace(self.candidate.context,
                                       dependencies=())), "DEPENDENCY_CONTEXT_MISMATCH")):
            with self.assertRaisesRegex(InvalidComposition, reason):
                check_closure(candidate, self.graph, self.reference, evidence_status="CURRENT")

    def test_unsupported_capability_and_expired_unknown_evidence_hold(self):
        graph = replace(self.graph, capability=replace(self.graph.capability, revision="unsupported"))
        self.assertEqual(self.check(graph, evidence_status="CURRENT").reason,
                         "HELD_UNSUPPORTED_RECOVERY_CAPABILITY")
        for status in ("EXPIRED", "UNKNOWN"):
            self.assertEqual(self.check(evidence_status=status).reason,
                             "HELD_EXPIRED_OR_UNKNOWN_RECOVERY_EVIDENCE")
        self.assertEqual(self.check().reason, "HELD_EXPIRED_OR_UNKNOWN_RECOVERY_EVIDENCE")

    def test_graph_mutation_unadmitted_reference_and_stale_revision_rejected(self):
        for graph, ref in ((replace(self.graph, edges=()), self.reference),
                           (self.graph, replace(self.reference, revision="stale-revision")),
                           (self.graph, replace(self.reference, object_id="other-graph"))):
            with self.assertRaisesRegex(InvalidComposition, "RECOVERY_GRAPH_PIN_MISMATCH"):
                check_closure(self.candidate, graph, ref)

    def test_other_motorcycle_task_release_generation_graph_cannot_match_current(self):
        for field, value in (("motorcycle_id", "other"), ("task_id", "other"),
                             ("release_id", "other"), ("generation", 2)):
            graph = replace(self.graph, scope=replace(self.graph.scope, **{field: value}))
            candidate, ref = self.bind(graph)
            with self.assertRaisesRegex(InvalidComposition, "RECOVERY_SELECTED_SCOPE_MISMATCH"):
                check_closure(candidate, graph, ref)

    def test_strict_mutable_duplicate_dangling_and_hostile_graph_values(self):
        class Hostile:
            def __bool__(self): raise AssertionError("callback")
            def __eq__(self, other): raise AssertionError("callback")
        class State(str):
            def __hash__(self): raise AssertionError("callback")
        for graph in (replace(self.graph, states=list(self.graph.states)),
                      replace(self.graph, states=self.graph.states + self.graph.states[:1]),
                      replace(self.graph, entry_state="undeclared"),
                      replace(self.graph, entry_state=Hostile()),
                      replace(self.graph, states=(State("start"),)),
                      replace(self.graph, edges=list(self.graph.edges)),
                      replace(self.graph, edges=self.graph.edges + self.graph.edges[:1]),
                      replace(self.graph, edges=(RecoveryEdge("start", Hostile()),)),
                      replace(self.graph, coverage=self.graph.coverage + self.graph.coverage[:1]),
                      replace(self.graph, coverage=(RecoveryCoverage("undeclared", "safe_stop", "recovery"),)),
                      replace(self.graph, coverage=(RecoveryCoverage("start", Hostile(), "recovery"),))):
            with self.assertRaises(InvalidComposition): graph_digest(graph)
        with self.assertRaises(InvalidComposition):
            check_closure(self.candidate, self.graph, self.reference, evidence_status=Hostile())

    def test_coherently_omitted_state_or_falsely_reviewed_graph_never_authority(self):
        graph = replace(self.graph, states=("start",), edges=(), coverage=self.graph.coverage[:1])
        result = self.check(graph, evidence_status="CURRENT")
        self.assertEqual(result.uncovered_states, ())
        self.assertEqual(result.authority, "NONE")
        self.assertFalse(result.physical_start)
        for obj, field in ((result, "reason"), (graph, "states"), (graph.coverage[0], "state"),
                           (self.graph.edges[0], "source_state")):
            with self.assertRaises(FrozenInstanceError): setattr(obj, field, None)
        for supplied in (result, dict(approved=True, source_verified=True), lambda: True):
            held = production_gate(supplied)
            self.assertEqual(held.authority, "NONE")
            self.assertFalse(held.physical_start)
            self.assertTrue(held.reason.startswith("HELD_"))

    def test_extreme_context_encoding_has_finite_rejection(self):
        graph = replace(self.graph, scope=replace(self.graph.scope, generation=10 ** 5000))
        with self.assertRaisesRegex(InvalidComposition, "RECOVERY_CONTEXT_ENCODING_FAILED"):
            graph_digest(graph)


if __name__ == "__main__":
    unittest.main()
