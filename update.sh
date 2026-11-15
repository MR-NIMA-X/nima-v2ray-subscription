#!/usr/bin/env bash
set -euo pipefail
REPO="${REPO:-https://github.com/USERNAME/nima-v2ray-subscription.git}"
BRANCH="${BRANCH:-main}"
TARGET="${TARGET:-/etc/3x-ui/sub_templates/2-server}"
TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT
if [[ $EUID -ne 0 ]]; then echo "Run as root: sudo bash update.sh"; exit 1; fi
git clone --depth 1 --branch "$BRANCH" "$REPO" "$TMP/repo"
[[ -s "$TMP/repo/index.html" ]] || { echo "index.html missing; aborting."; exit 1; }
mkdir -p "$TARGET"
[[ ! -f "$TARGET/index.html" ]] || cp "$TARGET/index.html" "$TARGET/index.html.bak.$(date +%Y%m%d-%H%M%S)"
install -m 0644 "$TMP/repo/index.html" "$TARGET/index.html"
echo "Updated: $TARGET/index.html"
