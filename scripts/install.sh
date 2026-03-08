#!/bin/bash
# FlexBV Offline Installer Script
# This script installs all required dependencies and sets up FlexBV

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_DIR="$(dirname "$SCRIPT_DIR")"
LIBS_DIR="$REPO_DIR/libs"
EXTRACT_DIR="$REPO_DIR/.runtime-libs"

echo "=========================================="
echo "  FlexBV R1020 - Offline Installer"
echo "=========================================="
echo ""

# Create runtime libraries directory
mkdir -p "$EXTRACT_DIR/usr/lib/x86_64-linux-gnu"
mkdir -p "$EXTRACT_DIR/usr/lib/x86_64-linux-gnu/pulseaudio"

echo "[1/4] Extracting SDL2 and dependencies..."

# Extract all deb packages
for deb in "$LIBS_DIR"/*.deb; do
    if [ -f "$deb" ]; then
        dpkg -x "$deb" "$EXTRACT_DIR" 2>/dev/null || true
    fi
done

echo "[2/4] Setting up library links..."

# Create necessary symlinks
cd "$EXTRACT_DIR/usr/lib/x86_64-linux-gnu"
ln -sf libSDL2-2.0.so.0.3000.0 libSDL2-2.0.so.0 2>/dev/null || true
cd pulseaudio
# Create proper symlink: libpulsecommon-16.1.so.0 -> libpulsecommon-16.1.so
ln -sf libpulsecommon-16.1.so libpulsecommon-16.1.so.0 2>/dev/null || true
cd ..

echo "[3/4] Creating launcher script..."

# Create the main launcher
cat > "$REPO_DIR/run-flexbv.sh" << 'LAUNCHER'
#!/bin/bash
# FlexBV Launcher - Auto-generated
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
RUNTIME_LIBS="$SCRIPT_DIR/.runtime-libs/usr/lib/x86_64-linux-gnu"

export LD_LIBRARY_PATH="$RUNTIME_LIBS:$RUNTIME_LIBS/pulseaudio:${LD_LIBRARY_PATH:-}"

cd "$SCRIPT_DIR/FlexBV-R1020-linux"
exec ./flexbv "$@"
LAUNCHER

chmod +x "$REPO_DIR/run-flexbv.sh"

echo "[4/4] Creating launcher for fbvpdf..."

# Create fbvpdf launcher
cat > "$REPO_DIR/run-fbvpdf.sh" << 'LAUNCHER'
#!/bin/bash
# FlexBV PDF Viewer Launcher
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
RUNTIME_LIBS="$SCRIPT_DIR/.runtime-libs/usr/lib/x86_64-linux-gnu"

export LD_LIBRARY_PATH="$RUNTIME_LIBS:$RUNTIME_LIBS/pulseaudio:${LD_LIBRARY_PATH:-}"

cd "$SCRIPT_DIR/FlexBV-R1020-linux"
exec ./fbvpdf "$@"
LAUNCHER

chmod +x "$REPO_DIR/run-fbvpdf.sh"

echo ""
echo "=========================================="
echo "  Installation Complete!"
echo "=========================================="
echo ""
echo "To run FlexBV:"
echo "  ./run-flexbv.sh [boardview_file]"
echo ""
echo "To run FlexBV PDF Viewer:"
echo "  ./run-fbvpdf.sh [schematic.pdf]"
echo ""
echo "Sample boardview files are in: $REPO_DIR/sample-boardviews/"
echo ""
