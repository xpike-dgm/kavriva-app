"""Versioned custody guards for metadata migration; never product authorization."""
import hashlib
import re
from pathlib import Path
from _lib import meta_yaml, parse_simple

ORIGIN_ROOT = "vault/EVIDENCE/SNAPSHOTS/metadata-v1"
ORIGIN_COMMIT = "28b3734027d72b8f592b60290c8bf5f8fc0dfe2b"
ORIGIN_COUNT = 126
# SHA256(sorted original_path TAB SHA256(raw Git blob) LF), independently reviewable.
ORIGIN_CATALOG_DIGEST = "ba29017ed274f67ffd1314fc42551d6967a04bebdb5ddf979121aac61550283f"
LEGACY_PACK = "vault/PACKS/P-PROOF-001.md"
ARCHIVED_PACK = ORIGIN_ROOT + "/" + LEGACY_PACK + ".snapshot"
FROZEN_PACK_DIGEST = "080f50acc1036f7651000f272d4fdf305eb777aae1ecded981d702fa9a6eddb8"


def normalized_digest(raw):
    return hashlib.sha256(raw.replace(b"\r\n", b"\n")).hexdigest()


def verify_origin_catalog(root):
    folder = Path(root) / ORIGIN_ROOT
    rows = []
    for p in folder.rglob("*.snapshot"):
        try:
            p.resolve().relative_to(folder.resolve())
        except ValueError:
            return ["origin payload escapes archive root"]
        rows.append((p.relative_to(folder).as_posix()[:-len(".snapshot")],
                     hashlib.sha256(p.read_bytes()).hexdigest()))
    claim = "".join(path + "\t" + digest + "\n" for path, digest in sorted(rows))
    if len(rows) != ORIGIN_COUNT or hashlib.sha256(claim.encode()).hexdigest() != ORIGIN_CATALOG_DIGEST:
        return ["origin catalog differs from pinned 126 baseline Git blobs"]
    return []


def verify_origin(root, data, current_text=None):
    path = data.get("metadata_origin_file")
    if not path:
        return []
    if not isinstance(path, str) or not path.startswith(ORIGIN_ROOT + "/") or not path.endswith(".md.snapshot"):
        return ["invalid origin payload address"]
    target = (Path(root) / path).resolve()
    try:
        target.relative_to((Path(root) / ORIGIN_ROOT).resolve())
        raw = target.read_bytes()
    except (ValueError, OSError):
        return ["origin payload missing or escapes custody root"]
    if data.get("metadata_origin_commit") != ORIGIN_COMMIT:
        return ["origin commit is not the pinned baseline"]
    if normalized_digest(raw) != str(data.get("metadata_origin_digest", "")).lower():
        return ["origin payload digest mismatch"]
    original_text = raw.decode("utf-8").replace("\r\n", "\n")
    original = parse_simple(meta_yaml(original_text))
    for key, value in original.items():
        current = data.get(key)
        if key == "subject_file" and isinstance(value, str) and value.endswith(".md"):
            if current != ORIGIN_ROOT + "/" + value + ".snapshot" or data.get("subject_original_path") != value:
                return ["historical Markdown subject is not its exact preserved payload"]
        elif key == "last_verified" and current != value:
            if not (isinstance(current, str) and str(value).startswith(current + " ")
                    and data.get("metadata_previous_last_verified") == value):
                return ["historical verification date changed"]
        elif current != value:
            return ["historical metadata changed: " + key]
    if current_text is not None:
        def body(text):
            return re.sub(r"\A---\n.*?\n---\s*\n", "", text, count=1, flags=re.S)
        if not body(current_text).startswith(body(original_text)):
            return ["original document body changed instead of metadata-only extension"]
    return []


def verify_frozen_pack(root, data):
    """Keep old call sites compatible; allow exactly the original or its pinned payload."""
    path = data.get("pack_file", LEGACY_PACK)
    if path not in (LEGACY_PACK, ARCHIVED_PACK):
        return ["frozen pack address is not an approved original/preserved payload"]
    digest = str(data.get("pack_digest", ""))[:64].lower()
    if digest != FROZEN_PACK_DIGEST:
        return ["original frozen pack digest claim changed"]
    target = (Path(root) / path).resolve()
    try:
        target.relative_to(Path(root).resolve())
        raw = target.read_bytes()
    except (ValueError, OSError):
        return ["frozen proof pack missing or escapes repository"]
    if normalized_digest(raw) != FROZEN_PACK_DIGEST:
        return ["frozen proof pack payload changed"]
    return []
