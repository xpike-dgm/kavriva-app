"""Internal composition checks, not a package format or canonical approval source.

All declarations and pins are supplied data. A coherent forged declaration can
match structurally. E3 canonical source verification is deliberately still held.
No storage, rendering, decoding, download or promotion is performed here.
"""
from dataclasses import dataclass
from hashlib import sha256
import json
import re


ROLES = frozenset({"text", "steps", "warnings", "checks", "safe_stop", "recovery", "safety_media"})
REQUIRED_ROLES = ROLES - {"safety_media"}


@dataclass(frozen=True)
class Reference:
    object_id: str
    revision: str
    digest: str


@dataclass(frozen=True)
class Scope:
    motorcycle_id: str
    task_id: str
    release_id: str
    generation: int


@dataclass(frozen=True)
class Entry:
    part_id: str
    role: str
    digest: str


@dataclass(frozen=True)
class Declaration:
    scope: Scope
    applicability: Reference
    compatibility: Reference
    dependencies: tuple[Reference, ...]
    entries: tuple[Entry, ...]


@dataclass(frozen=True)
class Part:
    scope: Scope
    part_id: str
    payload: bytes


@dataclass(frozen=True)
class Assessment:
    reason: str

    @property
    def authority(self):
        return "NONE"


class InvalidComposition(ValueError):
    """Finite reason only: never echo supplied payload or identifiers."""


def _id(value):
    return type(value) is str and re.fullmatch(r"[A-Za-z0-9][A-Za-z0-9_.:-]*", value) is not None


def _digest(value):
    return type(value) is str and re.fullmatch(r"[0-9a-f]{64}", value) is not None


def _scope(value):
    if (type(value) is not Scope or not all(_id(v) for v in
            (value.motorcycle_id, value.task_id, value.release_id))
            or type(value.generation) is not int or value.generation < 1):
        raise InvalidComposition("INVALID_SCOPE")


def _reference(value):
    if (type(value) is not Reference or not _id(value.object_id)
            or not _id(value.revision) or not _digest(value.digest)):
        raise InvalidComposition("INVALID_REFERENCE")


def declaration_digest(value):
    """Local deterministic binding fingerprint; not a serialized product contract."""
    if type(value) is not Declaration:
        raise InvalidComposition("INVALID_DECLARATION")
    _scope(value.scope)
    _reference(value.applicability)
    _reference(value.compatibility)
    if type(value.dependencies) is not tuple or type(value.entries) is not tuple:
        raise InvalidComposition("MUTABLE_DECLARATION")
    dependency_ids = set()
    for ref in value.dependencies:
        _reference(ref)
        if ref.object_id in dependency_ids:
            raise InvalidComposition("DUPLICATE_DEPENDENCY")
        dependency_ids.add(ref.object_id)
    part_ids, roles = set(), set()
    for entry in value.entries:
        if (type(entry) is not Entry or not _id(entry.part_id)
                or type(entry.role) is not str or entry.role not in ROLES
                or not _digest(entry.digest)):
            raise InvalidComposition("INVALID_ENTRY")
        if entry.part_id in part_ids:
            raise InvalidComposition("DUPLICATE_ENTRY")
        part_ids.add(entry.part_id)
        roles.add(entry.role)
    if not REQUIRED_ROLES <= roles:
        raise InvalidComposition("MISSING_REQUIRED_ROLE")
    ref_tuple = lambda ref: (ref.object_id, ref.revision, ref.digest)
    scope = value.scope
    fields = ((scope.motorcycle_id, scope.task_id, scope.release_id, scope.generation),
              ref_tuple(value.applicability), ref_tuple(value.compatibility),
              tuple(ref_tuple(ref) for ref in value.dependencies),
              tuple((entry.part_id, entry.role, entry.digest) for entry in value.entries))
    return sha256(json.dumps(fields, separators=(",", ":"), ensure_ascii=True).encode("ascii")).hexdigest()


def check_composition(declaration, expected_scope, expected_digest, parts):
    """Match exactly the pinned supplied declaration, retaining every declared part.

    A match means only exact supplied bytes/membership/context; never ALLOW or
    verified canonical generation, classification, compatibility or safe recovery.
    """
    _scope(expected_scope)
    if not _digest(expected_digest):
        raise InvalidComposition("INVALID_MANIFEST_PIN")
    actual_digest = declaration_digest(declaration)
    if declaration.scope != expected_scope:
        raise InvalidComposition("SELECTED_SCOPE_MISMATCH")
    if actual_digest != expected_digest:
        raise InvalidComposition("MANIFEST_PIN_MISMATCH")
    if type(parts) is not tuple:
        raise InvalidComposition("MUTABLE_CORE")
    expected = {entry.part_id: entry for entry in declaration.entries}
    seen = set()
    for part in parts:
        if type(part) is not Part:
            raise InvalidComposition("INVALID_PART")
        _scope(part.scope)
        if part.scope != expected_scope:
            raise InvalidComposition("MIXED_SCOPE_OR_GENERATION")
        if not _id(part.part_id) or part.part_id not in expected:
            raise InvalidComposition("UNDECLARED_PART")
        if part.part_id in seen:
            raise InvalidComposition("DUPLICATE_PART")
        seen.add(part.part_id)
        if type(part.payload) is not bytes or not part.payload:
            raise InvalidComposition("INVALID_PAYLOAD")
        if sha256(part.payload).hexdigest() != expected[part.part_id].digest:
            raise InvalidComposition("PAYLOAD_DIGEST_MISMATCH")
    if seen != expected.keys():
        raise InvalidComposition("INCOMPLETE_CORE")
    return Assessment("STRUCTURE_MATCH")


def production_gate(request=None):
    """No caller flag/callback/pin can supply the absent canonical source."""
    return Assessment("HELD_CANONICAL_PACKAGE_SOURCE_MISSING")
