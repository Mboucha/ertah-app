#!/usr/bin/env python3
"""Export icons, logos and screen references from Figma "Ertah app 27" into the repo.

Usage:
    export FIGMA_TOKEN=figd_xxx          # Figma > Settings > Security > Personal access tokens (file read scope)
    python3 tool/figma_export.py icons   # SVG icons + car logos -> packages/ertah_design_system/assets/
    python3 tool/figma_export.py screens    # PNG @2x of every Arabic (RTL) screen  -> design-system/screens/
    python3 tool/figma_export.py screens-en # PNG @2x of every English (LTR) screen -> design-system/screens-en/
    python3 tool/figma_export.py flows      # PNG of each FigJam service-flow section -> design-system/flows/
    python3 tool/figma_export.py all

Node IDs come from design-system/figma-manifest.json. Standard library only.
"""
import json, os, re, sys, time, urllib.request, urllib.parse

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
MANIFEST = json.load(open(os.path.join(ROOT, "design-system", "figma-manifest.json"), encoding="utf-8"))
KEY = MANIFEST["fileKey"]
TOKEN = os.environ.get("FIGMA_TOKEN") or sys.exit("Set FIGMA_TOKEN first (see docstring).")
API = "https://api.figma.com/v1"


def api(path, **params):
    url = f"{API}{path}?{urllib.parse.urlencode(params)}"
    for attempt in range(5):
        req = urllib.request.Request(url, headers={"X-Figma-Token": TOKEN})
        try:
            with urllib.request.urlopen(req) as r:
                return json.load(r)
        except urllib.error.HTTPError as e:
            if e.code == 429:
                time.sleep(2 ** attempt * 5)
                continue
            raise
    sys.exit("Figma API rate limit: try again later.")


def children(node_id, depth=1, key=KEY):
    doc = api(f"/files/{key}/nodes", ids=node_id, depth=depth)["nodes"][node_id]["document"]
    return doc.get("children", [])


def slug(name):
    s = re.sub(r"[^\w\-]+", "-", name.strip().lower(), flags=re.UNICODE).strip("-")
    return s or "unnamed"


def export(nodes, fmt, out_dir, scale=1, key=KEY):
    """nodes: list of (id, filename-stem). Batches render requests."""
    os.makedirs(out_dir, exist_ok=True)
    seen = {}
    for i in range(0, len(nodes), 50):
        batch = nodes[i:i + 50]
        urls = api(f"/images/{key}", ids=",".join(n for n, _ in batch), format=fmt, scale=scale)["images"]
        for nid, stem in batch:
            url = urls.get(nid)
            if not url:
                print(f"  skip {stem} ({nid}): nothing rendered")
                continue
            seen[stem] = seen.get(stem, 0) + 1
            name = stem if seen[stem] == 1 else f"{stem}-{seen[stem]}"
            path = os.path.join(out_dir, f"{name}.{fmt}")
            urllib.request.urlretrieve(url, path)
            print(f"  {os.path.relpath(path, ROOT)}")


def icon_nodes(frame_id):
    """Collect components / instances inside an icon showcase frame (walks nested groups)."""
    found = []
    def walk(n):
        if n["type"] in ("COMPONENT", "INSTANCE"):
            found.append((n["id"], slug(n["name"])))
        elif n["type"] in ("FRAME", "GROUP", "SECTION", "COMPONENT_SET"):
            for c in n.get("children", []):
                walk(c)
    for c in children(frame_id, depth=4):
        walk(c)
    return found


def do_icons():
    base = os.path.join(ROOT, "packages", "ertah_design_system", "assets")
    for group, fid in MANIFEST["iconFrames"].items():
        print(f"icons/{group}")
        export(icon_nodes(fid), "svg", os.path.join(base, "icons", group))
    for group, fid in MANIFEST["logoFrames"].items():
        print(f"logos/{group}")
        export(icon_nodes(fid), "svg", os.path.join(base, "logos", group))


def do_screens(manifest_key="screenSections", folder="screens"):
    base = os.path.join(ROOT, "design-system", folder)
    for flow, sid in MANIFEST[manifest_key].items():
        frames = [(c["id"], slug(c["name"])) for c in children(sid) if c["type"] == "FRAME"]
        print(f"{folder}/{slug(flow)} ({len(frames)})")
        export(frames, "png", os.path.join(base, slug(flow)), scale=2)


def do_flows():
    """One PNG per section of each FigJam board listed under figjamBoards."""
    base = os.path.join(ROOT, "design-system", "flows")
    for board, info in MANIFEST.get("figjamBoards", {}).items():
        nodes = [(nid, slug(name)) for name, nid in info["sections"].items()]
        print(f"flows/{board} ({len(nodes)})")
        export(nodes, "png", os.path.join(base, board), scale=1, key=info["fileKey"])


if __name__ == "__main__":
    what = sys.argv[1] if len(sys.argv) > 1 else "all"
    if what in ("icons", "all"):
        do_icons()
    if what in ("screens", "all"):
        do_screens()
    if what in ("screens-en", "all"):
        do_screens("englishScreenSections", "screens-en")
    if what in ("flows", "all"):
        do_flows()
    if what not in ("icons", "screens", "screens-en", "flows", "all"):
        sys.exit(f"Unknown command {what!r}: use icons, screens, screens-en, flows or all.")
