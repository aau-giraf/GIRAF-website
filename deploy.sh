#!/bin/bash

# Deploy script for the GIRAF website.
#
# Builds the Jekyll site locally, then rsyncs the build over SSH to the Hetzner box.
# The site is served straight from the deploy dir by `giraf-web.service`
# (python3 -m http.server on :8088, fronted by a cloudflared tunnel), so there is
# nothing to restart — synced files are live immediately.
#
# Auth is SSH key only (no password, no .env). Override the target with env vars:
#   DEPLOY_HOST=root@77.42.34.208  DEPLOY_PATH=/var/www/giraf  ./deploy.sh
#
# Usage: ./deploy.sh

set -euo pipefail

DEPLOY_HOST="${DEPLOY_HOST:-root@77.42.34.208}"
DEPLOY_PATH="${DEPLOY_PATH:-/var/www/giraf}"

# --- build -------------------------------------------------------------------
echo "📦 Building Jekyll site (production)..."
JEKYLL_ENV=production bundle exec jekyll build

if [ ! -f "_site/index.html" ]; then
    echo "❌ Build produced no _site/index.html — aborting before deploy."
    exit 1
fi

# --- deploy ------------------------------------------------------------------
# --delete makes the remote dir mirror _site/ exactly. It ONLY ever touches files
# inside DEPLOY_PATH on the server — nothing else on the box is affected.
echo "🌐 Syncing _site/ → ${DEPLOY_HOST}:${DEPLOY_PATH}/ ..."
rsync -az --delete --exclude='.git*' _site/ "${DEPLOY_HOST}:${DEPLOY_PATH}/"

echo "✅ Done. Live at https://giraf.nbhansen.dk (no restart needed)."
