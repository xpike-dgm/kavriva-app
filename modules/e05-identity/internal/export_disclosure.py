"""Internal export records, not generation, permission or authenticated audit.

All references and source/field manifests are trusted-input fixtures. The future
canonical writer must verify current authorization, classification, complete field
coverage and protected before-effect audit. This module never handles field values.
"""

from dataclasses import dataclass, field
import re


CLASSIFICATIONS = frozenset({"private", "shared", "community", "official", "security"})


class ExportError(ValueError):
    def __init__(self, reason: str):
        self.reason = reason
        super().__init__(reason)


@dataclass(frozen=True)
class Source:
    object_id: str
    generation: int
    digest: str
    manifest_fingerprint: str
    classification: str
    policy_version: str


@dataclass(frozen=True)
class ExportField:
    field_id: str
    classification: str
    sensitive: bool


@dataclass(frozen=True)
class Inclusion:
    field_id: str
    decision_ref: str


@dataclass(frozen=True)
class Manifest:
    source: Source
    fields: tuple[ExportField, ...]
    inclusions: tuple[Inclusion, ...]

    @property
    def included_fields(self) -> tuple[str, ...]:
        return tuple(item.field_id for item in self.inclusions)

    @property
    def omitted_fields(self) -> tuple[str, ...]:
        return tuple(item.field_id for item in self.fields
                     if item.field_id not in self.included_fields)


@dataclass(frozen=True)
class Context:
    generation_id: str
    source: Source
    selected_fields: tuple[str, ...]
    actor_ref: str
    purpose: str
    recipient_ref: str
    destination_policy_ref: str
    authorization_action: str
    authorization_receipt_ref: str
    preview_receipt_ref: str


@dataclass(frozen=True)
class Observation:
    context: Context
    output_digest: str
    event_receipt_ref: str


@dataclass(frozen=True)
class DisclosureRecord:
    manifest: Manifest = field(repr=False)
    context: Context = field(repr=False)
    output_digest: str
    event_receipt_ref: str

    @property
    def residual_copy_warning(self) -> str:
        return ("Revoking or expiring the link stops future system access only. "
                "Downloaded, printed, copied, forwarded or captured copies cannot be retracted.")

    @property
    def external_copies_retractable(self) -> bool:
        return False

    @property
    def link_revocation_scope(self) -> str:
        return "FUTURE_SYSTEM_ACCESS_ONLY"

    @property
    def authority(self) -> str:
        return "NONE"


def _text(value: object) -> bool:
    return type(value) is str and bool(value.strip())


def _digest(value: object) -> bool:
    return type(value) is str and bool(re.fullmatch(r"[0-9a-f]{64}", value))


def _source(value: Source) -> None:
    if type(value) is not Source:
        raise ExportError("SOURCE_CONTEXT_INVALID")
    if (not _text(value.object_id) or not _text(value.policy_version)
            or type(value.generation) is not int or value.generation < 1
            or not _digest(value.digest) or not _digest(value.manifest_fingerprint)):
        raise ExportError("SOURCE_CONTEXT_INVALID")
    if type(value.classification) is not str or value.classification not in CLASSIFICATIONS:
        raise ExportError("CLASSIFICATION_HELD")


def minimize_manifest(source: Source, fields: tuple[ExportField, ...],
                      inclusions: tuple[Inclusion, ...] = ()) -> Manifest:
    """Omit every supplied field unless it has an explicit inclusion decision.

    This describes minimization; it cannot prove completeness of the supplied
    field universe or authenticate any named inclusion decision.
    """
    _source(source)
    if type(fields) is not tuple or not fields:
        raise ExportError("FIELD_MANIFEST_REQUIRED")
    known = set()
    for item in fields:
        if (type(item) is not ExportField or not _text(item.field_id)
                or type(item.sensitive) is not bool):
            raise ExportError("FIELD_CONTEXT_INVALID")
        if type(item.classification) is not str or item.classification != source.classification:
            raise ExportError("CLASSIFICATION_HELD")
        if item.field_id in known:
            raise ExportError("FIELD_DUPLICATE")
        known.add(item.field_id)
    if type(inclusions) is not tuple:
        raise ExportError("INCLUSION_CONTEXT_INVALID")
    included = set()
    for item in inclusions:
        if (type(item) is not Inclusion or not _text(item.field_id)
                or not _text(item.decision_ref)):
            raise ExportError("INCLUSION_CONTEXT_INVALID")
        if item.field_id not in known:
            raise ExportError("UNDECLARED_FIELD")
        if item.field_id in included:
            raise ExportError("INCLUSION_DUPLICATE")
        included.add(item.field_id)
    return Manifest(source, fields, inclusions)


def _context(value: Context) -> None:
    if type(value) is not Context:
        raise ExportError("EXPORT_CONTEXT_INVALID")
    _source(value.source)
    if any(not _text(item) for item in (
        value.generation_id, value.actor_ref, value.purpose, value.recipient_ref,
        value.destination_policy_ref, value.authorization_action,
        value.authorization_receipt_ref, value.preview_receipt_ref,
    )):
        raise ExportError("EXPORT_CONTEXT_INVALID")
    if value.authorization_action != "export":
        raise ExportError("EXPORT_CAPABILITY_REQUIRED")
    if value.authorization_receipt_ref == value.preview_receipt_ref:
        raise ExportError("EXPORT_AND_PREVIEW_RECEIPTS_DISTINCT")
    if (type(value.selected_fields) is not tuple or not value.selected_fields
            or any(not _text(item) for item in value.selected_fields)
            or len(set(value.selected_fields)) != len(value.selected_fields)):
        raise ExportError("EXPORT_SELECTION_INVALID")


def record_disclosure(manifest: Manifest, context: Context,
                      observation: Observation) -> DisclosureRecord:
    """Describe a non-retractable disclosure; perform no export or access effect.

    Event/output references are supplied metadata, not actual observed generation
    or protected custody. The future writer must resolve their authentic source.
    """
    if type(manifest) is not Manifest:
        raise ExportError("FIELD_MANIFEST_REQUIRED")
    minimize_manifest(manifest.source, manifest.fields, manifest.inclusions)
    _context(context)
    if (context.source != manifest.source
            or context.selected_fields != manifest.included_fields):
        raise ExportError("EXPORT_MANIFEST_MISMATCH")
    if type(observation) is not Observation:
        raise ExportError("DISCLOSURE_OBSERVATION_REQUIRED")
    _context(observation.context)
    if observation.context != context:
        raise ExportError("DISCLOSURE_CONTEXT_MISMATCH")
    if (not _digest(observation.output_digest) or not _text(observation.event_receipt_ref)
            or observation.event_receipt_ref in {
                context.authorization_receipt_ref, context.preview_receipt_ref,
            }):
        raise ExportError("DISCLOSURE_OBSERVATION_INVALID")
    return DisclosureRecord(manifest, context, observation.output_digest,
                            observation.event_receipt_ref)
