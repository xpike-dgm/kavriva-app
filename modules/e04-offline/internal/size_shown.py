"""Optional size presentation bindings; supplied receipts are not UI evidence.

No rendering, download or authenticated user gesture is implemented here.
All outputs have intrinsic NONE authority; production stays held.
"""
from dataclasses import dataclass
from hashlib import sha256
import json

from core_composition import Assessment, InvalidComposition, _id, _digest
from optional_media import UserRequest, _record, spec_digest, request_optional


@dataclass(frozen=True)
class SizePreview:
    spec_digest: str
    declared_bytes: int
    label: str

    @property
    def authority(self):
        return "NONE"


@dataclass(frozen=True)
class SizeShownReceipt:
    preview_digest: str
    request_id: str
    displayed_bytes: int
    displayed_label: str

    @property
    def authority(self):
        return "NONE"


def _label(size):
    if type(size) is not int or size < 1:
        raise InvalidComposition("INVALID_SIZE_PREVIEW")
    try:
        return f"{size} bayt"
    except (ValueError, OverflowError):
        raise InvalidComposition("SIZE_PREVIEW_ENCODING_FAILED") from None


def _spec(record):
    try:
        _record(record)
        return spec_digest(record.spec)
    except InvalidComposition:
        raise
    except (ValueError, TypeError, OverflowError, RecursionError):
        raise InvalidComposition("SIZE_CONTEXT_ENCODING_FAILED") from None


def preview_size(record):
    """Produce exact text to surface later, without asserting it was shown."""
    context = _spec(record)
    size = record.spec.declared_bytes
    return SizePreview(context, size, _label(size))


def preview_digest(preview):
    if (type(preview) is not SizePreview or not _digest(preview.spec_digest)
            or type(preview.label) is not str
            or preview.label != _label(preview.declared_bytes)):
        raise InvalidComposition("INVALID_SIZE_PREVIEW")
    try:
        encoded = json.dumps((preview.spec_digest, preview.declared_bytes, preview.label),
                             ensure_ascii=True, separators=(",", ":")).encode("ascii")
    except (ValueError, TypeError, OverflowError, RecursionError):
        raise InvalidComposition("SIZE_PREVIEW_ENCODING_FAILED") from None
    return sha256(encoded).hexdigest()


def request_after_size(record, request, receipt):
    """Validate a declared presentation before entering the request model.

    A coherent forged receipt can pass this rule. It cannot open production;
    actual E1 visibility/provenance and user intent still need implementation.
    """
    preview = preview_size(record)
    if (type(request) is not UserRequest or not _id(request.request_id)
            or not _digest(request.spec_digest) or type(request.action) is not str
            or request.action != "USER_FETCH"):
        raise InvalidComposition("EXPLICIT_USER_REQUEST_REQUIRED")
    if request.spec_digest != preview.spec_digest:
        raise InvalidComposition("REQUEST_CONTEXT_MISMATCH")
    if (type(receipt) is not SizeShownReceipt or not _digest(receipt.preview_digest)
            or not _id(receipt.request_id) or type(receipt.displayed_bytes) is not int
            or type(receipt.displayed_label) is not str):
        raise InvalidComposition("SIZE_SHOWN_RECEIPT_REQUIRED")
    if (receipt.preview_digest != preview_digest(preview)
            or receipt.request_id != request.request_id
            or receipt.displayed_bytes != preview.declared_bytes
            or receipt.displayed_label != preview.label):
        raise InvalidComposition("SIZE_SHOWN_CONTEXT_MISMATCH")
    return request_optional(record, request)


def production_gate(request=None):
    return Assessment("HELD_CANONICAL_SIZE_PRESENTATION_AND_RUNTIME_MISSING")
