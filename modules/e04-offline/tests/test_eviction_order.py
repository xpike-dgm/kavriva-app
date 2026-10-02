import sys
from dataclasses import FrozenInstanceError, replace
from pathlib import Path
import unittest

sys.path.insert(0, str(Path(__file__).resolve().parents[1] / "internal"))
from core_composition import InvalidComposition
from stage_verify_promote import Disposable, DISPOSABLE_ORDER, PROTECTED
from eviction_order import order_eviction, production_gate


class EvictionOrderTests(unittest.TestCase):
    def setUp(self):
        self.candidates = tuple(Disposable("object-" + str(i), kind, i+1)
                                for i, kind in enumerate(DISPOSABLE_ORDER))

    def test_four_canonical_classes_in_order_for_mixed_input(self):
        result = order_eviction(self.candidates[::-1])
        self.assertEqual(result.ordered, self.candidates)
        self.assertEqual(tuple(i.data_class for i in result.ordered), DISPOSABLE_ORDER)

    def test_stable_ties_without_invented_age_or_size_priority(self):
        a = Disposable("a", "NONESSENTIAL_MEDIA", 100)
        b = Disposable("b", "NONESSENTIAL_MEDIA", 1)
        temp = Disposable("t", "INVALID_OR_ORPHAN_TEMP", 2)
        self.assertEqual(order_eviction((b,temp,a)).ordered, (temp,b,a))
        self.assertEqual(order_eviction((a,b,temp)).ordered, (temp,a,b))

    def test_every_candidate_retained_no_space_threshold_or_early_stop(self):
        extra = Disposable("another", "REBUILDABLE_PROJECTION", 10**100)
        result = order_eviction((extra,) + self.candidates)
        self.assertEqual(result.ordered, self.candidates[:3] + (extra, self.candidates[3]))
        self.assertEqual(len(result.ordered), 5)

    def test_empty_candidate_tuple_is_readonly_empty_plan(self):
        result = order_eviction(())
        self.assertEqual(result.ordered, ())
        self.assertEqual(result.authority, "NONE")

    def test_existing_six_protected_labels_rejected_even_after_disposable(self):
        for label in PROTECTED:
            with self.assertRaisesRegex(InvalidComposition, "PROTECTED_EVICTION_FORBIDDEN"):
                order_eviction(self.candidates + (Disposable("protected", label, 1),))

    def test_supplied_protected_identity_rejected_even_relabelled(self):
        with self.assertRaisesRegex(InvalidComposition, "PROTECTED_EVICTION_FORBIDDEN"):
            order_eviction(self.candidates, ("object-2",))
        self.assertEqual(order_eviction(self.candidates, ("other-protected",)).ordered, self.candidates)

    def test_unknown_duplicate_or_invalid_candidate_rejected(self):
        for candidates in ((Disposable("unknown", "CACHE", 1),),
                           self.candidates + (replace(self.candidates[0],data_class="NONESSENTIAL_MEDIA"),),
                           (Disposable("", "NONESSENTIAL_MEDIA", 1),),
                           (None,)):
            with self.assertRaises(InvalidComposition): order_eviction(candidates)
        for count in (0, -1, True, False, 1.5, "1", None):
            with self.assertRaises(InvalidComposition):
                order_eviction((replace(self.candidates[0], byte_count=count),))

    def test_mutable_candidates_and_protected_ids_rejected(self):
        for candidates in (list(self.candidates), {}, None):
            with self.assertRaises(InvalidComposition): order_eviction(candidates)
        for identities in (["a"], {"a"}, None, ("",), (1,), ("a","a")):
            with self.assertRaises(InvalidComposition): order_eviction(self.candidates, identities)

    def test_hostile_candidates_and_ids_do_not_invoke_callbacks(self):
        class Hostile:
            def __getattr__(self, name): raise AssertionError("attribute invoked")
            def __hash__(self): raise AssertionError("hash invoked")
            def __eq__(self, other): raise AssertionError("equality invoked")
        hostile = Hostile()
        for candidates in ((hostile,), (replace(self.candidates[0],data_class=hostile),),
                           (replace(self.candidates[0],object_id=hostile),)):
            with self.assertRaises(InvalidComposition): order_eviction(candidates)
        with self.assertRaises(InvalidComposition): order_eviction(self.candidates, (hostile,))
        self.assertTrue(production_gate(hostile).reason.startswith("HELD_"))

    def test_immutable_plan_does_not_mutate_inputs_or_claim_reclaimed_bytes(self):
        before = self.candidates
        result = order_eviction(before[::-1])
        with self.assertRaises(FrozenInstanceError): result.ordered = ()
        self.assertEqual(self.candidates, before)
        self.assertEqual(result.authority, "NONE")
        self.assertFalse(hasattr(result, "freed_bytes"))

    def test_coherent_forged_disposable_label_never_allows_actual_cleanup(self):
        forged = order_eviction((Disposable("hidden-user-history", "NONESSENTIAL_MEDIA", 1),))
        for claim in (forged, {"classification_verified": True, "encrypted": True}, lambda: "ALLOW"):
            self.assertEqual(production_gate(claim).reason,
                             "HELD_CANONICAL_STORAGE_CLASSIFICATION_AND_ENCRYPTED_CLEANUP_RUNTIME_MISSING")


if __name__ == "__main__": unittest.main()
