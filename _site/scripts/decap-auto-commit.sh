#!/bin/bash

set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

cd "$REPO_DIR"

echo "Decap auto-commit watcher started (PID: $$)"
echo "Watching for changes in $REPO_DIR"

is_publish_event() {
  # In proxy backend mode, Decap typically writes directly to content files.
  # Treat staged markdown content changes (excluding admin/scripts/_site) as publish events.
  while IFS= read -r path; do
    case "$path" in
      _site/*|admin/*|scripts/*|.github/*|docker-compose.yml|start-local.sh|Gemfile|Gemfile.lock|.DS_Store)
        continue
        ;;
      *.md)
        return 0
        ;;
      *)
        continue
        ;;
    esac
  done < <(git diff --cached --name-only)

  return 1
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
      if git push origin "$current_branch"; then
        echo "[$timestamp] Pushed to origin/$current_branch"
      else
        echo "[$timestamp] Push failed for origin/$current_branch"
      fi
    fi
  fi

  sleep 3
done
