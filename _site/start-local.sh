#!/bin/bash

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

cd "$ROOT_DIR"

if [[ -f ".env" ]]; then
  # shellcheck disable=SC1091
  source .env
fi

if ! command -v docker >/dev/null 2>&1; then
  echo "docker is required but was not found in PATH."
  exit 1
fi

if ! docker compose version >/dev/null 2>&1; then
  echo "docker compose is required but was not found."
  exit 1
fi

if [[ -z "${GITHUB_TOKEN:-}" ]] && command -v gh >/dev/null 2>&1; then
  token_from_gh="$(gh auth token 2>/dev/null || true)"
  if [[ -n "$token_from_gh" ]]; then
    export GITHUB_TOKEN="$token_from_gh"
    echo "Loaded GITHUB_TOKEN from gh auth for container push access."
  fi
fi

echo "Starting Jekyll, Decap CMS proxy, and auto-commit services..."
docker compose up -d --build

echo
echo "Services are starting."
echo "Jekyll site: http://localhost:4001"
echo "Decap CMS:  http://localhost:4001/admin"
echo "Decap proxy: http://localhost:8081/api/v1"
if [[ -z "${GITHUB_TOKEN:-}" ]]; then
  echo "Note: GITHUB_TOKEN is not set. Auto-commit push may fail."
  echo "Create .env from .env.example and set GITHUB_TOKEN to enable container pushes."
fi