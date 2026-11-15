#!/usr/bin/env bash
set -euo pipefail
TARGET="${TARGET:-/etc/3x-ui/sub_templates/2-server}"
if [[ $EUID -ne 0 ]]; then echo "Run as root: sudo bash uninstall.sh"; exit 1; fi
if [[ ! -d "$TARGET" ]]; then echo "Template directory not found: $TARGET"; exit 0; fi
read -r -p "Remove custom template at $TARGET? [y/N] " answer
[[ "$answer" == "y" || "$answer" == "Y" ]] || { echo "Cancelled."; exit 0; }
rm -rf -- "$TARGET"
echo "Removed. Clear Sub Theme Directory in 3x-ui settings to restore the built-in page."
