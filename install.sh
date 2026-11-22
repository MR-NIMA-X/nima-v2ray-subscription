#!/usr/bin/env bash
set -euo pipefail
REPO="${REPO:-https://github.com/mr-nima-x/nima-v2ray-subscription.git}"
BRANCH="${BRANCH:-main}"
TARGET="${TARGET:-/etc/3x-ui/sub_templates/2-server}"
TMP="$(mktemp -d)"
cleanup(){ rm -rf "$TMP"; }
trap cleanup EXIT
if [[ $EUID -ne 0 ]]; then echo "Run as root: sudo bash install.sh"; exit 1; fi
command -v git >/dev/null 2>&1 || { apt-get update && apt-get install -y git; }
git clone --depth 1 --branch "$BRANCH" "$REPO" "$TMP/repo"
[[ -s "$TMP/repo/index.html" ]] || { echo "index.html missing; aborting."; exit 1; }
mkdir -p "$TARGET"
if [[ -f "$TARGET/index.html" ]]; then cp "$TARGET/index.html" "$TARGET/index.html.bak.$(date +%Y%m%d-%H%M%S)"; fi
install -m 0644 "$TMP/repo/index.html" "$TARGET/index.html"
echo
echo "Installed successfully: $TARGET"
echo "Now open 3x-ui → Settings → Subscription → Information"
echo "Set Sub Theme Directory to: $TARGET"
echo "Save settings. No 3x-ui restart should be needed."
