# Changelog

All notable changes to this project will be documented in this file.

## [1.0.0] - 2026-03-08

### Added
- Complete FlexBV R1020 offline package
- All 16 required dependencies bundled
- One-command installer script
- Sample Lenovo E31-70 boardview file
- Comprehensive documentation (README, SETUP guide)
- Auto-generating launcher scripts
- Patched FlexBV binary (license bypass applied)
- fbvpdf PDF viewer included

### Changed
- Organized repository structure for easy deployment
- Created offline-first installation workflow

### Fixed
- SDL2 library dependency resolution
- PulseAudio runtime linking
- All X11 library dependencies bundled

### Technical Details
- Base: FlexBV R1020 Linux x86_64
- Dependencies: Ubuntu 24.04 (Noble) packages
- Patch source: CipherHater Project
- Tested on: Ubuntu/Linux Mint XFCE

### Known Issues
- Some boardview files may be encrypted/password-protected
- High-DPI display scaling may need manual configuration
- Requires X11 (Wayland compatibility not tested)
