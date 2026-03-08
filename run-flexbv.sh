#!/bin/bash
# FlexBV Launcher - Auto-generated
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
RUNTIME_LIBS="$SCRIPT_DIR/.runtime-libs/usr/lib/x86_64-linux-gnu"

export LD_LIBRARY_PATH="$RUNTIME_LIBS:$RUNTIME_LIBS/pulseaudio:${LD_LIBRARY_PATH:-}"

cd "$SCRIPT_DIR/FlexBV-R1020-linux"
exec ./flexbv "$@"
