# CLAUDE.md - iso-builder Repository

This file provides guidance to Claude Code when working with the **iso-builder** submodule in the AcreetionOS ARM64 workspace.

## Repository Overview

**Repository**: `iso-builder/` (Repository #1 in WBS)
**Purpose**: Main archiso build system for ARM64 conversion work
**Parent Workspace**: `acreetionos-arm64/workspace`
**WBS Prefix**: M[milestone].1.[task]

**Current Focus**: ARM64 conversion of core build system
- profiledef.sh conversion (arch="x86_64" → arch="aarch64")
- Package list conversion (packages.x86_64 → packages.aarch64)
- Boot system adaptation for ARM64 hardware

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

## WBS Issues for iso-builder Repository

### Milestone 1 (M1) - Foundation & Infrastructure
**M1.1.1** - Validate x86_64 build baseline (6-8h) `priority:critical`
**M1.1.2** - Analyze archiso build system internals (8-10h) `priority:critical`
**M1.1.3** - Convert profiledef.sh to ARM64 architecture (3-4h) `priority:critical`
**M1.1.4** - Create initial packages.aarch64 package list (3-5h) `priority:critical`
**M1.1.5** - Attempt first ARM64 build and document failures (2-3h) `priority:important`

### Milestone 2 (M2) - Core ARM64 Implementation
**M2.1.1** - Convert core system packages to ARM64 (15-20h) `priority:critical`
**M2.1.2** - Remove x86 drivers and add ARM64 hardware support (12-15h) `priority:critical`
**M2.1.3** - Implement package validation and fallback system (8-10h) `priority:important`
**M2.1.4** - Configure ARM64 system settings and integration (8-10h) `priority:important`

### Development Workflow
**Issue Creation**: All issues MUST follow WBS format: `M[milestone].1.[task] - [Description]`
**Dependencies**: Strict sequential completion following issue dependencies
**Labels Required**: `iso-builder`, `priority:critical/important`, `complexity:low/medium/high`

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

## Current Status & Next Actions

### Ready to Begin: M1.1.1 (Critical Path Starter)
**M1.1.1 - Validate x86_64 build baseline**: Zero dependencies, ready to execute
- Confirm existing build scripts work in GitHub environment
- Document dependencies and system requirements
- Create reproducible build environment (Docker/VM)

### Issue Tracking
- **GitHub Issues**: All iso-builder issues in [workspace project board](https://github.com/orgs/acreetionos-arm64/projects/2)
- **M1 Issues**: 5 issues (M1.1.1 through M1.1.5)
- **M2 Issues**: 4 issues (M2.1.1 through M2.1.4)
- **Total**: 9 iso-builder specific issues in WBS system

### Dependencies & Sequencing
- M1.1.1 → M1.1.2 → M1.1.3 → M1.1.4 → M1.1.5 (M1 sequence)
- M1 completion → M2.1.1 → M2.1.2 → M2.1.3 → M2.1.4 (M2 sequence)
- Parallel research: M1.3.x (documentation) tasks can run concurrently

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

### Current Priority Actions (WBS Order):
1. **M1.1.1**: Validate x86_64 build baseline (ready to execute)
2. **M1.1.2**: Analyze archiso build system internals (depends on M1.1.1)
3. **M1.1.3**: Convert profiledef.sh for ARM64 architecture (depends on M1.1.2)
4. **M1.1.4**: Create initial packages.aarch64 package list (depends on M1.1.3)

### WBS Compliance Reminder
- All new issues MUST use WBS numbering: `M[milestone].1.[task] - [Description]`
- Repository number for iso-builder is **1** in the WBS system
- Follow strict dependency sequencing - no parallel work within critical path
- Update issue status in project board as work progresses