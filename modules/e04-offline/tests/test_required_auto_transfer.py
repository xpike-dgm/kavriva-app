import sys
from dataclasses import replace, FrozenInstanceError
from hashlib import sha256
from pathlib import Path
import unittest

sys.path.insert(0,str(Path(__file__).resolve().parents[1]/"internal"))
from core_composition import Scope, Reference, Entry, Declaration, Part, InvalidComposition, declaration_digest
from full_package_fallback import PackageTarget
from optional_media import prepare_optional, UserRequest, spec_digest, request_optional, cancel_optional
from required_auto_transfer import RequiredNeed, TransferItem, plan_transfers, completion_notice, production_gate


class RequiredAutoTransferTests(unittest.TestCase):
    def fixture(self, payload_extra=b""):
        scope=Scope("motorcycle-1","task-1","release-1",1)
        parts=tuple(Part(scope,role,role.encode()+payload_extra) for role in
                    ("text","steps","warnings","checks","safe_stop","recovery","safety_media"))
        declaration=Declaration(scope,Reference("applicability","1","a"*64),
                                Reference("compatibility","1","b"*64),(),
                                tuple(Entry(p.part_id,p.part_id,sha256(p.payload).hexdigest()) for p in parts))
        target=PackageTarget(declaration,scope,declaration_digest(declaration))
        return RequiredNeed(scope,target,"REQUIRED_CORE",True),parts

    def setUp(self):
        self.need,self.parts=self.fixture()
        payload=b"optional fixture"
        self.optional=prepare_optional(self.need.target.declaration,self.need.selected_scope,
                                       self.need.target.expected_digest,self.parts,
                                       Reference("expanded-photo","1",sha256(payload).hexdigest()),
                                       len(payload),"NONESSENTIAL")
        self.request=UserRequest("request-1",spec_digest(self.optional.spec),"USER_FETCH")
        self.requested=request_optional(self.optional,self.request)

    def test_needed_core_is_automatic_without_user_intent_and_optional_not_created(self):
        plan=plan_transfers(self.need)
        self.assertEqual(plan.ordered,(TransferItem("REQUIRED_CORE",self.need.target),))
        self.assertEqual(plan.optional,())
        self.assertFalse(plan.confirmation_required)
        self.assertEqual(self.optional.state,"ABSENT")

    def test_wifi_cellular_roaming_unknown_offline_do_not_add_confirmation_or_change_priority(self):
        expected=plan_transfers(self.need,(self.requested,)).ordered
        for transport in ("WIFI","CELLULAR","ROAMING","UNKNOWN","OFFLINE"):
            plan=plan_transfers(self.need,(self.requested,),transport)
            self.assertEqual(plan.ordered,expected)
            self.assertFalse(plan.confirmation_required)
            self.assertEqual(plan.authority,"NONE")

    def test_arbitrary_fixture_sizes_never_create_byte_confirmation(self):
        # Fixture lengths only; no production policy thresholds selected.
        for extra in (b"",b"x"*1024,b"x"*8193):
            need,parts=self.fixture(extra)
            plan=plan_transfers(need,transport="ROAMING")
            self.assertFalse(plan.confirmation_required)
            self.assertEqual(len(plan.ordered),1)
            self.assertEqual(tuple(e.part_id for e in need.target.declaration.entries),tuple(p.part_id for p in parts))

    def test_required_core_precedes_only_already_explicit_optional_queue(self):
        before=(self.need,self.requested,self.parts)
        plan=plan_transfers(self.need,(self.requested,))
        self.assertEqual(tuple(i.kind for i in plan.ordered),("REQUIRED_CORE","EXPLICIT_NONESSENTIAL"))
        self.assertEqual(plan.ordered[1].payload,self.requested)
        self.assertEqual(before,(self.need,self.requested,self.parts))

    def test_task_without_need_does_not_automatically_fetch_core(self):
        need=replace(self.need,task_requires_content=False)
        self.assertEqual(plan_transfers(need).ordered,())
        plan=plan_transfers(need,(self.requested,))
        self.assertEqual(tuple(i.kind for i in plan.ordered),("EXPLICIT_NONESSENTIAL",))

    def test_unknown_optional_or_malformed_classification_cannot_enter_required_gate(self):
        for label in (None,True,"UNKNOWN","NONESSENTIAL"):
            with self.assertRaisesRegex(InvalidComposition,"^REQUIRED_CORE_CLASSIFICATION_REQUIRED$"):
                plan_transfers(replace(self.need,classification=label))
        with self.assertRaises(InvalidComposition):
            plan_transfers(replace(self.need,task_requires_content=1))

    def test_selected_scope_and_pinned_required_manifest_must_match(self):
        with self.assertRaisesRegex(InvalidComposition,"^REQUIRED_SELECTED_SCOPE_MISMATCH$"):
            plan_transfers(replace(self.need,selected_scope=replace(self.need.selected_scope,task_id="other")))
        with self.assertRaisesRegex(InvalidComposition,"^STAGE_CONTEXT_MISMATCH$"):
            plan_transfers(replace(self.need,target=replace(self.need.target,expected_digest="f"*64)))

    def test_optional_absent_cancelled_duplicate_or_wrong_core_context_rejected(self):
        cancelled=cancel_optional(self.requested,"request-1")
        for optional in ((self.optional,),(cancelled,),(self.requested,self.requested)):
            with self.assertRaises(InvalidComposition):
                plan_transfers(self.need,optional)
        need,parts=self.fixture(b"changed core")
        with self.assertRaisesRegex(InvalidComposition,"^OPTIONAL_QUEUE_CONTEXT_MISMATCH$"):
            plan_transfers(need,(self.requested,))

    def test_completion_has_no_approval_freshness_or_technical_truth_authority(self):
        plan=plan_transfers(self.need,(self.requested,))
        for item in plan.ordered:
            notice=completion_notice(plan,item)
            self.assertEqual(notice.meaning,"SUPPLIED_TRANSFER_OUTCOME_ONLY")
            self.assertEqual(notice.authority,"NONE")
            self.assertEqual(item.authority,"NONE")

    def test_unknown_completion_and_forged_omitted_or_reordered_required_schedule_rejected(self):
        plan=plan_transfers(self.need,(self.requested,))
        for forged in (replace(plan,ordered=plan.ordered[1:]),replace(plan,ordered=plan.ordered[::-1])):
            with self.assertRaisesRegex(InvalidComposition,"^TRANSFER_PROPOSAL_MISMATCH$"):
                completion_notice(forged,plan.ordered[0])
        empty=plan_transfers(replace(self.need,task_requires_content=False))
        with self.assertRaisesRegex(InvalidComposition,"^UNKNOWN_TRANSFER_COMPLETION$"):
            completion_notice(empty,plan.ordered[0])

    def test_hostile_mutable_or_wrong_types_never_run_callback(self):
        class Hostile:
            def __getattribute__(self,name):raise AssertionError("untrusted callback")
            def __eq__(self,other):raise AssertionError("untrusted equality")
        for need in (Hostile(),None,True):
            with self.assertRaises(InvalidComposition):plan_transfers(need)
        with self.assertRaises(InvalidComposition):plan_transfers(self.need,[self.requested])
        with self.assertRaises(InvalidComposition):plan_transfers(self.need,(Hostile(),))
        with self.assertRaises(InvalidComposition):plan_transfers(self.need,transport=Hostile())
        plan=plan_transfers(self.need)
        for item in (Hostile(),TransferItem("REQUIRED_CORE",Hostile()),TransferItem(Hostile(),self.need.target)):
            with self.assertRaises(InvalidComposition):completion_notice(plan,item)
        forged=replace(plan,ordered=(TransferItem("REQUIRED_CORE",Hostile()),))
        with self.assertRaises(InvalidComposition):completion_notice(forged,plan.ordered[0])

    def test_immutable_and_coherent_forged_need_completion_never_open_production(self):
        plan=plan_transfers(self.need)
        notice=completion_notice(plan,plan.ordered[0])
        with self.assertRaises(FrozenInstanceError):plan.ordered=()
        touched=[]
        for supplied in (plan,notice,{"required":True,"completed":True},lambda:touched.append(True)):
            self.assertEqual(production_gate(supplied).reason,"HELD_CANONICAL_REQUIRED_SOURCE_AND_TRANSFER_RUNTIME_MISSING")
            self.assertEqual(production_gate(supplied).authority,"NONE")
        self.assertEqual(touched,[])


if __name__=="__main__":unittest.main()
