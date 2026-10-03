"""Check declared compact recovery coverage; never authorize physical start.

Graph fingerprints bind supplied declarations locally, not a production format.
Coherent omitted states or falsely reviewed instructions remain untrusted.
"""
from dataclasses import dataclass
from hashlib import sha256
import json

from core_composition import Scope, Reference, InvalidComposition, _scope, _reference, _id
from stage_verify_promote import _verified


@dataclass(frozen=True)
class RecoveryEdge:
    source_state: str
    target_state: str


@dataclass(frozen=True)
class RecoveryCoverage:
    state: str
    safe_stop_part: str | None
    recovery_part: str | None


@dataclass(frozen=True)
class RecoveryGraph:
    scope: Scope
    capability: Reference
    entry_state: str
    states: tuple[str, ...]
    edges: tuple[RecoveryEdge, ...]
    coverage: tuple[RecoveryCoverage, ...]


@dataclass(frozen=True)
class ClosureAssessment:
    reason: str
    reachable_states: tuple[str, ...]
    uncovered_states: tuple[str, ...]

    @property
    def authority(self): return "NONE"

    @property
    def physical_start(self): return False


def graph_digest(graph):
    if type(graph) is not RecoveryGraph:
        raise InvalidComposition("INVALID_RECOVERY_GRAPH")
    _scope(graph.scope)
    _reference(graph.capability)
    if (type(graph.states) is not tuple or not graph.states or not all(_id(v) for v in graph.states)
            or len(set(graph.states)) != len(graph.states) or not _id(graph.entry_state)
            or graph.entry_state not in graph.states):
        raise InvalidComposition("INVALID_RECOVERY_STATES")
    if type(graph.edges) is not tuple or type(graph.coverage) is not tuple:
        raise InvalidComposition("MUTABLE_RECOVERY_GRAPH")
    edges, covered = set(), set()
    for edge in graph.edges:
        if (type(edge) is not RecoveryEdge or not _id(edge.source_state) or not _id(edge.target_state)
                or edge.source_state not in graph.states or edge.target_state not in graph.states):
            raise InvalidComposition("INVALID_RECOVERY_EDGE")
        pair = (edge.source_state, edge.target_state)
        if pair in edges:
            raise InvalidComposition("DUPLICATE_RECOVERY_EDGE")
        edges.add(pair)
    for item in graph.coverage:
        if (type(item) is not RecoveryCoverage or not _id(item.state) or item.state not in graph.states
                or any(value is not None and not _id(value)
                       for value in (item.safe_stop_part, item.recovery_part))):
            raise InvalidComposition("INVALID_RECOVERY_COVERAGE")
        if item.state in covered:
            raise InvalidComposition("DUPLICATE_RECOVERY_COVERAGE")
        covered.add(item.state)
    scope, cap = graph.scope, graph.capability
    fields = ((scope.motorcycle_id, scope.task_id, scope.release_id, scope.generation),
              (cap.object_id, cap.revision, cap.digest), graph.entry_state, graph.states,
              tuple((e.source_state, e.target_state) for e in graph.edges),
              tuple((c.state, c.safe_stop_part, c.recovery_part) for c in graph.coverage))
    try:
        return sha256(json.dumps(fields, ensure_ascii=True, separators=(",", ":")).encode("ascii")).hexdigest()
    except (ValueError, TypeError, OverflowError, RecursionError):
        raise InvalidComposition("RECOVERY_CONTEXT_ENCODING_FAILED") from None


def check_closure(candidate, graph, graph_reference, *, evidence_status="UNKNOWN"):
    """Recheck complete bytes and all declared mappings before reachability."""
    verified = _verified(candidate)
    fingerprint = graph_digest(graph)
    _reference(graph_reference)
    if (type(evidence_status) is not str or evidence_status not in {"CURRENT", "EXPIRED", "UNKNOWN"}):
        raise InvalidComposition("INVALID_RECOVERY_EVIDENCE_STATUS")
    if graph.scope != verified.stage.expected_scope:
        raise InvalidComposition("RECOVERY_SELECTED_SCOPE_MISMATCH")
    if (graph_reference.digest != fingerprint
            or graph_reference not in verified.context.dependencies):
        raise InvalidComposition("RECOVERY_GRAPH_PIN_MISMATCH")
    entries = {entry.part_id: entry for entry in verified.stage.declaration.entries}
    for item in graph.coverage:
        for part_id, role in ((item.safe_stop_part, "safe_stop"), (item.recovery_part, "recovery")):
            if part_id is not None:
                if part_id not in entries:
                    raise InvalidComposition("RECOVERY_PART_NOT_IN_COMPACT_CORE")
                if entries[part_id].role != role:
                    raise InvalidComposition("RECOVERY_PART_ROLE_MISMATCH")
    successors = {state: [] for state in graph.states}
    for edge in graph.edges:
        successors[edge.source_state].append(edge.target_state)
    pending, reachable = [graph.entry_state], set()
    while pending:
        state = pending.pop()
        if state in reachable:
            continue
        reachable.add(state)
        pending.extend(successors[state])
    mappings = {item.state: item for item in graph.coverage}
    uncovered = tuple(sorted(state for state in reachable if state not in mappings
                             or mappings[state].safe_stop_part is None
                             or mappings[state].recovery_part is None))
    if uncovered:
        reason = "HELD_INCOMPLETE_RECOVERY_CLOSURE"
    elif graph.capability != verified.context.compatibility:
        reason = "HELD_UNSUPPORTED_RECOVERY_CAPABILITY"
    elif evidence_status != "CURRENT":
        reason = "HELD_EXPIRED_OR_UNKNOWN_RECOVERY_EVIDENCE"
    else:
        reason = "DECLARED_CLOSURE_COMPLETE_CANONICAL_SOURCE_AND_OFFLINE_AUTHORITY_HELD"
    return ClosureAssessment(reason, tuple(sorted(reachable)), uncovered)


def production_gate(request=None):
    return ClosureAssessment(
        "HELD_CANONICAL_REVIEWED_CLOSURE_ELIGIBILITY_TAXONOMY_WINDOWS_AND_ENCRYPTED_RUNTIME_MISSING", (), ())
