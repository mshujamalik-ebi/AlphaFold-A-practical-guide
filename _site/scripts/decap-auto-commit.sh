#!/bin/bash

set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

cd "$REPO_DIR"

echo "Decap auto-commit watcher started (PID: $$)"
echo "Watching for changes in $REPO_DIR"

configure_push_auth() {
  local fetch_url push_url
  fetch_url="$(git remote get-url origin 2>/dev/null || true)"

  if [[ "${USE_SSH_AUTH:-true}" == "true" ]] && [[ -f "/root/.ssh/id_ed25519" ]]; then
    chmod 700 /root/.ssh 2>/dev/null || true
    chmod 600 /root/.ssh/id_ed25519 2>/dev/null || true
    chmod 644 /root/.ssh/known_hosts 2>/dev/null || true

    git config core.sshCommand "ssh -i /root/.ssh/id_ed25519 -o IdentitiesOnly=yes -o StrictHostKeyChecking=yes"

    case "$fetch_url" in
      https://github.com/*)
        push_url="${fetch_url/https:\/\/github.com\//git@github.com:}"
        git remote set-url --push origin "$push_url"
        echo "Configured SSH push URL for origin."
        return
        ;;
      git@github.com:*)
        echo "Origin already configured for SSH pushes."
        return
        ;;
      *)
        echo "Origin is not a GitHub URL; skipping SSH push URL setup."
        ;;
    esac
  fi

  if [[ -z "${GITHUB_TOKEN:-}" ]]; then
    echo "No SSH key mounted and GITHUB_TOKEN is not set; push may fail in non-interactive auth."
    return
  fi

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
