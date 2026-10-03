"""ADR009 R7 negative local-storage gate; no crypto or persistence runtime.

Representation labels are declarations, never at-rest encryption/key proof.
This internal gate supplies no positive path; actual mobile wiring remains held.
"""
from dataclasses import dataclass

from core_composition import InvalidComposition


OPERATIONS = frozenset({"READ", "WRITE", "STAGE", "PROMOTE", "COPY", "BACKUP",
                        "RESTORE", "MIGRATE", "EXPORT", "FALLBACK"})
REPRESENTATIONS = frozenset({"PLAINTEXT", "ENCRYPTED", "UNKNOWN"})


@dataclass(frozen=True)
class LocalStorageIntent:
    operation: str
    representation: str


@dataclass(frozen=True)
class StorageAssessment:
    reason: str

    @property
    def authority(self):
        return "NONE"

    @property
    def local_storage_ready(self):
        return False


def evaluate(intent):
    """Reject plaintext; hold all other declarations pending real device proof."""
    if type(intent) is not LocalStorageIntent:
        raise InvalidComposition("INVALID_LOCAL_STORAGE_INTENT")
    if type(intent.operation) is not str or intent.operation not in OPERATIONS:
        raise InvalidComposition("INVALID_LOCAL_STORAGE_OPERATION")
    if (type(intent.representation) is not str
            or intent.representation not in REPRESENTATIONS):
        raise InvalidComposition("INVALID_LOCAL_STORAGE_REPRESENTATION")
    if intent.representation == "PLAINTEXT":
        return StorageAssessment("BLOCKED_PLAINTEXT_LOCAL_STORAGE")
    return StorageAssessment("HELD_ENCRYPTION_MECHANISM_KEY_CUSTODY_AND_DEVICE_PROOF_MISSING")


def guarded_dispatch(intent, effect=None):
    """Closed gate: never inspect, call or return the supplied storage effect.

    No real adapter is wired here. Later wiring requires separate mechanism,
    key-lifecycle, backup/restore/migration and device evidence before opening.
    """
    return evaluate(intent)


def production_gate(request=None):
    """Caller flags or ciphertext metadata cannot replace encryption evidence."""
    return StorageAssessment("HELD_ENCRYPTED_LOCAL_RUNTIME_AND_KEY_LIFECYCLE_UNPROVEN")
