#!/bin/bash

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

cd "$ROOT_DIR"

if ! command -v docker >/dev/null 2>&1; then
  echo "docker is required but was not found in PATH."
  exit 1
fi

if ! docker compose version >/dev/null 2>&1; then
  echo "docker compose is required but was not found."
  exit 1
fi

echo "Starting Jekyll, Decap CMS proxy, and auto-commit services..."
docker compose up -d --build

echo
echo "Services are starting."
echo "Jekyll site: http://localhost:4001"
echo "Decap CMS:  http://localhost:4001/admin"
echo "Decap proxy: http://localhost:8081/api/v1"