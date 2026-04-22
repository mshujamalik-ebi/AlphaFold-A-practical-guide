#!/bin/bash

set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

cd "$REPO_DIR"

echo "Decap auto-commit watcher started (PID: $$)"
echo "Watching for changes in $REPO_DIR"

configure_push_auth() {
  if [[ -z "${GITHUB_TOKEN:-}" ]]; then
    echo "GITHUB_TOKEN is not set; push may fail in non-interactive container auth."
    return
  fi

  local fetch_url push_url
  fetch_url="$(git remote get-url origin 2>/dev/null || true)"

  case "$fetch_url" in
    https://github.com/*)
      push_url="${fetch_url/https:\/\/github.com\//https:\/\/x-access-token:${GITHUB_TOKEN}@github.com\/}"
      git remote set-url --push origin "$push_url"
      echo "Configured token-based push URL for origin."
      ;;
    *)
      echo "Origin is not https://github.com/*; skipping token push URL setup."
      ;;
  esac
}

is_protected_branch() {
  local branch="$1"
  local protected
  local protected_branches="${PROTECTED_BRANCHES:-main master}"

  for protected in $protected_branches; do
    if [[ "$branch" == "$protected" ]]; then
      return 0
    fi
  done

  return 1
}

switch_to_writable_branch_if_needed() {
  if ! is_protected_branch "$current_branch"; then
    return
  fi

  local new_branch
  new_branch="decap-cms/${current_branch}/$(date '+%Y%m%d-%H%M%S')"

  git checkout -b "$new_branch"
  echo "[$timestamp] '$current_branch' is protected. Switched to '$new_branch' for commit."
  current_branch="$new_branch"
}

configure_push_auth

while true; do
  if git status --short | grep -q .; then
    timestamp="$(date '+%Y-%m-%d %H:%M:%S')"
    current_branch="$(git rev-parse --abbrev-ref HEAD)"

    switch_to_writable_branch_if_needed

    git add -A

    # Never include local secrets/private material in auto commits.
    git reset -q -- .env .env.* 2>/dev/null || true
    git reset -q -- '*.pem' '*.key' '*.p12' '*.pfx' 2>/dev/null || true

    if git diff --cached --quiet; then
      sleep 3
      continue
    fi

    commit_message="Auto-commit via Decap CMS: $timestamp"

    if git commit -m "$commit_message" --no-verify; then
      echo "[$timestamp] $commit_message on branch '$current_branch'"
      if git push origin "$current_branch"; then
        echo "[$timestamp] Pushed to origin/$current_branch"
      else
        echo "[$timestamp] Push failed for origin/$current_branch (set GITHUB_TOKEN for container auth)"
      fi
    fi
  fi

  sleep 3
done
