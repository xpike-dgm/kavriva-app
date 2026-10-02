import sys
from dataclasses import FrozenInstanceError
from pathlib import Path
import unittest

sys.path.insert(0, str(Path(__file__).resolve().parents[1] / "internal"))
from core_composition import InvalidComposition
from stage_verify_promote import Disposable, PROTECTED, DISPOSABLE_ORDER
from never_evict import StorageClassification, assess_protection, guard_eviction, production_gate


class NeverEvictTests(unittest.TestCase):
    def setUp(self):
        self.items = tuple(Disposable("item-"+str(i), label, i+1) for i,label in enumerate(DISPOSABLE_ORDER))
        self.facts = tuple(StorageClassification(item.object_id,(item.data_class,)) for item in self.items)

    def test_exact_six_protected_classes(self):
        self.assertEqual(PROTECTED, frozenset({"ACTIVE_TASK_COMPLETE_PACKAGE", "REQUIRED_SAFETY_MEDIA",
            "DURABLE_USER_DATA", "PENDING_OR_ACCEPTED_OPERATION_TRUTH", "PROTECTED_AUDIT_OR_AUTHORITY", "NEGATIVE_FLOOR"}))
        for label in PROTECTED:
            self.assertEqual(assess_protection(StorageClassification("protected",(label,))).reason,
                             "NEVER_EVICT_PROTECTED_CLASS")

    def test_each_protected_class_rejects_relabelled_disposable_candidate(self):
        item = self.items[0]
        for label in PROTECTED:
            with self.assertRaisesRegex(InvalidComposition,"PROTECTED_EVICTION_FORBIDDEN"):
                guard_eviction((item,), (StorageClassification(item.object_id,(label,)),))

    def test_protection_dominates_disposable_and_unknown_labels(self):
        for label in PROTECTED:
            for labels in ((label,"NONESSENTIAL_MEDIA"), ("UNCLASSIFIED",label),
                           ("NONESSENTIAL_MEDIA",label,"UNKNOWN")):
                fact = StorageClassification(self.items[0].object_id, labels)
                self.assertEqual(assess_protection(fact).reason,"NEVER_EVICT_PROTECTED_CLASS")
                with self.assertRaisesRegex(InvalidComposition,"PROTECTED_EVICTION_FORBIDDEN"):
                    guard_eviction((self.items[0],),(fact,))

    def test_empty_and_unknown_classification_hold(self):
        for labels in ((), ("UNKNOWN",), ("USER_PHOTO",), ("NONESSENTIAL_MEDIA","UNKNOWN")):
            fact = StorageClassification(self.items[0].object_id,labels)
            self.assertEqual(assess_protection(fact).reason,"HELD_STORAGE_CLASSIFICATION_UNKNOWN")
            with self.assertRaisesRegex(InvalidComposition,"HELD_STORAGE_CLASSIFICATION_UNKNOWN"):
                guard_eviction((self.items[0],),(fact,))

    def test_multiple_disposable_labels_hold_conflict(self):
        fact = StorageClassification(self.items[0].object_id,DISPOSABLE_ORDER[:2])
        self.assertEqual(assess_protection(fact).reason,"HELD_STORAGE_CLASSIFICATION_CONFLICT")
        with self.assertRaisesRegex(InvalidComposition,"HELD_STORAGE_CLASSIFICATION_CONFLICT"):
            guard_eviction((self.items[0],),(fact,))

    def test_matching_singletons_preserve_order_and_none(self):
        result = guard_eviction(self.items[::-1],self.facts[::-1])
        self.assertEqual(result.ordered,self.items)
        self.assertEqual(result.authority,"NONE")
        for fact in self.facts:
            self.assertEqual(assess_protection(fact).reason,"DECLARED_DISPOSABLE_ONLY")
            self.assertEqual(assess_protection(fact).authority,"NONE")

    def test_missing_or_mismatched_fact_rejects(self):
        with self.assertRaisesRegex(InvalidComposition,"STORAGE_CLASSIFICATION_REQUIRED"):
            guard_eviction(self.items,self.facts[:1])
        fact = StorageClassification(self.items[0].object_id,("NONESSENTIAL_MEDIA",))
        with self.assertRaisesRegex(InvalidComposition,"STORAGE_CLASSIFICATION_MISMATCH"):
            guard_eviction((self.items[0],),(fact,))

    def test_extra_protected_inventory_and_explicit_protected_ids(self):
        extra = StorageClassification("user-history",("DURABLE_USER_DATA",))
        self.assertEqual(guard_eviction(self.items,self.facts+(extra,)).ordered,self.items)
        with self.assertRaisesRegex(InvalidComposition,"PROTECTED_EVICTION_FORBIDDEN"):
            guard_eviction(self.items,self.facts,(self.items[0].object_id,))
        self.assertEqual(guard_eviction((),(extra,)).ordered,())

    def test_duplicate_mutable_or_malformed_facts_reject(self):
        with self.assertRaises(InvalidComposition): guard_eviction(self.items,self.facts+self.facts)
        with self.assertRaises(InvalidComposition): guard_eviction(self.items,list(self.facts))
        for fact in (None,StorageClassification("",()),StorageClassification("a",[]),
                     StorageClassification("a",("",)),StorageClassification("a",(1,)),
                     StorageClassification("a",("NONESSENTIAL_MEDIA","NONESSENTIAL_MEDIA"))):
            with self.assertRaises(InvalidComposition): assess_protection(fact)

    def test_hostile_facts_and_labels_no_callbacks(self):
        class Hostile:
            def __getattr__(self,name): raise AssertionError("attribute invoked")
            def __eq__(self,other): raise AssertionError("equality invoked")
            def __hash__(self): raise AssertionError("hash invoked")
        hostile=Hostile()
        for fact in (hostile,StorageClassification(hostile,()),StorageClassification("a",(hostile,))):
            with self.assertRaises(InvalidComposition): assess_protection(fact)
        self.assertTrue(production_gate(hostile).reason.startswith("HELD_"))

    def test_immutability_coherent_forgery_and_production_always_held(self):
        fact=StorageClassification("hidden-floor",("NONESSENTIAL_MEDIA",))
        with self.assertRaises(FrozenInstanceError): fact.data_classes=()
        forged=guard_eviction((Disposable("hidden-floor","NONESSENTIAL_MEDIA",1),),(fact,))
        for claim in (forged,{"classification_verified":True,"encrypted":True},lambda:"ALLOW"):
            self.assertEqual(production_gate(claim).reason,
                             "HELD_CANONICAL_PROTECTED_STORAGE_SOURCE_AND_ENCRYPTED_RUNTIME_MISSING")


if __name__ == "__main__": unittest.main()
