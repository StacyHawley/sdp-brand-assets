#!/usr/bin/env bash
# sync.sh — pull canonical brand assets into a consuming app's public/ folder.
#
# Usage (run from the consuming app's repo root):
#   curl -sSL https://raw.githubusercontent.com/StacyHawley/sdp-brand-assets/main/sync.sh | bash
#
# Or, if sdp-brand-assets is cloned locally at ~/sdp-brand-assets:
#   bash ~/sdp-brand-assets/sync.sh
#
# Copies logo.svg and all favicons into ./public/, and writes tokens to ./app/lib/brand.ts.

set -euo pipefail

REPO_RAW="https://raw.githubusercontent.com/StacyHawley/sdp-brand-assets/main"
LOCAL_DIR="${SDP_BRAND_ASSETS_DIR:-$HOME/sdp-brand-assets}"

mkdir -p public app/lib

if [ -d "$LOCAL_DIR" ]; then
  echo "Syncing from local $LOCAL_DIR"
  cp "$LOCAL_DIR/logo.svg" public/logo.svg
  if [ -d "$LOCAL_DIR/favicons" ] && [ "$(ls -A "$LOCAL_DIR/favicons" 2>/dev/null)" ]; then
    cp "$LOCAL_DIR/favicons/"* public/
    # Next.js App Router (13+) uses app/favicon.ico via file-based convention,
    # which OVERRIDES public/favicon.ico AND the metadata.icons config.
    # create-next-app scaffolds a default Next.js triangle icon there.
    # We must also copy the SDP favicon.ico to app/ to override that default.
    if [ -f "$LOCAL_DIR/favicons/favicon.ico" ] && [ -d "app" ]; then
      cp "$LOCAL_DIR/favicons/favicon.ico" app/favicon.ico
      echo "  Also copied favicon.ico -> app/favicon.ico (overrides Next.js default)"
    fi
  fi
  cp "$LOCAL_DIR/tokens.ts" app/lib/brand.ts
else
  echo "Syncing from $REPO_RAW (set SDP_BRAND_ASSETS_DIR to use a local clone)"
  curl -sSL "$REPO_RAW/logo.svg" -o public/logo.svg
  curl -sSL "$REPO_RAW/tokens.ts" -o app/lib/brand.ts
  echo "Note: favicons are not auto-fetched over HTTP. Clone the repo locally to copy favicon binaries."
fi

echo "Brand assets synced. Logo at public/logo.svg, tokens at app/lib/brand.ts."
