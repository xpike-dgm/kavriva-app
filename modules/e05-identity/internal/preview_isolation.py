"""Internal isolation requirements, not a renderer, access decision or proof issuer.

All verification markers and references are trusted-input configuration fixtures.
A future governed serving adapter must resolve actual observations and current
authorization separately. A structurally valid configuration never permits access.
"""

from dataclasses import dataclass, field, fields
import re
from urllib.parse import urlsplit

from quarantine_pipeline import Record, State, Subject, _record


class IsolationError(ValueError):
    def __init__(self, reason: str):
        self.reason = reason
        super().__init__(reason)


@dataclass(frozen=True)
class Boundary:
    operations_origin: str
    preview_origin: str
    verification_ref: str
    cookie_site_separation_verified: bool
    credential_free_delivery_verified: bool
    egress_denied_verified: bool
    privileged_apis_denied_verified: bool
    direct_entry_sandbox_verified: bool
    passive_text_renderer_verified: bool
    native_handoff_denied_verified: bool
    navigation_download_print_denied_verified: bool


@dataclass(frozen=True)
class Derivative:
    source_subject: Subject
    source_receipt_ref: str
    derived_object_id: str
    derived_digest: str
    transformation_receipt_ref: str
    classification: str
    passive_text_only: bool


@dataclass(frozen=True)
class Requirements:
    boundary: Boundary = field(repr=False)
    derivative: Derivative = field(repr=False)
    response_headers: tuple[tuple[str, str], ...]
    @property
    def iframe_sandbox_tokens(self) -> tuple[str, ...]:
        return ()

    @property
    def request_credentials(self) -> str:
        return "omit"

    @property
    def content_status(self) -> str:
        return "UNTRUSTED_PREVIEW"

    @property
    def authority(self) -> str:
        return "NONE"


def _text(value: object) -> bool:
    return type(value) is str and bool(value.strip())


def _origin(value: object) -> str:
    if (not _text(value) or not value.isascii()
            or any(ord(c) <= 32 or ord(c) == 127 for c in value)):
        raise IsolationError("ORIGIN_INVALID")
    try:
        parsed = urlsplit(value)
        port = parsed.port
    except ValueError:
        raise IsolationError("ORIGIN_INVALID") from None
    if (parsed.scheme != "https" or not parsed.hostname or parsed.username is not None
            or parsed.password is not None or parsed.path or parsed.query or parsed.fragment
            or not re.fullmatch(r"[a-z0-9]+(?:[.-][a-z0-9]+)*", parsed.hostname)
            or parsed.netloc != parsed.hostname + (f":{port}" if port is not None else "")):
        raise IsolationError("ORIGIN_INVALID")
    return "https://" + parsed.hostname + (f":{port}" if port not in (None, 443) else "")


def preview_requirements(record: Record, derivative: Derivative,
                         boundary: Boundary) -> Requirements:
    """Return required controls after structural checks; never grant preview access.

    HTTPS origins are configuration values, never fetched. Separate host strings
    do not prove cookie-site isolation; that independently verified requirement is
    mandatory. References/booleans here are not authenticated production evidence.
    """
    _record(record)
    if record.state not in {State.SCANNED, State.RENDERED_UNTRUSTED_PREVIEW,
                            State.HUMAN_CLASSIFIED, State.SAFE_FOR_HUMAN_REVIEW}:
        raise IsolationError("SOURCE_PROCESSING_HELD")
    if type(derivative) is not Derivative:
        raise IsolationError("DERIVATIVE_REQUIRED")
    if (derivative.source_subject != record.subject
            or derivative.source_receipt_ref != record.history[-1].observation.receipt_ref
            or derivative.classification != record.subject.classification):
        raise IsolationError("DERIVATIVE_PROVENANCE_MISMATCH")
    if (not _text(derivative.derived_object_id)
            or derivative.derived_object_id == record.subject.object_id
            or not _text(derivative.transformation_receipt_ref)
            or derivative.transformation_receipt_ref == derivative.source_receipt_ref):
        raise IsolationError("DERIVATIVE_PROVENANCE_MISSING")
    digest = derivative.derived_digest
    if type(digest) is not str or not re.fullmatch(r"[0-9a-f]{64}", digest):
        raise IsolationError("DERIVATIVE_DIGEST_INVALID")
    if derivative.passive_text_only is not True:
        raise IsolationError("ACTIVE_OR_UNKNOWN_CONTENT_HELD")
    if type(boundary) is not Boundary:
        raise IsolationError("ISOLATION_UNVERIFIED")
    operations, preview = _origin(boundary.operations_origin), _origin(boundary.preview_origin)
    if operations == preview:
        raise IsolationError("OPERATIONS_ORIGIN_FORBIDDEN")
    if not _text(boundary.verification_ref):
        raise IsolationError("ISOLATION_UNVERIFIED")
    for item in fields(Boundary):
        if item.name.endswith("_verified") and getattr(boundary, item.name) is not True:
            raise IsolationError("ISOLATION_UNVERIFIED")
    csp = ("default-src 'none'; script-src 'none'; connect-src 'none'; img-src 'none'; "
           "style-src 'none'; font-src 'none'; media-src 'none'; object-src 'none'; "
           "frame-src 'none'; worker-src 'none'; base-uri 'none'; form-action 'none'; "
           f"frame-ancestors {operations}; sandbox")
    return Requirements(boundary, derivative, (
        ("Content-Type", "text/html; charset=utf-8"),
        ("Content-Security-Policy", csp),
        ("Cache-Control", "no-store"),
        ("Referrer-Policy", "no-referrer"),
        ("X-Content-Type-Options", "nosniff"),
        ("Permissions-Policy", "camera=(), microphone=(), geolocation=(), payment=(), "
         "usb=(), serial=(), hid=(), clipboard-read=(), clipboard-write=(), fullscreen=()"),
    ))
