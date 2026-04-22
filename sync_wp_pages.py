#!/usr/bin/env python3
"""
Export WordPress pages into a nested folder structure using sibling-position numbering.

Features:
- Fetches pages from WP REST API (handles pagination)
- Builds parent->children map
- Sorts siblings by (menu_order, title)
- Assigns sequential index to each sibling (1..N) and zero-pads (min width 2)
- Creates directories for pages that have children; parent content goes to index.md
- Child pages (leaf pages) are saved as prefixed files: 01.slug.md
- Converts HTML -> Markdown using markdownify
- Local-only: writes to OUTPUT_DIR
"""

import requests
import shutil
from pathlib import Path
import markdownify
import os

WP_API_URL = "https://www.ebi.ac.uk/training/online/courses/alphafold/wp-json/wp/v2/pages"
BASE_DIR = os.path.dirname(os.path.abspath(__file__))
OUTPUT_DIR = BASE_DIR  # Write directly to repo root


def fetch_pages():
    pages = []
    page_num = 1
    while True:
        print(f"Fetching page {page_num}...")
        resp = requests.get(WP_API_URL, params={"per_page": 100, "page": page_num})
        if resp.status_code != 200:
            print(f"Stopped fetching (status {resp.status_code}).")
            break
        data = resp.json()
        if not data:
            break
        pages.extend(data)
        page_num += 1
    return pages


def build_by_parent(pages):
    by_parent = {}
    for p in pages:
        parent_id = p.get("parent", 0)
        by_parent.setdefault(parent_id, []).append(p)
    return by_parent


def sanitize_filename(name):
    # keep alnum, space, -, _
    cleaned = "".join(c for c in name if c.isalnum() or c in (" ", "-", "_")).strip()
    return cleaned.replace(" ", "-")


def build_index_maps(by_parent):
    """
    For each parent group, sort children and assign sequential indices.
    Returns:
      index_map: { page_id: index_int }
      padding_map: { page_id: width_int }  (width used for zero-padding)
    """
    index_map = {}
    padding_map = {}

    for parent_id, children in by_parent.items():
        # sort children by (menu_order, title)
        sorted_children = sorted(
            children,
            key=lambda x: (x.get("menu_order", 0), x.get("title", {}).get("rendered", "").lower())
        )
        n = len(sorted_children)
        width = max(2, len(str(n)))  # min width 2 (e.g., 01.)
        for pos, child in enumerate(sorted_children, start=1):
            pid = child["id"]
            index_map[pid] = pos
            padding_map[pid] = width

    return index_map, padding_map


def prefix_for(page_id, index_map, padding_map):
    """Return prefix like '01.' or '' if not in map."""
    if page_id in index_map:
        width = padding_map.get(page_id, 2)
        return f"{index_map[page_id]:0{width}d}."
    return ""


def write_page(page, by_parent, index_map, padding_map, base_dir):
    """
    Recursively write page and its children under base_dir.
    If page has children -> create directory named <prefix><slug>/ and write parent content to index.md
    If no children -> write <prefix><slug>.md under base_dir
    """
    pid = page["id"]
    slug = page.get("slug", f"page-{pid}")
    title = page.get("title", {}).get("rendered", "").strip()
    html_content = page.get("content", {}).get("rendered", "")
    md_content = markdownify.markdownify(html_content, heading_style="ATX")

    children = sorted(
        by_parent.get(pid, []),
        key=lambda x: (x.get("menu_order", 0), x.get("title", {}).get("rendered", "").lower())
    )

    prefix = prefix_for(pid, index_map, padding_map)
    safe_slug = sanitize_filename(slug)

    if children:
        # create directory with prefix, write parent content to index.md
        page_dir = base_dir / f"{prefix}{safe_slug}"
        page_dir.mkdir(parents=True, exist_ok=True)
        filepath = page_dir / "index.md"
    else:
        # leaf page: write prefixed markdown file in base_dir
        page_dir = base_dir
        page_dir.mkdir(parents=True, exist_ok=True)
        filepath = page_dir / f"{prefix}{safe_slug}.md"

    # Write the markdown file (parent content or leaf content)
    with open(filepath, "w", encoding="utf-8") as f:
        f.write(f"# {title}\n\n{md_content}")

    print(f"✅ Created: {filepath}")

    # Process children recursively
    for child in children:
        write_page(child, by_parent, index_map, padding_map, page_dir)


def main():
    pages = fetch_pages()
    if not pages:
        print("No pages fetched. Exiting.")
        return

    by_parent = build_by_parent(pages)
    index_map, padding_map = build_index_maps(by_parent)

    # Top-level pages are those with parent == 0
    top_pages = sorted(
        by_parent.get(0, []),
        key=lambda x: (x.get("menu_order", 0), x.get("title", {}).get("rendered", "").lower())
    )

    base_dir = Path(OUTPUT_DIR)
    if base_dir.exists():
        # shutil.rmtree(base_dir)
        print(f"Output directory '{base_dir}' already exists. Contents may be overwritten.")
    base_dir.mkdir(parents=True, exist_ok=True)

    for page in top_pages:
        write_page(page, by_parent, index_map, padding_map, base_dir)

    print("\n🎉 Export complete. Check the 'exported_pages/' folder.")


if __name__ == "__main__":
    main()