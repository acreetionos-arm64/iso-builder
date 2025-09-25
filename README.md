# AcreetionOS ISO Builder - ARM64 Port

**Repository**: [`acreetionos-arm64/iso-builder`](https://github.com/acreetionos-arm64/iso-builder)
**Purpose**: Main archiso build system for AcreetionOS ARM64 port
**Organization**: [`acreetionos-arm64`](https://github.com/acreetionos-arm64)

This repository contains the complete archiso build system for creating AcreetionOS ISOs, currently supporting x86_64 with ARM64 conversion underway.

**AcreetionOS Upstream**: [gitlab.acreetionos.org](https://gitlab.acreetionos.org) | **Original x86_64 ISO**: [www.acreetionos.org](https://www.acreetionos.org)

## Project Mission

This project aims to port the complete AcreetionOS Linux distribution from x86_64 to ARM64 architecture, making it available for modern ARM-based devices including Raspberry Pi, Pine64 boards, and other ARM64 hardware platforms.

## Project Status: **In Active Development**

**Current Phase**: Milestone 0 - Repository Infrastructure Setup
**Timeline**: 18-36 months sustainable side project approach
**Multi-Repository Architecture**: Part of [`acreetionos-arm64`](https://github.com/acreetionos-arm64) organization

## ARM64 Port Features

### Target Features (Upon Completion)
- **Full ARM64 Support**: Native ARM64 architecture compatibility
- **Multi-Platform Support**: Raspberry Pi 4/5, Pine64, and other ARM64 devices
- **Complete Desktop Environment**: Cinnamon desktop optimized for ARM64
- **Hardware Acceleration**: ARM GPU support with Mesa drivers
- **Native Installation**: Calamares installer adapted for ARM64 systems
- **AcreetionOS Identity**: All custom branding, themes, and configurations preserved

## Development Phases

### Phase 1: Foundation and Infrastructure (Weeks 1-12)
- [x] **Repository Analysis Complete** - Comprehensive analysis of x86_64 codebase
- [ ] ARM64 cross-compilation environment setup
- [ ] AcreetionOS ARM64 repository infrastructure coordination
- [ ] Basic ARM64 system configuration and bootloader implementation
- **Status**: 8 issues created, analysis complete

### Phase 2: Hardware Support and Drivers (Weeks 13-20)
- [ ] ARM64 package compatibility and graphics stack implementation
- [ ] Raspberry Pi 4/5 and multi-platform support
- [ ] Custom package compilation for ARM64
- **Status**: 8 issues planned

### Phase 3: System Integration and Testing (Weeks 21-26)
- [ ] Calamares installer ARM64 adaptation
- [ ] AcreetionOS customizations validation
- [ ] Comprehensive multi-platform testing
- **Status**: 6 issues planned

### Phase 4: Production Readiness (Weeks 27-30)
- [ ] Official infrastructure integration
- [ ] Final testing and documentation
- [ ] Production release preparation
- **Status**: 2 issues planned

## Technical Analysis

This project includes comprehensive technical documentation:
- **[Repository Analysis](analysis/repository-analysis.md)** - Complete architectural breakdown
- **[ARM64 Compatibility Matrix](analysis/arm64-package-compatibility.md)** - Package-by-package analysis
- **[AcreetionOS Customizations](analysis/acreetion-customizations.md)** - Custom features documentation
- **[ARM64 Port Roadmap](analysis/arm64-port-roadmap.md)** - Detailed development plan and risk assessment

## Quick Facts

- **Package Compatibility**: 75.9% of packages have direct ARM64 availability
- **Architecture Changes**: Bootloader system requires complete rework for ARM64
- **Custom Packages**: 25 custom packages need ARM64 compilation
- **Target Platforms**: Raspberry Pi 4/5, Pine64, and other ARM64 boards
- **External Dependencies**: AcreetionOS team coordination for ARM64 repository infrastructure

## Getting Involved

### For Developers
1. **Review the [technical analysis](analysis/)** to understand the project scope
2. **Check [GitLab issues](https://gitlab.acreetionos.org/acreetionos_on_arm/acreetionos-junkins-fork/-/issues)** for specific tasks
3. **Start with Phase 1 foundation work** - environment setup and configuration
4. **Join the discussion** about ARM64 repository infrastructure needs

### For Testers
- **ARM64 Hardware Needed**: Raspberry Pi 4/5, Pine64 boards, other ARM64 devices
- **Testing Focus**: Multi-platform compatibility and performance validation
- **Future Phases**: Testing coordination will begin in Phase 3

### For AcreetionOS Team
- **Critical Dependency**: ARM64 repository infrastructure coordination
- **Custom Package Sources**: Access to calamares-config and other custom package sources
- **Timeline Coordination**: Aligning ARM64 infrastructure with development phases

## Contributing

This ARM64 port project welcomes contributions from:
- **ARM64 Architecture Specialists**: Bootloader and hardware expertise
- **Package Maintainers**: Help with custom package ARM64 compilation
- **Hardware Testers**: ARM64 device testing and validation
- **Documentation Contributors**: User guides and technical documentation

**Getting Started**: Check the [GitLab issues](https://gitlab.acreetionos.org/acreetionos_on_arm/acreetionos-junkins-fork/-/issues) for tasks matching your expertise.

## Multi-Repository Structure

This repository is part of the [`acreetionos-arm64`](https://github.com/acreetionos-arm64) organization:

- **[workspace](https://github.com/acreetionos-arm64/workspace)** - Main coordination hub
- **[iso-builder](https://github.com/acreetionos-arm64/iso-builder)** - This repository (build system)
- **[custom-packages](https://github.com/acreetionos-arm64/custom-packages)** - AcreetionOS components
- **[arm64-toolchain](https://github.com/acreetionos-arm64/arm64-toolchain)** - Cross-compilation tools
- **[hardware-support](https://github.com/acreetionos-arm64/hardware-support)** - Device-specific configs
- **[boot-systems](https://github.com/acreetionos-arm64/boot-systems)** - ARM64 bootloaders
- **[documentation](https://github.com/acreetionos-arm64/documentation)** - Technical architecture
- **[testing-infrastructure](https://github.com/acreetionos-arm64/testing-infrastructure)** - QEMU, validation
- **[upstream-sync](https://github.com/acreetionos-arm64/upstream-sync)** - GitLab CE coordination
- **[releases](https://github.com/acreetionos-arm64/releases)** - ISO artifacts

## Project Information

- **Project Lead**: John Junkins ([@macjunkins](https://github.com/macjunkins)) - ARM64 Port Development
- **Organization**: [`acreetionos-arm64`](https://github.com/acreetionos-arm64) on GitHub
- **Original AcreetionOS Team**: @Natalie/@LinuxGrandpa
- **Project Status**: Milestone 0 - Repository Infrastructure Setup
- **License**: MIT (organization repos) + GPL-3.0 (inherited)
- **Upstream Coordination**: GitLab CE at [gitlab.acreetionos.org](https://gitlab.acreetionos.org)

## Project Timeline

| Phase | Duration | Status | Key Deliverables |
|-------|----------|--------|------------------|
| **Phase 1** | Weeks 1-12 | 🔄 **In Progress** | Foundation, repositories, basic ARM64 system |
| **Phase 2** | Weeks 13-20 | 📋 Planned | Hardware support, graphics, custom packages |
| **Phase 3** | Weeks 21-26 | 📋 Planned | Integration, installer, comprehensive testing |
| **Phase 4** | Weeks 27-30 | 📋 Planned | Production infrastructure, final release |

## Contact & Support

- **ARM64 Port Issues**: [GitLab Issues](https://gitlab.acreetionos.org/acreetionos_on_arm/acreetionos-junkins-fork/-/issues)
- **Technical Questions**: Create an issue with the `question` label
- **Original AcreetionOS**: [www.acreetionos.org](https://www.acreetionos.org)
- **Main Project Support**: [AcreetionOS Community](https://acreetionos.org)

## Acknowledgments

This ARM64 port project is built upon the excellent foundation created by the AcreetionOS team. Special thanks to:
- **@Natalie** and **@LinuxGrandpa** for creating and maintaining AcreetionOS
- **AcreetionOS Community** for the solid distribution architecture
- **Arch Linux Community** for the underlying system and archiso tools

---

## About AcreetionOS

AcreetionOS Linux is a community-driven effort to build a lightweight, versatile Linux distribution. Originally based on Arch Linux, the goal is to become a parallel* distribution with its own base, providing a solid foundation for both everyday users and developers with a focus on simplicity, ease of use, and stability.

**_*Parallel Distribution: A distribution similar to, but having a different goal and future goal set._**
