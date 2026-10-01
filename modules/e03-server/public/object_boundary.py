"""E3 object integrity/lineage contract (T-E3-011), not an access grant.

Factories compute byte digests and inherit exact classification. Every object
starts quarantined. Source authentication, current source lookup, authorized
disclosure and activation belong to the caller's later guarded integration.
"""

from __future__ import annotations

import hashlib
from dataclasses import dataclass


CLASSIFICATIONS = frozenset({"private", "shared", "community", "official", "security"})
DERIVATIVE_KINDS = frozenset({"thumbnail", "transcode", "extraction", "copy",
    "export", "backup", "cache", "search", "analytics", "notification", "package"})
QUARANTINE = "OBJECT_QUARANTINE"


class ObjectBoundaryError(ValueError):
    def __init__(self, reason: str):
        self.reason = reason
        super().__init__(reason)


@dataclass(frozen=True)
class ObjectReference:
    object_id: str
    generation: int
    digest: str
    classification: str
    owner_id: str
    retention_policy_ref: str


@dataclass(frozen=True)
class ObjectManifest:
    object_id: str
    generation: int
    digest: str
    classification: str
    owner_id: str
    retention_policy_ref: str
    state: str
    derivative_kind: str | None
    parent_refs: tuple[ObjectReference, ...]
    lineage: tuple[ObjectReference, ...]


@dataclass(frozen=True)
class ObjectVersion:
    manifest: ObjectManifest
    payload: bytes


def _digest(payload: bytes) -> str:
    if type(payload) is not bytes:
        raise ObjectBoundaryError("OBJECT_BYTES_REQUIRED")
    return hashlib.sha256(payload).hexdigest()


def _validate_reference(ref: ObjectReference) -> None:
    if type(ref) is not ObjectReference:
        raise ObjectBoundaryError("INVALID_LINEAGE_REFERENCE")
    if any(not isinstance(v, str) or not v.strip() for v in (
        ref.object_id, ref.owner_id, ref.retention_policy_ref,
    )):
        raise ObjectBoundaryError("OBJECT_METADATA_MISSING")
    if type(ref.generation) is not int or ref.generation < 1:
        raise ObjectBoundaryError("OBJECT_GENERATION_INVALID")
    if (not isinstance(ref.digest, str) or len(ref.digest) != 64
            or any(c not in "0123456789abcdef" for c in ref.digest)):
        raise ObjectBoundaryError("OBJECT_DIGEST_INVALID")
    if not isinstance(ref.classification, str) or ref.classification not in CLASSIFICATIONS:
        raise ObjectBoundaryError("CLASSIFICATION_UNKNOWN")


def reference_of(manifest: ObjectManifest) -> ObjectReference:
    return ObjectReference(manifest.object_id, manifest.generation, manifest.digest,
        manifest.classification, manifest.owner_id, manifest.retention_policy_ref)


def verify_object(version: ObjectVersion) -> None:
    """Verify supplied bytes/metadata; never authenticate their canonical origin."""
    if type(version) is not ObjectVersion or type(version.manifest) is not ObjectManifest:
        raise ObjectBoundaryError("INVALID_OBJECT_VERSION")
    manifest = version.manifest
    _validate_reference(reference_of(manifest))
    if manifest.digest != _digest(version.payload):
        raise ObjectBoundaryError("OBJECT_DIGEST_MISMATCH")
    if manifest.state != QUARANTINE:
        raise ObjectBoundaryError("OBJECT_ACTIVATION_HELD")
    if type(manifest.lineage) is not tuple or type(manifest.parent_refs) is not tuple:
        raise ObjectBoundaryError("INVALID_LINEAGE")
    if manifest.derivative_kind is None:
        if manifest.lineage or manifest.parent_refs:
            raise ObjectBoundaryError("ORIGINAL_WITH_LINEAGE")
    elif (not isinstance(manifest.derivative_kind, str)
          or manifest.derivative_kind not in DERIVATIVE_KINDS
          or not manifest.lineage or not manifest.parent_refs):
        raise ObjectBoundaryError("DERIVATIVE_LINEAGE_MISSING")
    seen = {}
    for ref in manifest.lineage:
        _validate_reference(ref)
        if ref.object_id == manifest.object_id:
            raise ObjectBoundaryError("LINEAGE_CYCLE")
        if ref.object_id in seen:
            raise ObjectBoundaryError("DUPLICATE_LINEAGE_SOURCE")
        seen[ref.object_id] = ref
        if ref.classification != manifest.classification:
            raise ObjectBoundaryError("CLASSIFICATION_PROPAGATION_MISMATCH")
        if ref.owner_id != manifest.owner_id:
            raise ObjectBoundaryError("OWNER_PROPAGATION_MISMATCH")
        if ref.retention_policy_ref != manifest.retention_policy_ref:
            raise ObjectBoundaryError("RETENTION_PROPAGATION_MISMATCH")
    direct = set()
    for ref in manifest.parent_refs:
        _validate_reference(ref)
        if ref.object_id in direct or seen.get(ref.object_id) != ref:
            raise ObjectBoundaryError("INVALID_DIRECT_PARENT")
        direct.add(ref.object_id)


def create_original(*, object_id: str, generation: int, payload: bytes,
                    classification: str, owner_id: str,
                    retention_policy_ref: str) -> ObjectVersion:
    version = ObjectVersion(ObjectManifest(object_id, generation, _digest(payload),
        classification, owner_id, retention_policy_ref, QUARANTINE, None, (), ()), payload)
    verify_object(version)
    return version


def derive_object(*, object_id: str, generation: int, payload: bytes,
                  parents: tuple[ObjectVersion, ...], kind: str) -> ObjectVersion:
    """Compute the child's own digest; preserve full transitive source lineage.

    Labels are not ordered. Mixed classification/owner/retention requires a
    separately governed policy, so this initial contract holds that operation.
    """
    if type(parents) is not tuple or not parents:
        raise ObjectBoundaryError("DERIVATIVE_SOURCE_MISSING")
    if not isinstance(kind, str) or kind not in DERIVATIVE_KINDS:
        raise ObjectBoundaryError("DERIVATIVE_KIND_UNKNOWN")
    for parent in parents:
        verify_object(parent)
    source = parents[0].manifest
    direct = set()
    parent_refs = []
    lineage = {}
    for parent in parents:
        manifest = parent.manifest
        if manifest.object_id in direct:
            raise ObjectBoundaryError("DUPLICATE_PARENT")
        direct.add(manifest.object_id)
        parent_refs.append(reference_of(manifest))
        if manifest.classification != source.classification:
            raise ObjectBoundaryError("CLASSIFICATION_POLICY_HELD")
        if manifest.owner_id != source.owner_id:
            raise ObjectBoundaryError("OWNER_POLICY_HELD")
        if manifest.retention_policy_ref != source.retention_policy_ref:
            raise ObjectBoundaryError("RETENTION_POLICY_HELD")
        for ref in (reference_of(manifest),) + manifest.lineage:
            if ref.object_id in lineage and lineage[ref.object_id] != ref:
                raise ObjectBoundaryError("SOURCE_VERSION_CONFLICT")
            lineage[ref.object_id] = ref
    version = ObjectVersion(ObjectManifest(object_id, generation, _digest(payload),
        source.classification, source.owner_id, source.retention_policy_ref,
        QUARANTINE, kind, tuple(sorted(parent_refs, key=lambda ref: ref.object_id)),
        tuple(lineage[k] for k in sorted(lineage))), payload)
    verify_object(version)
    return version


def verify_derivative(version: ObjectVersion, *, parents: tuple[ObjectVersion, ...]) -> None:
    """Recompute expected metadata from verified parent bytes, not child claims."""
    verify_object(version)
    if version.manifest.derivative_kind is None:
        raise ObjectBoundaryError("DERIVATIVE_REQUIRED")
    expected = derive_object(object_id=version.manifest.object_id,
        generation=version.manifest.generation, payload=version.payload,
        parents=parents, kind=version.manifest.derivative_kind)
    if version.manifest != expected.manifest:
        raise ObjectBoundaryError("DERIVATIVE_PROVENANCE_MISMATCH")
