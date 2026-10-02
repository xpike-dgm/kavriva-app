"""Logical release-domain registration; never current release permission.

Expected digest/version must come from a separately reviewed snapshot. A caller
hashing its own bytes has not authenticated them. No keys, lane effects, staffing,
audit receipt, policy freshness or production activation are provided here.
"""

from dataclasses import dataclass
import hashlib
import json
import re


DOMAINS = (
    "consumer_binary", "internal_web", "backend_service", "database_migration",
    "technical_content", "configuration_policy", "emergency_suspension", "future_ota",
)


class RegistryError(ValueError):
    def __init__(self, reason: str):
        self.reason = reason
        super().__init__(reason)


@dataclass(frozen=True)
class Authority:
    domain: str
    authority_id: str
    action_kind: str
    credential_domain: str
    audit_event_kind: str
    consequence_check: str
    policy_status: str
    physical_activation: str

    @property
    def authority(self) -> str:
        return "NONE"


@dataclass(frozen=True)
class Registry:
    version: int
    digest: str
    entries: tuple[Authority, ...]

    @property
    def authority(self) -> str:
        return "NONE"


def _pairs(items):
    result = {}
    for key, value in items:
        if key in result:
            raise RegistryError("DUPLICATE_JSON_KEY")
        result[key] = value
    return result


def _invalid_constant(value):
    raise RegistryError("REGISTRY_FORMAT_INVALID")


def _binding_values(domain: str) -> dict[str, str]:
    return {
        "authority_id": "kavriva.release." + domain,
        "action_kind": "release_action." + domain,
        "credential_domain": "release_credential_domain." + domain,
        "audit_event_kind": "release_audit_event." + domain,
        "consequence_check": "release_consequence." + domain,
        "policy_status": "NOT_APPROVED" if domain == "future_ota" else "REGISTERED",
        "physical_activation": "HELD",
    }


def load_registry(raw: bytes, *, expected_digest: str, expected_version: int) -> Registry:
    """Validate exact reviewed bytes and taxonomy; return metadata with no authority.

    Revision 1 deliberately cannot configure actual credentials/holders or open
    a release. Such implementation requires later independently reviewed policy.
    """
    if (type(raw) is not bytes or type(expected_digest) is not str
            or not re.fullmatch(r"[0-9a-f]{64}", expected_digest)
            or type(expected_version) is not int or expected_version != 1):
        raise RegistryError("REGISTRY_EXPECTATION_INVALID")
    digest = hashlib.sha256(raw).hexdigest()
    if digest != expected_digest:
        raise RegistryError("REGISTRY_DIGEST_MISMATCH")
    try:
        document = json.loads(raw.decode("utf-8"), object_pairs_hook=_pairs,
                              parse_constant=_invalid_constant)
    except (UnicodeError, ValueError) as error:
        if isinstance(error, RegistryError):
            raise
        raise RegistryError("REGISTRY_FORMAT_INVALID") from None
    if (type(document) is not dict
            or set(document) != {"schema_version", "registry_version", "authorities"}
            or type(document["schema_version"]) is not int or document["schema_version"] != 1
            or type(document["registry_version"]) is not int
            or document["registry_version"] != expected_version):
        raise RegistryError("REGISTRY_VERSION_OR_SHAPE_INVALID")
    items = document["authorities"]
    if type(items) is not list or len(items) != len(DOMAINS):
        raise RegistryError("EIGHT_AUTHORITIES_REQUIRED")
    required = {"domain", "authority_id", "action_kind", "credential_domain",
                "audit_event_kind", "consequence_check", "policy_status",
                "physical_activation", "custodian_ref", "credential_ref", "audit_custody_ref"}
    entries = []
    seen = set()
    for item in items:
        if type(item) is not dict or set(item) != required:
            raise RegistryError("AUTHORITY_SHAPE_INVALID")
        domain = item["domain"]
        if type(domain) is not str or domain not in DOMAINS or domain in seen:
            raise RegistryError("AUTHORITY_DOMAIN_INVALID")
        seen.add(domain)
        expected = _binding_values(domain)
        if any(type(item[key]) is not str or item[key] != value
               for key, value in expected.items()):
            raise RegistryError("AUTHORITY_BINDING_OR_HOLD_INVALID")
        if any(item[key] is not None
               for key in ("custodian_ref", "credential_ref", "audit_custody_ref")):
            raise RegistryError("PHYSICAL_BINDING_NOT_IMPLEMENTED")
        entries.append(Authority(domain=domain, **expected))
    if tuple(entry.domain for entry in entries) != DOMAINS:
        raise RegistryError("AUTHORITY_ORDER_INVALID")
    return Registry(expected_version, digest, tuple(entries))


def resolve_metadata(registry: Registry, domain: str) -> Authority:
    """Resolve a logical domain, including denied OTA, without granting permission.

    Returned object cannot stand for current authenticated policy, credentials or
    a release receipt. There is no effect executor or positive decision API.
    """
    if type(registry) is not Registry or type(domain) is not str or domain not in DOMAINS:
        raise RegistryError("UNKNOWN_RELEASE_DOMAIN")
    if (type(registry.version) is not int or registry.version != 1
            or type(registry.digest) is not str
            or not re.fullmatch(r"[0-9a-f]{64}", registry.digest)
            or type(registry.entries) is not tuple or len(registry.entries) != len(DOMAINS)):
        raise RegistryError("REGISTRY_VERSION_OR_SHAPE_INVALID")
    for entry, expected_domain in zip(registry.entries, DOMAINS):
        if (type(entry) is not Authority or type(entry.domain) is not str
                or entry.domain != expected_domain
                or any(type(getattr(entry, key)) is not str or getattr(entry, key) != value
                       for key, value in _binding_values(expected_domain).items())):
            raise RegistryError("AUTHORITY_BINDING_OR_HOLD_INVALID")
    return registry.entries[DOMAINS.index(domain)]
