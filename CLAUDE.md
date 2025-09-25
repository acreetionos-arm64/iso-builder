# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is the **AcreetionOS ARM64 Port Project** - a comprehensive effort to port the complete AcreetionOS Linux distribution from x86_64 to ARM64 architecture. The project is based on the original AcreetionOS distribution (a community-driven Linux distribution based on Arch Linux) and uses the archiso build system.

**Project Lead**: John Junkins (@macjunkins)
**Project Status**: Phase 1 - Foundation and Infrastructure
**Timeline**: 24-30 weeks (Q2 2026 target completion)
**Repository**: Based on original x86_64 AcreetionOS codebase

## Current Architecture (x86_64 Base)

The repository currently follows the standard archiso project structure for x86_64:

- **profiledef.sh**: Main configuration file (needs ARM64 conversion: arch="x86_64" → arch="aarch64")
- **packages.x86_64**: Package list (will become packages.aarch64)
- **airootfs/**: Root filesystem overlay (mostly architecture-independent)
- **syslinux/**: Boot loader configuration for BIOS systems (will be replaced with U-Boot for ARM64)
- **grub/**: Boot loader configuration for UEFI systems (needs ARM64 adaptation)
- **efiboot/**: EFI boot configuration (ARM64 UEFI differs from x86)

Key configuration files:
- **pacman.conf**: Pacman package manager configuration (needs AcreetionOS ARM64 repositories)
- **airootfs/etc/**: System configuration files overlay (mostly architecture-independent)
- **airootfs/root/**: Custom scripts and tools (need ARM64 validation)

## ARM64 Port Architecture (Target State)

### Changes Required for ARM64:
- **profiledef.sh**: Architecture change to "aarch64", boot modes adaptation
- **packages.aarch64**: New package list with ARM64-compatible packages
- **bootloader/**: Complete replacement of syslinux with U-Boot or ARM64 UEFI
- **Custom packages**: 25 -git packages need ARM64 compilation
- **Graphics drivers**: Replace x86 drivers with ARM GPU support

## Build Commands (Current x86_64)

**Note**: These are the current x86_64 build commands. ARM64 build process is under development in Phase 1.

### Full Build Process
```bash
./build.sh
```
This runs the complete build pipeline: `./refresh.sh -j && ./mkarchiso.sh`

### Individual Build Steps
```bash
# Clean previous builds
./refresh.sh

# Build ISO (outputs to ../ISO directory)
./mkarchiso.sh
```

### Manual Build Command
```bash
mkarchiso -L AcreetionOS -v -o ../ISO . -C ./pacman.conf export PACMAN_OPTS="--overwrite '*'" --j$nproc
```

### Clean Working Directory
```bash
sudo rm -rf ./work
```

## ARM64 Port Development Workflow

### Phase-Based Development
This project follows a structured 4-phase development approach:

1. **Phase 1 - Foundation** (Weeks 1-12): Environment setup, repository infrastructure, core ARM64 configuration
2. **Phase 2 - Hardware Support** (Weeks 13-20): Package porting, graphics, custom compilation, platform support
3. **Phase 3 - Integration** (Weeks 21-26): Installer adaptation, testing, customizations validation
4. **Phase 4 - Production** (Weeks 27-30): Infrastructure integration, final release

### Development Tasks by Priority
1. **Critical Path**: AcreetionOS ARM64 repository infrastructure coordination (external dependency)
2. **High Priority**: ARM64 environment setup, profiledef.sh conversion, bootloader implementation
3. **Medium Priority**: Package compatibility, graphics stack, custom package compilation
4. **Lower Priority**: Performance optimization, multi-platform support, documentation

### Current Development Focus (Phase 1)
- ARM64 cross-compilation environment setup
- AcreetionOS team coordination for ARM64 repositories
- profiledef.sh conversion for ARM64 architecture
- Initial packages.aarch64 creation with high-compatibility packages

## Important Notes

### Original AcreetionOS (x86_64) Notes:
- The project has transitioned fully to AcreetionOS repositories - do not add Arch repositories back as it will break the keyring system
- Uses squashfs compression with XZ for higher compression ratios
- Supports both BIOS and UEFI boot modes
- Build output goes to `../ISO` directory (one level up from project root)
- Working files are created in `./work` directory during build process

### ARM64 Port Specific Notes:
- **Architecture**: Currently x86_64, target is aarch64 (ARM64)
- **Bootloader**: syslinux will be replaced with U-Boot for ARM64 systems
- **Package Compatibility**: 75.9% of packages have direct ARM64 availability
- **Custom Packages**: 25 custom -git packages need ARM64 compilation
- **External Dependencies**: Requires AcreetionOS team coordination for ARM64 repositories
- **Target Platforms**: Raspberry Pi 4/5, Pine64, and other ARM64 boards

## Project Status & Tracking

### Current Status: Phase 1 - Foundation and Infrastructure
- **Repository Analysis**: ✅ Complete (comprehensive technical analysis in `analysis/` directory)
- **GitLab Issues**: ✅ 24 issues created across 4 development phases
- **ARM64 Environment**: 🔄 In progress (Issue #1)
- **Repository Infrastructure**: 🔄 Critical path item (Issue #3)

### Issue Tracking
- **GitLab Issues**: [24 comprehensive issues](https://gitlab.acreetionos.org/acreetionos_on_arm/acreetionos-junkins-fork/-/issues)
- **Phase 1**: Issues #1-#8 (Foundation and Infrastructure)
- **Phase 2**: Issues #9-#16 (Hardware Support and Drivers)
- **Phase 3**: Issues #17-#22 (System Integration and Testing)
- **Phase 4**: Issues #23-#24 (Production Readiness)

### Technical Documentation
- **[Repository Analysis](analysis/repository-analysis.md)**: Complete architectural breakdown and ARM64 considerations
- **[ARM64 Compatibility Matrix](analysis/arm64-package-compatibility.md)**: Package-by-package analysis for ARM64 porting
- **[AcreetionOS Customizations](analysis/acreetion-customizations.md)**: Custom features and ARM64 compatibility assessment
- **[ARM64 Port Roadmap](analysis/arm64-port-roadmap.md)**: Detailed development plan, timeline, and risk assessment

## Development Commands for ARM64 Port

### Lint and Type Checking
- No specific linting configured yet for this project
- Standard shell script validation can be used: `shellcheck *.sh`

### Testing
- ARM64 testing will require ARM64 hardware (Raspberry Pi 4/5, Pine64 boards)
- Current testing is on x86_64 systems only
- Phase 3 will include comprehensive multi-platform testing

### Git Workflow
- Use feature branches for each issue: `git checkout -b feature/issue-N-description`
- Target branch for PRs: `main` (following standard Git workflow)
- Commit messages should reference GitLab issues: `fixes #N` or `addresses #N`

## Quick Reference for ARM64 Development

### Key Files for ARM64 Conversion:
1. **profiledef.sh**: Change `arch="x86_64"` to `arch="aarch64"`
2. **packages.x86_64** → **packages.aarch64**: Port package list
3. **syslinux/** → **bootloader/**: Replace with ARM64 boot solution
4. **airootfs/etc/pacman.conf**: Update for ARM64 repositories

### Critical Success Factors:
1. **AcreetionOS ARM64 repositories**: External dependency on AcreetionOS team
2. **Bootloader implementation**: Technical challenge requiring ARM64 expertise
3. **Custom package compilation**: 25 packages need ARM64 builds
4. **Multi-platform testing**: Requires ARM64 hardware for validation

### Current Priority Actions:
1. Complete Issue #3: Request AcreetionOS ARM64 repository infrastructure
2. Start Issue #1: Set up ARM64 cross-compilation environment
3. Begin Issue #5: Convert profiledef.sh for ARM64 architecture
4. Coordinate with AcreetionOS maintainers for repository support