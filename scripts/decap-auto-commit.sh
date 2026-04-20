#!/bin/bash

set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

cd "$REPO_DIR"

echo "Decap auto-commit watcher started (PID: $$)"
echo "Watching for changes in $REPO_DIR"

while true; do
  if git status --short | grep -q .; then
    timestamp="$(date '+%Y-%m-%d %H:%M:%S')"
    current_branch="$(git rev-parse --abbrev-ref HEAD)"

    git add -A

    if git diff --cached --quiet; then
      sleep 3
      continue
    fi

    commit_message="Auto-commit via Decap CMS: $timestamp"
    git commit -m "$commit_message" --no-verify || true

    if git rev-parse --verify HEAD >/dev/null 2>&1; then
      git push origin "$current_branch" 2>/dev/null || true
    fi
  fi

  sleep 3
done#!/bin/bash

# Auto-commit hook for Decap CMS local backend
# Watches for file changes and commits them automatically
# Usage: ./scripts/decap-auto-commit.sh

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$REPO_DIR/../"

echo "Decap auto-commit watcher started (PID: $$)"
echo "Watching for changes in $REPO_DIR"

          if git commit -m "$commit_message" --no-verify; then
            echo "[$timestamp] $commit_message on branch '$current_branch'"
            git push origin "$current_branch" 2>/dev/null || true
          fi
  # Check if there are uncommitted changes
  if git status --short | grep -q .; then
    TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')
    CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
    
    # Check if this is a publish event (look for drafts or workflow markers)
    IS_PUBLISH="false"
    if git status --short | grep -qE '(draft|workflow|_draft)'  2>/dev/null; then
      IS_PUBLISH="true"
    fi

    # Stage all changes
    git add -A

    if git diff --cached --quiet; then
      sleep 3
      continue
    fi

    # Determine commit message
    if [[ "$IS_PUBLISH" == "true" ]]; then
      COMMIT_MSG="Publish via Decap CMS: $TIMESTAMP"
    else
      COMMIT_MSG="Auto-commit via Decap CMS: $TIMESTAMP"
    fi

    # Commit with timestamp
    git commit -m "$COMMIT_MSG" --no-verify

    if [ $? -eq 0 ]; then
      echo "[$TIMESTAMP] $COMMIT_MSG on branch '$CURRENT_BRANCH'"

      git push origin "$CURRENT_BRANCH" 2>/dev/null

      if [ $? -eq 0 ]; then
        echo "[$TIMESTAMP] Pushed to origin/$CURRENT_BRANCH"
      else
        echo "[$TIMESTAMP] ⚠️  Push failed (check network/auth)"
      fi
    fi
  fi
  
  # Check every 3 seconds
  sleep 3
done
