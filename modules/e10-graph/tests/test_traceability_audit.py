"""Regression tests for documentary gaps, not executed product acceptance."""
from copy import deepcopy
import hashlib
from pathlib import Path
import sys
import unittest
sys.path.insert(0, str(Path(__file__).resolve().parents[1] / "internal"))
from traceability_audit import (LAYERS, assess_closure_shape, audit_declared,
                                catalog, effective_product_state,
                                re_evaluate_task_and_layer_states, subject_digest_matches,
                                model_from_sources)


def source_fixture(matrix):
    return {"TASK_INDEX":"| T-E10-010 | FL10.4.1/F10.4.1 | Audit | | ADR-015 | gaps | PROPOSED |",
            "FEATURE_CATALOG":"| F10.4.1 | C10.4 |",
            "USER_FLOW_CATALOG":"| FL10.4.1 | F10.4.1 |",
            "CAPABILITY_CATALOG":"| C10.4 | E10 |",
            "EPIC_CATALOG":"| E10 |",
            "ACCEPTANCE_MATRIX":matrix}


def fixture():
    return {"tasks": {"T-E10-010": {"line": 1, "cells": ["T-E10-010",
            "FL10.4.1/F10.4.1", "Audit", "", "ADR-015", "gaps", "PROPOSED"]}},
            "features": {"F10.4.1": {"cells": ["F10.4.1", "C10.4"]}},
            "flows": {"FL10.4.1": {"cells": ["FL10.4.1", "F10.4.1"]}},
            "capabilities": {"C10.4": {"cells": ["C10.4", "E10"]}},
            "epics": {"E10": {"cells": ["E10"]}},
            "needs": [{"line": 1, "label": "ADR-015 R6", "features": {"F10.4.1"},
                       "flows": {"FL10.4.1"}, "tasks": {"T-E10-010"},
                       "validation_assignment": "review"}]}


class TraceabilityAuditTests(unittest.TestCase):
    def test_parser_preserves_taskless_need_instead_of_dropping_it(self):
        m=model_from_sources(source_fixture("| ADR-015 R6 | F10.4.1 | FL10.4.1 | NONE | review |"))
        self.assertEqual(len(m["needs"]),1)
        self.assertTrue(any(f["subject"]=="ACCEPTANCE_MATRIX.md:1" and f["label"]=="MISSING"
                            for f in audit_declared(m)))

    def test_parser_preserves_held_none_cells_and_source_address(self):
        row="| ADR-008 R6: device proof | NONE (held by design) | NONE | NONE | HELD |"
        m=model_from_sources(source_fixture(row))
        self.assertEqual(m["needs"][0]["source_cells"][1:],["NONE (held by design)","NONE","NONE","HELD"])
        finding=next(f for f in audit_declared(m) if f["subject"]=="ACCEPTANCE_MATRIX.md:1")
        self.assertEqual(finding["label"],"BLOCKED")
        self.assertIn("ADR-008 R6",finding["reason"])

    def test_parser_excludes_table_headers_but_retains_taskless_data(self):
        source="| Requirement / Rule | Feature | Flow | Task | Validation |\n|---|---|---|---|---|\n| Real need | NONE | NONE | NONE | NONE |"
        m=model_from_sources(source_fixture(source))
        self.assertEqual(len(m["needs"]),1)
        self.assertEqual(m["needs"][0]["line"],3)
        self.assertEqual(m["needs"][0]["label"],"Real need")

    def test_declared_chain_is_separate_from_semantic_completion(self):
        self.assertEqual(audit_declared(fixture()), [])
        self.assertEqual(len(assess_closure_shape({})["findings"]), 10)

    def test_removing_only_task_reports_affected_need_and_task(self):
        m = fixture(); m["tasks"].clear()
        findings = audit_declared(m)
        self.assertIn("T-E10-010", {f["subject"] for f in findings})
        self.assertIn("ACCEPTANCE_MATRIX.md:1", {f["subject"] for f in findings})
        self.assertTrue(all(f["label"] == "MISSING" for f in findings))

    def test_shared_need_still_exposes_removed_task(self):
        m = fixture();m["needs"][0]["tasks"].add("T-E10-009")
        m["tasks"]["T-E10-009"] = deepcopy(m["tasks"]["T-E10-010"])
        del m["tasks"]["T-E10-010"]
        findings = audit_declared(m)
        self.assertEqual([f["subject"] for f in findings], ["T-E10-010"])

    def test_reverse_orphan_is_not_approved_by_valid_flow(self):
        m=fixture();m["tasks"]["T-E10-999"] = deepcopy(m["tasks"]["T-E10-010"])
        self.assertTrue(any(f["subject"] == "T-E10-999" and "orphan" in f["reason"]
                            for f in audit_declared(m)))

    def test_wrong_feature_flow_pair_is_conflict(self):
        m=fixture();m["flows"]["FL10.4.1"]["cells"][1]="F10.3.1"
        self.assertTrue(any(f["label"] == "CONFLICT" for f in audit_declared(m)))

    def test_missing_feature_source_is_visible(self):
        m=fixture();m["features"].clear()
        self.assertTrue(any(f["subject"] == "F10.4.1" for f in audit_declared(m)))

    def test_missing_capability_and_epic_are_not_inferred(self):
        for kind in ["capabilities", "epics"]:
            m=fixture();m[kind].clear()
            self.assertTrue(audit_declared(m), kind)

    def test_missing_prerequisite_is_reported(self):
        m=fixture();m["tasks"]["T-E10-010"]["cells"][3]="T-E10-009"
        self.assertTrue(any("prerequisite T-E10-009" in f["reason"]
                            for f in audit_declared(m)))

    def test_duplicate_source_identity_is_conflict(self):
        with self.assertRaisesRegex(ValueError,"CONFLICT"):
            catalog("| E10 | one |\n| E10 | two |", r"E\d+")

    def test_all_done_does_not_supply_upper_layer_proof(self):
        layers={l:{"owner":"E10","evidence":"MISSING","verdict":"UNVERIFIED"}
                for l in LAYERS}
        layers["task"]={"owner":"E10","evidence":"actual-task-proof","verdict":"PASS"}
        result=re_evaluate_task_and_layer_states({"T-E10-010":"DONE"},layers)
        self.assertEqual(result["assumed_done_count"],1)
        self.assertFalse(result["declared_shape_complete"])
        self.assertEqual({f["subject"] for f in result["findings"]},set(LAYERS)-{"task"})

    def test_missing_tenth_layer_cannot_pass(self):
        layers={l:{"owner":"actual-owner","evidence":"subject-proof","verdict":"PASS"}
                for l in LAYERS[:-1]}
        self.assertEqual(assess_closure_shape(layers)["findings"],
                         [{"label":"MISSING","subject":"gap-audit",
                           "reason":"required closure layer absent"}])

    def test_unfinished_task_blocks_even_with_all_declared_layer_pass(self):
        layers={l:{"owner":"actual-owner","evidence":"declared-proof","verdict":"PASS"}
                for l in LAYERS}
        result=re_evaluate_task_and_layer_states({"T-E3-001-R1":"REVIEW"},layers)
        self.assertFalse(result["declared_shape_complete"])
        self.assertEqual(result["findings"][0]["label"],"BLOCKED")
        self.assertEqual(result["findings"][0]["subject"],"T-E3-001-R1")

    def test_ownerless_pass_and_no_evidence_are_nonpassing(self):
        layers={l:{"owner":"actual-owner","evidence":"subject-proof","verdict":"PASS"}
                for l in LAYERS}
        layers["release"]={"owner":"UNOWNED","evidence":"MISSING","verdict":"PASS"}
        self.assertEqual({f["label"] for f in assess_closure_shape(layers)["findings"]},
                         {"UNOWNED","MISSING"})

    def test_complete_receipt_shape_still_requires_semantic_review(self):
        layers={l:{"owner":"actual-owner","evidence":"declared-proof","verdict":"PASS"}
                for l in LAYERS}
        result=assess_closure_shape(layers)
        self.assertTrue(result["declared_shape_complete"])
        self.assertTrue(result["semantic_acceptance"].startswith("UNVERIFIED"))

    def test_bootstrap_done_does_not_close_real_product_tracker(self):
        physical={"T-E3-001":{"status":"DONE"},"T-E3-001-R1":{"status":"REVIEW"}}
        self.assertEqual(effective_product_state("T-E3-001",physical),"REVIEW")

    def test_missing_product_tracker_does_not_borrow_bootstrap_done(self):
        self.assertEqual(effective_product_state("T-E3-001",{"T-E3-001":{"status":"DONE"}}),
                         "UNVERIFIED")

    def test_legacy_uppercase_digest_and_annotation_match(self):
        digest=hashlib.sha256(b"actual\n").hexdigest().upper()
        self.assertTrue(subject_digest_matches(b"actual\r\n",digest+" (accepted LF subject)"))

    def test_changed_subject_cannot_borrow_annotated_old_digest(self):
        digest=hashlib.sha256(b"old\n").hexdigest()
        self.assertFalse(subject_digest_matches(b"changed\n",digest+" (accepted subject)"))

    def test_invalid_digest_cannot_claim_subject_match(self):
        self.assertFalse(subject_digest_matches(b"actual", "PASS"))


if __name__ == "__main__":
    unittest.main()
