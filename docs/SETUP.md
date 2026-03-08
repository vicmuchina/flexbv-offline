# FlexBV Setup Guide

## Complete Installation Instructions

### Prerequisites

- Linux x86_64 system (Ubuntu 20.04+ recommended)
- X11 display server
- ~2GB free disk space

### Step 1: Clone Repository

```bash
git clone https://github.com/vicmuchina1234/flexbv-offline.git
cd flexbv-offline
```

### Step 2: Run Installer

```bash
chmod +x scripts/install.sh
./scripts/install.sh
```

The installer will:
1. Extract all 16 dependency packages
2. Set up library symlinks
3. Create launcher scripts
4. Configure runtime environment

### Step 3: Verify Installation

```bash
# Check if launcher works
./run-flexbv.sh --help

# Should show FlexBV without errors
```

### Step 4: Load Boardview File

1. Launch FlexBV: `./run-flexbv.sh`
2. Press `Ctrl+O` to open file dialog
3. Navigate to `sample-boardviews/` folder
4. Select a `.brd` or `.tvw` file

## Manual Dependency Installation (Online Mode)

If you have internet access, you can install dependencies via apt:

```bash
sudo apt update
sudo apt install -y libsdl2-2.0-0 libpulse0 libsamplerate0 \
    libdecor-0-0 libsndfile1 libflac12t64 libvorbis0a \
    libvorbisenc2 libopus0 libogg0 libmpg123-0t64 \
    libmp3lame0 libasyncns0
```

Then run FlexBV directly:
```bash
cd FlexBV-R1020-linux
./flexbv
```

## Using FlexBV

### Basic Navigation

| Action | Mouse | Keyboard |
|--------|-------|----------|
| Pan | Right-click + drag | Arrow keys |
| Zoom | Scroll wheel | +/- |
| Flip board | - | F |
| Select part | Left-click | Enter |
| Search | - | Ctrl+F |

### Viewing Nets

1. Click on a component pin
2. The net will highlight in red
3. All connected pins show in the side panel
4. Use "PDF Favourites" to link to schematic

### PDF Integration

FlexBV can link boardview to PDF schematics:

1. Load boardview file
2. Load PDF with `./run-fbvpdf.sh schematic.pdf`
3. Use net names to cross-reference

## Common Issues

### File Won't Open

**Error**: "Resource temporarily unavailable"

**Causes**:
- File is encrypted (common with downloaded boardviews)
- Wrong format variant
- File corrupted

**Solutions**:
1. Try a different file source
2. Check if file needs password
3. Verify file isn't corrupted

### Missing Libraries

**Error**: "libSDL2-2.0.so.0: cannot open shared object file"

**Solution**: Run the installer script again:
```bash
./scripts/install.sh
```

### Display Issues

**Problem**: Window too small/large

**Solution**:
```bash
# For high-DPI displays
export GDK_SCALE=2
./run-flexbv.sh
```

## Sample Boardview Files

The `sample-boardviews/` directory includes:

- **Lenovo E31-70** - LA-C311P motherboard (Broadwell era)
- **Lenovo G50-30** - ACLU9 NM-A311 (sample TVW)

These are for testing and learning FlexBV interface.

## Advanced Usage

### Command Line Options

```bash
# Open file directly
./run-flexbv.sh /path/to/file.brd

# Run with custom theme
./run-flexbv.sh --theme Default-Dark

# Verbose mode
./run-flexbv.sh --verbose
```

### Custom Themes

FlexBV includes 4 themes:
- `Default-Dark.fbvtheme`
- `Default-Light.fbvtheme`
- `Olive.fbvtheme`
- `RobBrown.fbvtheme`

Copy theme to FlexBV directory and select in preferences.

### Keyboard Bindings

Edit `imgui.ini` in FlexBV directory to customize:

```ini
[KeyBindings]
Flip=F
ZoomIn=+
ZoomOut=-
Search=Ctrl+F
```

## Resources

- **Official FlexBV**: https://pldaniels.com/flexbv5/
- **OpenBoardData**: https://openboarddata.org/
- **BadCaps Forum**: https://www.badcaps.net/
- **Boardview Formats**: See docs/formats.md

## Legal

This software is for educational and repair purposes only. Always respect intellectual property rights of hardware manufacturers.
