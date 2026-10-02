"""Structural publication separation; canonical privileged identity is missing.

All supplied human/control/assignment/session references are fixture metadata.
Successful structural comparison never authenticates them or grants permission.
The actual publication entry remains HELD until canonical E5/E3 integration.
"""

from dataclasses import dataclass
from datetime import datetime, timezone
import re


ROLES = ("author", "domain_reviewer", "safety_approver", "publisher")


@dataclass(frozen=True)
class Change:
    operation_id: str
    subject_digest: str
    authority_domain: str
    policy_version: str
    packet_kind: str


@dataclass(frozen=True)
class Binding:
    change: Change
    role: str
    principal_kind: str
    principal_ref: str
    controlling_humans: tuple[str, ...]
    control_chain_complete: bool
    assignment_ref: str
    session_ref: str
    assurance_ref: str
    observed_at: datetime
    valid_until: datetime


@dataclass(frozen=True)
class Assessment:
    state: str
    reason: str

    @property
    def authority(self) -> str:
        return "NONE"


def _ref(value: object) -> bool:
    return (type(value) is str and bool(value)
            and not any(char.isspace() or ord(char) < 32 for char in value))


def _time(value: object) -> bool:
    return type(value) is datetime and value.tzinfo is timezone.utc


def _change(value: object) -> bool:
    return (type(value) is Change
            and all(_ref(item) for item in (value.operation_id, value.authority_domain,
                                           value.policy_version, value.packet_kind))
            and type(value.subject_digest) is str
            and bool(re.fullmatch(r"[0-9a-f]{64}", value.subject_digest)))


def _held(reason: str) -> Assessment:
    return Assessment("HELD", reason)


def assess_fixture_structure(change: Change, bindings: tuple[Binding, ...],
                             *, server_time: datetime) -> Assessment:
    """Check supplied fixture identities for the four ADR003R8 publication roles.

    Only high-consequence technical-content publication is modeled. No generic
    emergency rule or other release-domain role compatibility is invented.
    """
    if not _change(change) or not _time(server_time):
        return _held("PUBLICATION_CONTEXT_INVALID")
    if (change.authority_domain != "technical_content"
            or change.packet_kind != "high_consequence_publication"):
        return _held("RELEASE_PROFILE_NOT_IMPLEMENTED")
    if type(bindings) is not tuple or len(bindings) != len(ROLES):
        return _held("INDEPENDENT_ROLES_MISSING")
    roles = set()
    principals = set()
    sessions = set()
    assignments = set()
    controller_sets = []
    for binding in bindings:
        if type(binding) is not Binding or not _change(binding.change):
            return _held("ROLE_BINDING_INVALID")
        if binding.change != change:
            return _held("PUBLICATION_PACKET_MISMATCH")
        if (not _ref(binding.role) or binding.role not in ROLES or binding.role in roles
                or not _ref(binding.principal_kind)
                or binding.principal_kind not in {"human", "service", "emergency"}
                or any(not _ref(item) for item in (binding.principal_ref, binding.assignment_ref,
                                                 binding.session_ref, binding.assurance_ref))):
            return _held("ROLE_BINDING_INVALID")
        if (type(binding.control_chain_complete) is not bool
                or not binding.control_chain_complete
                or type(binding.controlling_humans) is not tuple
                or not binding.controlling_humans
                or any(not _ref(item) for item in binding.controlling_humans)
                or len(set(binding.controlling_humans)) != len(binding.controlling_humans)):
            return _held("CONTROLLING_HUMAN_UNKNOWN")
        if (not _time(binding.observed_at) or not _time(binding.valid_until)
                or binding.observed_at > server_time or binding.valid_until <= server_time):
            return _held("ASSIGNMENT_OR_SESSION_STALE")
        controllers = frozenset(binding.controlling_humans)
        if (binding.principal_ref in principals
                or any(controllers & previous for previous in controller_sets)):
            return _held("PER_CHANGE_HUMAN_COLLAPSE")
        if binding.session_ref in sessions or binding.assignment_ref in assignments:
            return _held("SESSION_OR_ASSIGNMENT_REUSED")
        principals.add(binding.principal_ref)
        sessions.add(binding.session_ref)
        assignments.add(binding.assignment_ref)
        roles.add(binding.role)
        controller_sets.append(controllers)
    return Assessment("FIXTURE_STRUCTURE_MATCH", "CANONICAL_IDENTITY_NOT_PROVED")


def publication_gate(change: Change, bindings: tuple[Binding, ...],
                     *, server_time: datetime) -> Assessment:
    """Fail closed even for coherent fixtures; no canonical privileged reader yet.

    Future actual E5 resolution must verify identities, complete delegation and
    competence/current roles/session/assurance, and E3 must bind protected audit
    and current authorization to the actual effect. This entry cannot ALLOW.
    """
    assessment = assess_fixture_structure(change, bindings, server_time=server_time)
    if assessment.state == "HELD":
        return assessment
    return _held("CANONICAL_PRIVILEGED_IDENTITY_SOURCE_MISSING")
