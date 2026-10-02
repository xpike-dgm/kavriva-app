"""Required-only automatic scheduling policy, never an executing downloader.

Task need, classification, source and optional intent are supplied declarations.
Neither scheduling nor a completion notice grants actual runtime authority.
"""
from dataclasses import dataclass

from core_composition import Scope, Assessment, InvalidComposition, _scope
from full_package_fallback import PackageTarget, _target
from optional_media import OptionalRecord, _record


TRANSPORTS = frozenset({"WIFI", "CELLULAR", "ROAMING", "UNKNOWN", "OFFLINE"})


@dataclass(frozen=True)
class RequiredNeed:
    selected_scope: Scope
    target: PackageTarget
    classification: str
    task_requires_content: bool


@dataclass(frozen=True)
class TransferItem:
    kind: str
    payload: PackageTarget | OptionalRecord

    @property
    def authority(self): return "NONE"


@dataclass(frozen=True)
class TransferProposal:
    need: RequiredNeed
    transport: str
    optional: tuple[OptionalRecord, ...]
    ordered: tuple[TransferItem, ...]

    @property
    def confirmation_required(self): return False

    @property
    def authority(self): return "NONE"


@dataclass(frozen=True)
class CompletionNotice:
    item: TransferItem
    meaning: str

    @property
    def authority(self): return "NONE"


def _need(need):
    if type(need) is not RequiredNeed:
        raise InvalidComposition("INVALID_REQUIRED_NEED")
    _scope(need.selected_scope)
    _target(need.target)
    if need.selected_scope != need.target.expected_scope:
        raise InvalidComposition("REQUIRED_SELECTED_SCOPE_MISMATCH")
    if type(need.classification) is not str or need.classification != "REQUIRED_CORE":
        raise InvalidComposition("REQUIRED_CORE_CLASSIFICATION_REQUIRED")
    if type(need.task_requires_content) is not bool:
        raise InvalidComposition("INVALID_REQUIRED_NEED")


def plan_transfers(need, optional=(), transport="UNKNOWN"):
    """Queue a declared needed core first without a user-confirmation condition.

    Transport is descriptive only; even OFFLINE produces only a plan, not a
    promise of connectivity. Real optional E1 entrypoints still need the size
    guard and authenticated visible gesture before any actual runtime queue.
    """
    _need(need)
    if type(transport) is not str or transport not in TRANSPORTS:
        raise InvalidComposition("INVALID_TRANSPORT_DECLARATION")
    if type(optional) is not tuple:
        raise InvalidComposition("MUTABLE_OPTIONAL_QUEUE")
    seen = set()
    for record in optional:
        _record(record)
        if record.state != "REQUESTED":
            raise InvalidComposition("OPTIONAL_EXPLICIT_REQUEST_REQUIRED")
        if (record.spec.core_scope != need.selected_scope
                or record.spec.core_digest != need.target.expected_digest):
            raise InvalidComposition("OPTIONAL_QUEUE_CONTEXT_MISMATCH")
        identity = record.spec.media_ref.object_id
        if identity in seen:
            raise InvalidComposition("DUPLICATE_OPTIONAL_QUEUE_ITEM")
        seen.add(identity)
    required = (TransferItem("REQUIRED_CORE", need.target),) if need.task_requires_content else ()
    ordered = required + tuple(TransferItem("EXPLICIT_NONESSENTIAL", record) for record in optional)
    return TransferProposal(need, transport, optional, ordered)


def _item(item):
    if type(item) is not TransferItem or type(item.kind) is not str:
        raise InvalidComposition("INVALID_TRANSFER_ITEM")
    if item.kind == "REQUIRED_CORE":
        _target(item.payload)
    elif item.kind == "EXPLICIT_NONESSENTIAL":
        _record(item.payload)
    else:
        raise InvalidComposition("INVALID_TRANSFER_ITEM")


def completion_notice(proposal, item):
    """Report a supplied transport outcome only, with no byte or trust claim."""
    if type(proposal) is not TransferProposal or type(proposal.ordered) is not tuple:
        raise InvalidComposition("INVALID_TRANSFER_PROPOSAL")
    expected = plan_transfers(proposal.need, proposal.optional, proposal.transport)
    for member in proposal.ordered:
        _item(member)
    if proposal.ordered != expected.ordered:
        raise InvalidComposition("TRANSFER_PROPOSAL_MISMATCH")
    _item(item)
    if item not in expected.ordered:
        raise InvalidComposition("UNKNOWN_TRANSFER_COMPLETION")
    return CompletionNotice(item, "SUPPLIED_TRANSFER_OUTCOME_ONLY")


def production_gate(request=None):
    return Assessment("HELD_CANONICAL_REQUIRED_SOURCE_AND_TRANSFER_RUNTIME_MISSING")
