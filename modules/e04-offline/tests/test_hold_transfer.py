import sys
from dataclasses import replace, FrozenInstanceError
from pathlib import Path
import unittest

sys.path.insert(0,str(Path(__file__).resolve().parents[1]/"internal"))
from core_composition import InvalidComposition
from stage_verify_promote import Disposable, SpaceDeclaration, PROTECTED
from never_evict import StorageClassification
from hold_transfer import assess_staging, production_gate
import test_stage_verify_promote as accepted_fixture


class HoldTransferTests(unittest.TestCase):
    def setUp(self):
        fixture=accepted_fixture.StageVerifyPromoteTests();fixture.setUp()
        self.current,self.candidate,self.pin=fixture.current,fixture.candidate,fixture.pin
        self.new_size,self.old_size=fixture.new_size,fixture.old_size

    def assess(self, space, facts=(), candidate=None):
        return assess_staging(self.current,self.candidate if candidate is None else candidate,self.pin,space,facts)

    def test_insufficient_no_cleanup_holds_without_replacement(self):
        result=self.assess(SpaceDeclaration(self.new_size-1,0,()))
        self.assertEqual(result.reason,"HELD_INSUFFICIENT_STAGING_SPACE")
        self.assertIsNone(result.promotion)
        self.assertFalse(result.transfer_ready)
        self.assertEqual(result.authority,"NONE")

    def test_insufficient_after_all_disposable_holds_and_mutates_nothing(self):
        disposable=(Disposable("temp","INVALID_OR_ORPHAN_TEMP",1),)
        facts=(StorageClassification("temp",("INVALID_OR_ORPHAN_TEMP",)),)
        space=SpaceDeclaration(0,0,disposable);before=(self.current,self.candidate,space,facts)
        result=self.assess(space,facts)
        self.assertEqual(result.reason,"HELD_INSUFFICIENT_STAGING_SPACE")
        self.assertIsNone(result.promotion)
        self.assertEqual(before,(self.current,self.candidate,space,facts))

    def test_verification_extra_space_is_required(self):
        result=self.assess(SpaceDeclaration(self.new_size,1,()))
        self.assertEqual(result.reason,"HELD_INSUFFICIENT_STAGING_SPACE")
        result=self.assess(SpaceDeclaration(self.new_size+1,1,()))
        self.assertEqual(result.reason,"DECLARED_STAGING_PROPOSAL_ONLY")
        self.assertEqual(result.promotion.peak_package_bytes,self.old_size+self.new_size+1)

    def test_exact_declared_capacity_retains_whole_old_and_new_without_dispatch(self):
        result=self.assess(SpaceDeclaration(self.new_size,0,()))
        self.assertEqual(result.promotion.retained_previous,self.current)
        self.assertEqual(result.promotion.replacement,self.candidate)
        self.assertEqual(result.promotion.expected_current_digest,self.pin)
        self.assertEqual(result.promotion.proposed_cleanup_ids,())
        self.assertEqual(result.promotion.peak_package_bytes,self.old_size+self.new_size)
        self.assertFalse(result.transfer_ready)
        self.assertEqual(result.authority,"NONE")

    def test_cleanup_proposal_in_canonical_order_stops_when_declared_fit(self):
        disposable=(Disposable("projection","REBUILDABLE_PROJECTION",self.new_size),
                    Disposable("media","NONESSENTIAL_MEDIA",self.new_size),
                    Disposable("temp","INVALID_OR_ORPHAN_TEMP",1))
        facts=tuple(StorageClassification(i.object_id,(i.data_class,)) for i in disposable)
        result=self.assess(SpaceDeclaration(0,0,disposable),facts)
        self.assertEqual(result.promotion.proposed_cleanup_ids,("temp","media"))
        self.assertEqual(result.promotion.retained_previous,self.current)
        self.assertFalse(result.transfer_ready)

    def test_six_protected_classes_cannot_fund_staging_despite_candidate_relabel(self):
        item=Disposable("protected","NONESSENTIAL_MEDIA",self.new_size)
        for label in PROTECTED:
            facts=(StorageClassification("protected",(label,)),)
            with self.assertRaisesRegex(InvalidComposition,"PROTECTED_EVICTION_FORBIDDEN"):
                self.assess(SpaceDeclaration(0,0,(item,)),facts)

    def test_old_or_new_essential_identity_cannot_be_cleanup(self):
        for identity in (self.current.stage.parts[0].part_id,self.candidate.stage.parts[-1].part_id):
            item=Disposable(identity,"INVALID_OR_ORPHAN_TEMP",self.new_size)
            fact=StorageClassification(identity,(item.data_class,))
            with self.assertRaisesRegex(InvalidComposition,"PROTECTED_EVICTION_FORBIDDEN"):
                self.assess(SpaceDeclaration(0,0,(item,)),(fact,))

    def test_missing_unknown_or_conflicting_classification_rejects(self):
        item=Disposable("cache","OLD_INACTIVE_REFETCHABLE_CACHE",self.new_size)
        for facts in ((),(StorageClassification("cache",()),),
                      (StorageClassification("cache",("UNKNOWN",)),),
                      (StorageClassification("cache",("OLD_INACTIVE_REFETCHABLE_CACHE","NONESSENTIAL_MEDIA")),)):
            with self.assertRaises(InvalidComposition): self.assess(SpaceDeclaration(0,0,(item,)),facts)

    def test_partial_corrupt_mixed_and_stale_candidate_cannot_replace_old(self):
        before=self.current
        stage=self.candidate.stage
        for parts in (stage.parts[:-1],(replace(stage.parts[0],payload=b"corrupt"),)+stage.parts[1:],
                      (self.current.stage.parts[0],)+stage.parts[1:]):
            candidate=replace(self.candidate,stage=replace(stage,parts=parts))
            with self.assertRaises(InvalidComposition): self.assess(SpaceDeclaration(self.new_size,0,()),candidate=candidate)
        with self.assertRaises(InvalidComposition): self.assess(SpaceDeclaration(self.new_size,0,()),candidate=self.current)
        self.assertEqual(self.current,before)

    def test_invalid_capacity_pin_first_install_and_hostile_inputs(self):
        for space in (None,SpaceDeclaration(-1,0,()),SpaceDeclaration(True,0,()),SpaceDeclaration(0,-1,()),
                      SpaceDeclaration(self.new_size,False,()),SpaceDeclaration(self.new_size,0,[])):
            with self.assertRaises(InvalidComposition): self.assess(space)
        with self.assertRaises(InvalidComposition):
            assess_staging(self.current,self.candidate,"0"*64,SpaceDeclaration(self.new_size,0,()))
        result=assess_staging(None,self.candidate,None,SpaceDeclaration(self.new_size,0,()))
        self.assertIsNone(result.promotion.retained_previous)
        class Hostile:
            def __getattr__(self,name):raise AssertionError("attribute invoked")
        with self.assertRaises(InvalidComposition): self.assess(Hostile())
        self.assertTrue(production_gate(Hostile()).reason.startswith("HELD_"))

    def test_immutable_outcome_and_production_held_even_coherent_forgery(self):
        result=self.assess(SpaceDeclaration(self.new_size,0,()))
        with self.assertRaises(FrozenInstanceError): result.reason="ALLOW"
        for claim in (result,{"disk_verified":True,"cleanup_complete":True,"encrypted":True},lambda:"ALLOW"):
            self.assertEqual(production_gate(claim).reason,
                             "HELD_CANONICAL_CAPACITY_CLASSIFICATION_AND_ENCRYPTED_TRANSFER_RUNTIME_MISSING")


if __name__ == "__main__":unittest.main()
