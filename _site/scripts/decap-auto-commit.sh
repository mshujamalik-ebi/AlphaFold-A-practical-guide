#!/bin/bash

set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

cd "$REPO_DIR"

echo "Decap auto-commit watcher started (PID: $$)"
echo "Watching for changes in $REPO_DIR"

is_publish_event() {
  local changed_paths
  changed_paths="$(git diff --cached --name-only)"

  # Commit/push only when staged changes indicate a publish workflow event.
  echo "$changed_paths" | grep -Eiq '(^|/)(publish|published|workflow|_draft)(/|$)'
}

while true; do
  if git status --short | grep -q .; then
    timestamp="$(date '+%Y-%m-%d %H:%M:%S')"
    current_branch="$(git rev-parse --abbrev-ref HEAD)"

    git add -A

    if git diff --cached --quiet; then
      sleep 3
      continue
    fi

    if ! is_publish_event; then
      echo "[$timestamp] Changes detected but no publish marker; skipping commit."
      sleep 3
      continue
    fi

    commit_message="Publish via Decap CMS: $timestamp"

    if git commit -m "$commit_message" --no-verify; then
      echo "[$timestamp] $commit_message on branch '$current_branch'"
      git push origin "$current_branch" 2>/dev/null || true
    fi
  fi

  sleep 3
done
