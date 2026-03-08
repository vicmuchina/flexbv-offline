# FlexBV R1020 - Complete Offline Package

[![FlexBV Version](https://img.shields.io/badge/FlexBV-R1020-blue)](https://pldaniels.com/flexbv5/)
[![Platform](https://img.shields.io/badge/platform-Linux%20x86__64-lightgrey)]()
[![Offline Ready](https://img.shields.io/badge/offline-ready-green)]()

**FlexBV** is a professional boardview software for viewing and analyzing circuit board layouts. This package includes the **patched FlexBV R1020** with all required dependencies for **completely offline installation**.

## Features

✅ **Fully Offline** - No internet required after download  
✅ **All Dependencies Included** - SDL2, PulseAudio, and all libraries bundled  
✅ **Patched & Activated** - Free edition with license bypass applied  
✅ **Multi-Format Support** - `.brd`, `.tvw`, `.cad`, `.asc`, `.fz`, `.fbv`, and more  
✅ **PDF Integration** - Includes fbvpdf for schematic viewing  

## Quick Start

### Installation

```bash
# Clone the repository
git clone https://github.com/vicmuchina1234/flexbv-offline.git
cd flexbv-offline

# Run the installer
chmod +x scripts/install.sh
./scripts/install.sh
```

### Running FlexBV

```bash
# Launch FlexBV boardviewer
./run-flexbv.sh

# Or open a specific boardview file
./run-flexbv.sh /path/to/boardview.brd

# Launch PDF schematic viewer
./run-fbvpdf.sh /path/to/schematic.pdf
```

## File Structure

```
flexbv-offline/
├── FlexBV-R1020-linux/      # FlexBV application
│   ├── flexbv              # Main executable (patched)
│   ├── fbvpdf              # PDF viewer
│   └── *.fbvtheme          # UI themes
├── libs/                    # All offline dependencies
│   ├── libsdl2-2.0-0*.deb
│   ├── libpulse0*.deb
│   └── ... (16 packages total)
├── sample-boardviews/       # Sample boardview files
├── scripts/
│   └── install.sh          # One-command installer
├── run-flexbv.sh           # Quick launcher
├── run-fbvpdf.sh           # PDF viewer launcher
└── README.md
```

## Supported Boardview Formats

| Format | Extension | Software |
|--------|-----------|----------|
| FlexBV | `.fbv` | FlexBV (native) |
| Allegro | `.brd` | FlexBV, OpenBoardView |
| Teboview | `.tvw` | FlexBV, TeboView |
| CAD | `.cad` | FlexBV |
| ASC | `.asc` | FlexBV, Protel |
| CST | `.cst` | FlexBV |
| FZ | `.fz` | FlexBV, PCB Repair Tool |

## Keyboard Shortcuts

| Key | Action |
|-----|--------|
| `Ctrl+O` | Open file |
| `Ctrl+F` | Find component |
| `F` | Flip board view |
| `+/-` | Zoom in/out |
| `Arrow Keys` | Pan view |
| `Space` | Toggle part highlight |

## Finding Boardview Files

Boardview files can be obtained from:

1. **OpenBoardData.org** - Free community database
2. **BadCaps Forum** - Community sharing
3. **Manufacturer Service Portals** - Official repair docs
4. **Repair Forums** - Dr-Bios, IndiaFix, etc.

> ⚠️ **Note**: Many boardview files are password-protected or require premium forum access. Always respect copyright and licensing terms.

## Troubleshooting

### "Error opening file: Resource temporarily unavailable"

This usually means:
- The file is encrypted/password-protected
- The file format is not supported
- The file is corrupted

**Solution**: Try a different boardview file or check if the file needs a specific viewer version.

### "libSDL2-2.0.so.0: not found"

Run the installer script to extract dependencies:
```bash
./scripts/install.sh
```

### Display issues on high-DPI screens

Set environment variable before running:
```bash
export GDK_SCALE=2
export GDK_DPI_SCALE=2
./run-flexbv.sh
```

## License & Legal Notice

This package is distributed for **educational and repair purposes only**.

- FlexBV Free Edition is provided by [pldaniels.com](https://pldaniels.com/flexbv5/free.php)
- Boardview files and schematics are property of their respective manufacturers
- Use only for legitimate repair and educational purposes
- Do not distribute copyrighted boardview files

## Credits

- **FlexBV** - Paul Daniels (@pldaniels)
- **Patch** - CipherHater Project
- **Dependencies** - Ubuntu 24.04 repositories

## Support

For issues with FlexBV itself, visit: https://pldaniels.com/flexbv5/support.html

For this offline package, open an issue on GitHub.

---

**Built for offline electronics repair workshops and educational institutions.**
