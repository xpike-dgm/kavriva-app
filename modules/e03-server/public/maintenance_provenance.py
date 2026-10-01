"""Maintenance history representation; provenance is not permission or audit.

Only the private canonical reader supplies HistorySnapshot in product use.
No public wire parser accepts client-declared source kinds or authority flags.
Copies retain lineage but cannot be passed as a current canonical snapshot.
"""

from __future__ import annotations

from dataclasses import dataclass
from datetime import date, datetime

from domain_authority import COPY_KINDS


class ProvenanceError(ValueError):
    def __init__(self, reason: str):
        self.reason = reason
        super().__init__(reason)


@dataclass(frozen=True)
class MaintenanceRevision:
    generation: int
    operation_id: str
    actor_id: str
    recorded_at: datetime
    performed_on: date
    odometer_km: int | None
    outcome: str
    safety_notes: str
    correction_reason: str | None
    evidence_level: str


@dataclass(frozen=True)
class HistorySnapshot:
    tenant_id: str
    record_id: str
    motorcycle_id: str
    current_generation: int
    revisions: tuple[MaintenanceRevision, ...]


@dataclass(frozen=True)
class ConvenienceCopy:
    kind: str
    source_tenant_id: str
    source_record_id: str
    source_motorcycle_id: str
    source_generation: int
    revisions: tuple[MaintenanceRevision, ...]
    # A historical lineage pointer, never the copy's own authority identity.
    source_authority_id: str = "kavriva.authority.user_records"


def validate_history(snapshot: HistorySnapshot) -> None:
    if type(snapshot) is not HistorySnapshot:
        raise ProvenanceError("NON_CANONICAL_SOURCE")
    if any(not isinstance(v, str) or not v.strip() for v in (
        snapshot.tenant_id, snapshot.record_id, snapshot.motorcycle_id,
    )):
        raise ProvenanceError("HISTORY_IDENTITY_MISSING")
    if (type(snapshot.current_generation) is not int or snapshot.current_generation < 1
            or type(snapshot.revisions) is not tuple
            or len(snapshot.revisions) != snapshot.current_generation):
        raise ProvenanceError("HISTORY_INCOMPLETE")
    operations = set()
    for generation, revision in enumerate(snapshot.revisions, 1):
        if type(revision) is not MaintenanceRevision or type(revision.generation) is not int \
                or revision.generation != generation:
            raise ProvenanceError("HISTORY_GENERATION_MISMATCH")
        if any(not isinstance(v, str) or not v.strip() for v in (
            revision.operation_id, revision.actor_id, revision.outcome,
        )) or not isinstance(revision.safety_notes, str):
            raise ProvenanceError("PROVENANCE_MISSING")
        if revision.operation_id in operations:
            raise ProvenanceError("PROVENANCE_OPERATION_REUSED")
        operations.add(revision.operation_id)
        if (type(revision.recorded_at) is not datetime or revision.recorded_at.tzinfo is None
                or type(revision.performed_on) is not date):
            raise ProvenanceError("PROVENANCE_TIME_INVALID")
        if revision.odometer_km is not None and (
            type(revision.odometer_km) is not int or revision.odometer_km < 0
        ):
            raise ProvenanceError("PROVENANCE_ODOMETER_INVALID")
        if revision.evidence_level != "USER_REPORTED":
            raise ProvenanceError("UNPROVEN_VERIFICATION")
        if generation > 1 and (not isinstance(revision.correction_reason, str)
                               or not revision.correction_reason.strip()):
            raise ProvenanceError("CORRECTION_REASON_MISSING")


def current_revision(snapshot: HistorySnapshot) -> MaintenanceRevision:
    """Select only the canonical head; history/copy cannot substitute for it.

    This is data selection, not authorization, freshness or source authentication.
    Direct dataclass construction is not proof of canonical origin.
    """
    validate_history(snapshot)
    return snapshot.revisions[-1]


def make_convenience_copy(snapshot: HistorySnapshot, *, kind: str) -> ConvenienceCopy:
    validate_history(snapshot)
    if kind not in COPY_KINDS:
        raise ProvenanceError("UNKNOWN_COPY_KIND")
    return ConvenienceCopy(kind, snapshot.tenant_id, snapshot.record_id,
                           snapshot.motorcycle_id, snapshot.current_generation,
                           snapshot.revisions)
