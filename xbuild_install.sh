#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SCRIPT_NAME="pych-xbuild.sh"
TARGET="/usr/local/bin/pych-xbuild"

chmod +x "$SCRIPT_DIR/$SCRIPT_NAME"

sudo ln -sf "$SCRIPT_DIR/$SCRIPT_NAME" "$TARGET"

echo "pych-xbuild installed successfully at $TARGET"

