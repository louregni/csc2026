#!/usr/bin/env bash
set -euo pipefail

echo "[post-create] Installing python deps (if any)..."
python3 -m pip install --break-system-packages -r requirements.txt || true

echo "[post-create] Done."
