"""Registration v1: all Markdown records have identity, metadata and intact origin custody.

This is serialization/admission evidence, not the later seven semantic graph detectors.
Existing identity keys keep their type namespace and immutable slug. profile_of is a
relationship, not an ID; records without prior identity receive a stored first claim.
"""
import re
import sys
from datetime import date
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
from _lib import APP_ROOT, repo_files, read, frontmatter_yaml, parse_simple, fail, reject
from _record_preservation import verify_origin, verify_origin_catalog

FIELDS = ("purpose", "domain", "module", "owner", "depends_on", "used_by", "implements",
          "public_contracts", "internal_scope", "tasks", "tests", "evidence",
          "supersedes", "superseded_by", "status", "last_verified")
IDENTITY_KEYS = ("task_id", "test_id", "contract", "pack_id", "inventory_id", "record_id")


def inspect_records(root, paths):
    findings = []
    seen = {}
    for path in paths:
        text = path.read_text(encoding="utf-8")
        block = frontmatter_yaml(text)
        data = parse_simple(block)
        keys = re.findall(r"^([A-Za-z0-9_]+):", block, re.M)
        if len(keys) != len(set(keys)):
            findings.append((2, path, "duplicate frontmatter keys"))
        missing = [k for k in FIELDS if k not in data]
        if missing:
            findings.append((1, path, "missing frontmatter fields: " + ", ".join(missing)))
        for k in ("purpose", "domain", "module", "owner", "internal_scope", "status", "last_verified"):
            if not isinstance(data.get(k), str) or not data.get(k, "").strip():
                findings.append((1, path, "empty/non-scalar metadata: " + k))
        try:
            date.fromisoformat(str(data.get("last_verified", "")))
        except ValueError:
            findings.append((1, path, "last_verified is not a date"))
        module = data.get("module", "")
        if (not isinstance(module, str) or not re.fullmatch(r"e\d{2}-[a-z0-9-]+", module)
                or not (Path(root) / "modules" / module / "MANIFEST.md").is_file()):
            findings.append((1, path, "declared module does not resolve"))
        elif data.get("owner") != "E" + str(int(module[1:3])):
            findings.append((1, path, "owner/module declaration disagree"))
        owned_ids = [str(data[k]) for k in IDENTITY_KEYS if data.get(k)]
        if len(owned_ids) != 1:
            findings.append((2, path, "missing or conflicting owned identities"))
        else:
            identity = owned_ids[0]
            if not re.fullmatch(r"[A-Za-z][A-Za-z0-9_-]*", identity):
                findings.append((2, path, "invalid immutable identity slug"))
            elif identity in seen:
                findings.append((2, path, "same/cross-type identity collision with " + str(seen[identity])))
            else:
                seen[identity] = path
            declaration = re.search(r"^Record:\s*`([^`]+)`", text, re.M)
            if declaration and declaration.group(1) != identity:
                findings.append((2, path, "body/frontmatter identity disagree"))
        for issue in verify_origin(root, data, text):
            findings.append((1, path, issue))
    return findings


if __name__ == "__main__":
    paths = repo_files()
    code = 0
    for issue in verify_origin_catalog(APP_ROOT):
        code = max(code, fail(issue))
    for level, path, issue in inspect_records(APP_ROOT, paths):
        report = reject if level == 2 else fail
        code = max(code, report(str(path.relative_to(APP_ROOT)) + ": " + issue))
    print(f"check-registration v1: {len(paths)} Markdown records; full metadata/identity/origin serialization checked")
    sys.exit(code)
