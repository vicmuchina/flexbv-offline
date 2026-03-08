# FlexBV R1020 - Complete Offline Package

[![FlexBV Version](https://img.shields.io/badge/FlexBV-R1020-blue)](https://pldaniels.com/flexbv5/)
[![Platform](https://img.shields.io/badge/platform-Linux%20x86__64-lightgrey)]()
[![Offline Ready](https://img.shields.io/badge/offline-ready-green)]()
[![Patched](https://img.shields.io/badge/patched-via%20CipherHater-green)]()

**FlexBV** is a professional boardview software for viewing and analyzing circuit board layouts. This package includes the **patched FlexBV R1020** (Linux x86_64) with all required dependencies for **completely offline installation**.

> **Version**: R1020 | **Platform**: Linux x86_64 | **License**: No key required (patched)

## Features

✅ **Fully Offline** - No internet required after download  
✅ **All Dependencies Included** - SDL2, PulseAudio, and all libraries bundled  
✅ **Patched & Activated** - Free edition with license bypass applied  
✅ **Multi-Format Support** - `.brd`, `.tvw`, `.cad`, `.asc`, `.fz`, `.fbv`, and more  
✅ **PDF Integration** - Includes fbvpdf for schematic viewing  
✅ **Firewall Script** - Blocks activation servers for offline use

## Quick Start

```bash
# Clone the repository
git clone https://github.com/vicmuchina1234/flexbv-offline.git
cd flexbv-offline

# Run the installer (extracts dependencies)
chmod +x scripts/install.sh
./scripts/install.sh

# Optional: Block activation servers (requires sudo)
sudo ./scripts/setup-firewall.sh

# Launch FlexBV boardviewer
./run-flexbv.sh

# Or open a specific boardview file
./run-flexbv.sh sample-boardviews/HP_EliteBook_820_G2.cad
```

## What's Included

| Component | Description |
|-----------|-------------|
| FlexBV R1020 | Patched binary (no license required) |
| fbvpdf | PDF schematic viewer |
| 16 Dependencies | SDL2, PulseAudio, audio codecs |
| Firewall Script | Blocks 27.50.89.128 (activation server) |
| Patch Script | Original flexbv_free.sh from CipherHater |
| Sample Files | HP EliteBook 820 G2, Lenovo E31-70 |

## File Structure

```
flexbv-offline/
├── FlexBV-R1020-linux/      # FlexBV application (patched)
│   ├── flexbv              # Main executable
│   ├── fbvpdf              # PDF viewer
│   └── *.fbvtheme          # UI themes
├── libs/                    # 16 dependency packages
├── sample-boardviews/       # Test files (BRD, CAD)
├── scripts/
│   ├── install.sh          # One-command installer
│   ├── setup-firewall.sh   # Block activation servers
│   └── flexbv_patch.sh     # Original patch script
├── run-flexbv.sh           # Quick launcher
├── run-fbvpdf.sh           # PDF viewer launcher
└── README.md
```

## Firewall Setup (Important!)

After installation, block the FlexBV activation server:

```bash
# Run as root/sudo
sudo ./scripts/setup-firewall.sh
```

This blocks: `27.50.89.128`

Or manually:
```bash
sudo iptables -A OUTPUT -d 27.50.89.128/32 -j REJECT
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

## Sample Files Included

This repository includes sample boardview files for testing:

- **Lenovo E31-70** - LA-C311P motherboard (`.brd` Allegro format)
- **HP EliteBook 820 G2** - Snickers 6050A2635701 (`.cad` format)

To test FlexBV with these files:
```bash
./run-flexbv.sh sample-boardviews/Lenovo_E31-70_LA-C311P_Actual.brd
./run-flexbv.sh sample-boardviews/HP_EliteBook_820_G2.cad
```

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

After patching, FlexBV shows:
```
EMail: free@gmail.com
ID/TXN_ID: 0000000000000000000000000000000
Key: 0000000000000000000000000000000
```

- FlexBV Free Edition is provided by [pldaniels.com](https://pldaniels.com/flexbv5/free.php)
- Boardview files and schematics are property of their respective manufacturers
- Use only for legitimate repair and educational purposes
- Do not distribute copyrighted boardview files

## Credits

- **FlexBV** - Paul Daniels ([pldaniels.com](https://pldaniels.com/flexbv5/))
- **License Patch** - CipherHater Project ([GitHub](https://github.com/SasoriXX/CipherHater/blob/master/flexbv.md))
- **Dependencies** - Ubuntu 24.04 repositories

## Acknowledgments

This package uses the FlexBV activation bypass from the **CipherHater Project**. 
Original patch instructions and methodology documented at:
https://github.com/SasoriXX/CipherHater/blob/master/flexbv.md

Special thanks to the electronics repair community for maintaining boardview file collections.

## Support

For issues with FlexBV itself, visit: https://pldaniels.com/flexbv5/support.html

For this offline package, open an issue on GitHub.

---

**Built for offline electronics repair workshops and educational institutions.**

> *"We do not pay for programs that you do not know how to protect..."* - CipherHater
