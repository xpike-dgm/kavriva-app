"""T-E3-012: exact-version validation contract; not publication or read authority."""

from dataclasses import asdict, dataclass
import hashlib
import json

from commit_authorization import CommitRequest
from object_boundary import ObjectReference, ObjectVersion, verify_object


BASE_CHECKS = frozenset({"integrity", "source_provenance", "content_safety",
                         "classification", "retention", "purpose_eligibility"})
ACTION = "activate_object"


@dataclass(frozen=True)
class ActivationRequest:
    commit: CommitRequest
    manifest_fingerprint: str
    validation_policy_version: str


@dataclass(frozen=True)
class ValidationCheck:
    name: str
    verdict: str
    receipt: str


@dataclass(frozen=True)
class ObjectValidation:
    manifest_fingerprint: str
    policy_version: str
    required_checks: tuple[str, ...]
    checks: tuple[ValidationCheck, ...]


@dataclass(frozen=True)
class SourceFence:
    """Trusted same-transaction source authority, never a client/cached ALLOW."""
    tenant_id: str
    operation_id: str
    source: ObjectReference
    policy_ref: str
    negative_floor_ref: str
    authorized: bool
    floor_clear: bool


def manifest_fingerprint(version: ObjectVersion) -> str:
    verify_object(version)
    encoded = json.dumps(asdict(version.manifest), sort_keys=True,
                         separators=(",", ":"), ensure_ascii=False).encode("utf-8")
    return hashlib.sha256(encoded).hexdigest()


def activation_fingerprint(request: ActivationRequest) -> str:
    """Bind the entire requested effect; cached decisions have no authority."""
    fields = asdict(request)
    fields["commit"].pop("fingerprint")
    fields["commit"].pop("cached_decision")
    return hashlib.sha256(json.dumps(fields, sort_keys=True,
        separators=(",", ":"), ensure_ascii=False).encode("utf-8")).hexdigest()


def validation_reason(version: ObjectVersion, request: ActivationRequest,
                      validation: ObjectValidation | None) -> str | None:
    """Consume trusted current evidence, never scanner output sent by a client.

    The adapter must lock the object, ancestors, policy and receipts and recheck
    current authorization/floors/audit before recording eligibility. These pure
    checks cannot authenticate a receipt issuer or resolve a retention policy.
    """
    if manifest_fingerprint(version) != request.manifest_fingerprint:
        return "OBJECT_VERSION_CHANGED"
    if type(validation) is not ObjectValidation:
        return "OBJECT_VALIDATION_MISSING"
    if (validation.manifest_fingerprint != request.manifest_fingerprint
            or validation.policy_version != request.validation_policy_version):
        return "OBJECT_VALIDATION_STALE"
    required = validation.required_checks
    if (type(required) is not tuple or not required
            or any(type(name) is not str or not name.strip() for name in required)
            or len(set(required)) != len(required)
            or not BASE_CHECKS.issubset(required)
            or (version.manifest.classification == "official"
                and "technical_correctness" not in required)):
        return "OBJECT_VALIDATION_POLICY_INCOMPLETE"
    if type(validation.checks) is not tuple:
        return "OBJECT_VALIDATION_INCOMPLETE"
    checks = {}
    for check in validation.checks:
        if (type(check) is not ValidationCheck or type(check.name) is not str
                or not check.name.strip() or check.name in checks
                or type(check.receipt) is not str or not check.receipt.strip()):
            return "OBJECT_VALIDATION_INCOMPLETE"
        if check.verdict != "PASS":
            return "OBJECT_VALIDATION_NOT_PASSED"
        checks[check.name] = check
    if not set(required).issubset(checks):
        return "OBJECT_VALIDATION_INCOMPLETE"
    return None
