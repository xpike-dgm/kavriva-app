"""No OTA/runtime code-update channel is approved (ADR007 R10).

This is a denial guard, not a downloader, code loader, signer or activation
checklist. Caller metadata and future requirement claims are never evaluated.
"""

from dataclasses import dataclass


@dataclass(frozen=True)
class FutureRequirement:
    key: str
    requirement: str


FUTURE_REQUIREMENTS = (
    FutureRequirement("separate_authority", "Explicitly approve distinct actions, credentials, audit events and consequence checks."),
    FutureRequirement("mutable_envelope", "Explicitly approve the bounded mutable envelope."),
    FutureRequirement("signing_versioning", "Bind signed versioned artifacts to that envelope."),
    FutureRequirement("provenance", "Verify exact source/build/artifact provenance."),
    FutureRequirement("compatibility", "Prove client/platform/capability compatibility."),
    FutureRequirement("anti_rollback", "Prove monotonic anti-rollback behavior."),
    FutureRequirement("staged_rollout", "Prove staged observation, pause and stop behavior."),
    FutureRequirement("revocation", "Prove revocation and negative precedence."),
    FutureRequirement("platform_policy", "Obtain the applicable platform/store policy review."),
    FutureRequirement("protected_native_boundary", "Never silently replace native/security-critical code."),
    FutureRequirement("no_permission_widening", "Never widen permissions through this channel."),
    FutureRequirement("separate_content_authority", "Never merge content approval with software publication."),
)


@dataclass(frozen=True)
class OtaDenial:
    # No constructor-supplied verdict, approval, identity or effect attributes.
    @property
    def verdict(self):
        return "DENY"

    @property
    def reason(self):
        return "OTA_NOT_APPROVED"

    @property
    def domain(self):
        return "future_ota"

    @property
    def authority(self):
        return "NONE"


def deny_ota(request=None):
    """Reject without inspecting request, invoking callbacks or executing effects.

    Completing the prospective catalog cannot enable this guard. A future
    channel requires separate explicit approval and a reviewed implementation.
    No audit/event/store/device evidence is created by this pure denial.
    """
    return OtaDenial()
