"""Internal config release typing; no effective configuration or release permission.

Opaque bytes and declared meaning/capability/graph/reviewer contexts are fixtures.
No semantic extraction, current client envelope or authenticated writer is proved.
"""

from base64 import b64encode
from dataclasses import dataclass, field
import json

from snapshot_binding import (Reference, ReviewBinding, require_exact_binding,
                              snapshot_fingerprint)


KINDS = ("configuration", "feature_flag", "template", "migration", "transform")
GRAPH_SLOTS = ("binary", "api_contract", "content_manifest", "effective_config",
               "schema_migration", "external_models", "offline_packages", "generations")


class ConfigError(ValueError):
    def __init__(self, reason):
        self.reason = reason
        super().__init__(reason)


@dataclass(frozen=True)
class GraphEntry:
    slot: str
    reference: Reference


@dataclass(frozen=True)
class CapabilityEnvelope:
    reference: Reference
    supported_semantics: tuple[str, ...]


@dataclass(frozen=True)
class ConfigRelease:
    config_id: str
    revision: int
    kind: str
    payload: bytes = field(repr=False)
    declared_semantics: tuple[str, ...]
    author: Reference
    consequence_class: str
    graph: tuple[GraphEntry, ...]
    capability: CapabilityEnvelope
    clears_suspension: bool


@dataclass(frozen=True)
class TypedBinding:
    config: ConfigRelease = field(repr=False)
    review_binding: ReviewBinding = field(repr=False)

    @property
    def authority(self):
        return "NONE"


def _id(value):
    return (type(value) is str and bool(value)
            and not any(c.isspace() or ord(c) < 32 for c in value))


def _reference(value):
    if (type(value) is not Reference or not _id(value.ref_id)
            or type(value.revision) is not int or value.revision <= 0
            or type(value.digest) is not str or len(value.digest) != 64
            or any(c not in "0123456789abcdef" for c in value.digest)):
        raise ConfigError("IMMUTABLE_CONTEXT_REQUIRED")
    return [value.ref_id, value.revision, value.digest]


def _semantics(values):
    if (type(values) is not tuple or not values or any(not _id(x) for x in values)
            or len(set(values)) != len(values)):
        raise ConfigError("SEMANTIC_DECLARATION_REQUIRED")
    return list(values)


def config_envelope(config):
    """Internal review envelope, never a deployable config format or compiler."""
    if (type(config) is not ConfigRelease or not _id(config.config_id)
            or type(config.revision) is not int or config.revision <= 0
            or type(config.kind) is not str or config.kind not in KINDS
            or type(config.payload) is not bytes or not config.payload
            or not _id(config.consequence_class) or type(config.clears_suspension) is not bool):
        raise ConfigError("TYPED_CONFIG_REQUIRED")
    if config.clears_suspension:
        raise ConfigError("CONFIG_CANNOT_CLEAR_SUSPENSION")
    declared = _semantics(config.declared_semantics)
    if type(config.capability) is not CapabilityEnvelope:
        raise ConfigError("CAPABILITY_CONTEXT_REQUIRED")
    capability_ref = _reference(config.capability.reference)
    supported = _semantics(config.capability.supported_semantics)
    if not set(declared).issubset(supported):
        raise ConfigError("OUTSIDE_DECLARED_CAPABILITY_ENVELOPE")
    if type(config.graph) is not tuple or len(config.graph) != len(GRAPH_SLOTS):
        raise ConfigError("COMPLETE_RELEASE_GRAPH_REQUIRED")
    graph = []
    for entry, slot in zip(config.graph, GRAPH_SLOTS):
        if type(entry) is not GraphEntry or type(entry.slot) is not str or entry.slot != slot:
            raise ConfigError("COMPLETE_RELEASE_GRAPH_REQUIRED")
        graph.append([slot, _reference(entry.reference)])
    record = {"config": [config.config_id, config.revision, config.kind],
              "payload": b64encode(config.payload).decode("ascii"),
              "semantics": declared, "author": _reference(config.author),
              "consequence": config.consequence_class, "graph": graph,
              "capability": [capability_ref, supported], "clears_suspension": False}
    return json.dumps(record, sort_keys=True, separators=(",", ":"),
                      ensure_ascii=True).encode("ascii")


def bind_typed_config(config, review_binding, *, server_time):
    envelope = config_envelope(config)
    if type(review_binding) is not ReviewBinding:
        raise ConfigError("EXACT_REVIEW_REQUIRED")
    require_exact_binding(review_binding, review_binding.snapshot, server_time=server_time)
    if review_binding.snapshot.sections[1].payload != envelope:
        raise ConfigError("REVIEWED_CONFIG_CHANGED")
    return TypedBinding(config, review_binding)


def require_exact_config(binding, candidate, *, server_time):
    """No runtime action; matching declarations never authenticate actual semantics."""
    if type(binding) is not TypedBinding:
        raise ConfigError("TYPED_BINDING_REQUIRED")
    bind_typed_config(binding.config, binding.review_binding, server_time=server_time)
    if config_envelope(candidate) != config_envelope(binding.config):
        raise ConfigError("CONFIG_CHANGED")
    # Check both original packet and full review context using accepted linkage.
    if snapshot_fingerprint(binding.review_binding.snapshot) != binding.review_binding.review.snapshot_fingerprint:
        raise ConfigError("REVIEWED_CONFIG_CHANGED")
