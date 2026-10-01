"""Governed logical authority registry; metadata never grants product access.

This loader validates reviewed snapshots. It neither provisions a source nor
replaces current E3/E5 authorization. A logical binding can be resolved while
its physical activation is still HELD.
"""

from __future__ import annotations

import hashlib
import json
from dataclasses import dataclass
from pathlib import Path


DOMAIN_OWNERS = {
    "approved_facts": "E3", "user_records": "E3", "permissions": "E5",
    "domain_history": "E3", "protected_audit": "E5",
    "publishing_control": "E6", "objects": "E3", "phone_packages": "E3",
}
COPY_KINDS = frozenset({"search", "analytics", "cache", "notifications",
                        "package_builder", "client_copy"})


class RegistryError(ValueError):
    """A stable failure reason; callers must not guess a fallback source."""

    def __init__(self, reason: str):
        self.reason = reason
        super().__init__(reason)


@dataclass(frozen=True)
class Authority:
    domain_id: str
    authority_id: str
    revision: int
    owner: str
    state: str
    physical_activation: str


@dataclass(frozen=True)
class Registry:
    registry_id: str
    version: int
    supersedes_digest: str | None
    digest: str
    authorities: tuple[Authority, ...]

    def resolve(self, domain_id: str, *, expected_version: int,
                expected_revision: int, source_kind: str = "canonical") -> Authority:
        if source_kind != "canonical":
            raise RegistryError("NON_AUTHORITATIVE_SOURCE")
        if expected_version != self.version or type(expected_version) is not int:
            raise RegistryError("REGISTRY_VERSION_MISMATCH")
        authority = next((a for a in self.authorities if a.domain_id == domain_id), None)
        if authority is None:
            raise RegistryError("UNKNOWN_DOMAIN")
        if authority.state != "ACTIVE":
            raise RegistryError("DOMAIN_HELD")
        if type(expected_revision) is not int or expected_revision != authority.revision:
            raise RegistryError("AUTHORITY_REVISION_MISMATCH")
        return authority


def _pairs_unique(pairs):
    result = {}
    for key, value in pairs:
        if key in result:
            raise RegistryError("DUPLICATE_JSON_KEY")
        result[key] = value
    return result


def _positive_int(value):
    return type(value) is int and value > 0


def load_registry(path: str | Path) -> Registry:
    raw = Path(path).read_bytes()
    try:
        data = json.loads(raw, object_pairs_hook=_pairs_unique)
    except (UnicodeError, json.JSONDecodeError) as exc:
        raise RegistryError("INVALID_REGISTRY_JSON") from exc
    if not isinstance(data, dict) or set(data) != {
        "registry_id", "version", "supersedes_digest", "authorities",
    }:
        raise RegistryError("INVALID_REGISTRY_SHAPE")
    if data["registry_id"] != "kavriva.domain-authority" or not _positive_int(data["version"]):
        raise RegistryError("INVALID_REGISTRY_ID_VERSION")
    previous = data["supersedes_digest"]
    if data["version"] == 1:
        if previous is not None:
            raise RegistryError("INVALID_SUPERSEDES")
    elif (not isinstance(previous, str) or len(previous) != 64
          or any(c not in "0123456789abcdef" for c in previous)):
        raise RegistryError("INVALID_SUPERSEDES")
    if not isinstance(data["authorities"], list):
        raise RegistryError("INVALID_AUTHORITIES")
    entries = []
    domains, identities = set(), set()
    for row in data["authorities"]:
        if not isinstance(row, dict) or set(row) != set(Authority.__dataclass_fields__):
            raise RegistryError("INVALID_AUTHORITY_SHAPE")
        domain = row["domain_id"]
        if not isinstance(domain, str) or domain not in DOMAIN_OWNERS:
            raise RegistryError("UNKNOWN_DOMAIN")
        if domain in domains:
            raise RegistryError("MULTIPLE_DOMAIN_AUTHORITIES")
        identity = row["authority_id"]
        if not isinstance(identity, str) or identity != "kavriva.authority." + domain:
            raise RegistryError("UNSTABLE_AUTHORITY_ID")
        if identity in identities:
            raise RegistryError("DUPLICATE_AUTHORITY_ID")
        if row["owner"] != DOMAIN_OWNERS[domain]:
            raise RegistryError("DOMAIN_OWNER_MISMATCH")
        if not _positive_int(row["revision"]):
            raise RegistryError("INVALID_AUTHORITY_REVISION")
        if row["state"] not in ("ACTIVE", "HELD"):
            raise RegistryError("INVALID_AUTHORITY_STATE")
        # This initial registry proves logical assignments only.
        if row["physical_activation"] != "HELD":
            raise RegistryError("UNPROVEN_PHYSICAL_ACTIVATION")
        domains.add(domain)
        identities.add(identity)
        entries.append(Authority(**row))
    if domains != set(DOMAIN_OWNERS):
        raise RegistryError("MISSING_DOMAIN")
    return Registry(data["registry_id"], data["version"], previous,
                    hashlib.sha256(raw).hexdigest(), tuple(entries))


def validate_successor(previous: Registry, successor: Registry) -> None:
    """Require the reviewed predecessor and a single, explicit version step.

    Snapshot publication is via PR/CI/review; this function is validation,
    not a mutable registry writer or a production switch-over mechanism.
    """
    if successor.registry_id != previous.registry_id:
        raise RegistryError("REGISTRY_ID_CHANGED")
    if successor.version != previous.version + 1:
        raise RegistryError("INVALID_VERSION_STEP")
    if successor.supersedes_digest != previous.digest:
        raise RegistryError("PREDECESSOR_DIGEST_MISMATCH")
    old = {a.domain_id: a for a in previous.authorities}
    new = {a.domain_id: a for a in successor.authorities}
    if set(old) != set(new):
        raise RegistryError("DOMAIN_SET_CHANGED")
    for domain, before in old.items():
        after = new[domain]
        if (after.authority_id, after.owner) != (before.authority_id, before.owner):
            raise RegistryError("AUTHORITY_IDENTITY_CHANGED")
        changed = (after.state, after.physical_activation) != (before.state, before.physical_activation)
        if after.revision != before.revision + int(changed):
            raise RegistryError("INVALID_REVISION_STEP")
