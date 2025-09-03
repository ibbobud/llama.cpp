#!/usr/bin/env bash
set -euo pipefail

# Export the standalone WebUI to a new folder and optionally initialize a Git repo.
# Usage: scripts/export-webui.sh ../llama-webui

SRC_DIR="tools/server/webui"
DEST_DIR="${1:-../llama-webui}"

echo "Exporting WebUI from ${SRC_DIR} to ${DEST_DIR}"

mkdir -p "${DEST_DIR}"

rsync -a --delete \
  --exclude node_modules \
  --exclude dist \
  --exclude .git \
  "${SRC_DIR}/" "${DEST_DIR}/"

echo "Copied. To initialize a repo:"
cat <<'EOT'
  cd DEST_DIR
  git init
  git add .
  git commit -m "init: llama.cpp webui (standalone)"
EOT

echo "Done."

