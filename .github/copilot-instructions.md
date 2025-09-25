# GitHub Copilot Instructions - iso-builder

This file provides GitHub Copilot with domain-specific context for the iso-builder submodule of the AcreetionOS ARM64 project.

## Repository Domain

**Specialization**: Linux Distribution Build System
**Primary Function**: ARM64 ISO image generation using archiso
**Technical Domain**: System packaging, bootloader configuration, ARM64 cross-compilation

## Code Style and Conventions

### Language-Specific Guidelines
- **Bash Scripts**: Follow POSIX-compliant shell scripting practices
- **Configuration Files**: Use consistent indentation and clear variable naming
- **Package Lists**: One package per line, alphabetically sorted within categories
- **Comments**: Explain ARM64-specific changes and rationale for modifications

### Coding Standards
- All shell scripts must be executable and include proper shebangs
- Use defensive programming practices (set -euo pipefail where appropriate)
- Document any deviations from standard archiso patterns for ARM64 compatibility
- Include comprehensive error handling for cross-compilation scenarios

### File Organization
- **profiledef.sh**: Main configuration, architecture-specific settings at top
- **packages.aarch64**: Organized by category (base, desktop, hardware, custom)
- **airootfs/**: Mirror target system structure, minimize architecture-specific files
- **bootloader/**: Separate ARM64-specific bootloader configurations

### Naming Conventions
- Configuration files: lowercase with hyphens (e.g., `boot-config.txt`)
- Script files: descriptive names with .sh extension
- Package lists: architecture suffix (e.g., `packages.aarch64`)
- Directory names: lowercase, descriptive (e.g., `raspberry-pi-configs`)

## Framework Preferences

### Preferred Approaches
- **archiso framework**: Standard archiso patterns adapted for ARM64
- **Modular configuration**: Separate files for different hardware platforms
- **Package management**: Prefer official packages over custom compilation where possible
- **Boot systems**: U-Boot for ARM64 SBCs, UEFI for ARM64 servers

### Architecture Patterns
- **Configuration inheritance**: Base configuration with platform-specific overlays
- **Conditional compilation**: Environment variables for cross-compilation detection
- **Hardware abstraction**: Device tree overlays for different ARM64 platforms
- **Package filtering**: Runtime detection of available ARM64 packages

### Design Principles
- **Platform compatibility**: Support multiple ARM64 hardware platforms
- **Upstream alignment**: Stay close to standard archiso patterns
- **Cross-compilation safety**: Validate all package dependencies for ARM64
- **Maintainability**: Clear separation between x86_64 and ARM64 code paths

### Technology Stack
- **archiso**: Core ISO building framework
- **pacman**: Package management for ARM64 packages
- **U-Boot**: Primary bootloader for ARM64 single-board computers
- **systemd**: Init system and service management
- **squashfs**: Root filesystem compression

## Testing Approaches

### Unit Testing Strategy
- Shell script validation using `shellcheck`
- Package list validation against ARM64 repositories
- Configuration file syntax checking
- Build process automation testing

### Integration Testing
- Full ISO build testing on x86_64 host with ARM64 target
- QEMU ARM64 emulation testing for boot validation
- Hardware testing on Raspberry Pi 4/5 and Pine64 platforms
- Cross-platform compatibility testing

### Test Structure
```bash
# Test structure pattern
validate_config() {
    # Configuration validation
}

test_package_availability() {
    # Package availability checking
}

verify_build_output() {
    # Build artifact validation
}
```

### Mocking and Fixtures
- Mock ARM64 hardware environments for testing
- Use QEMU for bootloader and kernel testing
- Create minimal test package lists for quick validation
- Hardware device tree fixtures for different platforms

## Documentation Style

### Code Comments
```bash
# ARM64-specific: Replace syslinux with U-Boot configuration
# This change is required because syslinux doesn't support ARM64 architecture
bootloader_type="u-boot"
```

### Documentation Patterns
- Always document ARM64-specific changes and reasoning
- Include upstream compatibility notes for future archiso updates
- Document hardware-specific requirements and limitations
- Provide examples for different ARM64 platforms

### README Conventions
- Clear distinction between x86_64 legacy and ARM64 current state
- Step-by-step build instructions with prerequisites
- Hardware compatibility matrix for different ARM64 devices
- Troubleshooting section for common ARM64 build issues

### API Documentation
- Document all custom functions and their ARM64-specific parameters
- Include examples of configuration variables and their effects
- Document integration points with other submodules
- Provide migration guides from x86_64 to ARM64 configurations

## Security Considerations

### Security Best Practices
- Validate all package signatures and checksums for ARM64 packages
- Use secure boot configurations where supported (ARM64 UEFI)
- Implement proper key management for custom package repositories
- Follow principle of least privilege for build processes

### Vulnerability Prevention
- Regular security updates for base system packages
- Minimize attack surface by excluding unnecessary packages
- Implement secure defaults for network and system services
- Use read-only root filesystem where possible

### Secure Coding Patterns
```bash
# Validate input parameters
validate_arch() {
    case "$1" in
        "aarch64"|"arm64") return 0 ;;
        *) echo "Error: Invalid architecture $1" >&2; return 1 ;;
    esac
}
```

### Secrets Management
- Never include private keys or credentials in configuration files
- Use environment variables for sensitive build parameters
- Implement proper GPG key management for package signing
- Secure storage of cross-compilation certificates and keys

## Performance Guidelines

### Optimization Priorities
1. **Build time optimization**: Parallel compilation, ccache usage
2. **ISO size optimization**: Package selection, compression settings
3. **Boot time optimization**: Minimal initramfs, fast bootloader
4. **Runtime performance**: Optimized package selection for ARM64

### Performance Patterns
- Use parallel processing for package downloads and compilation
- Implement incremental builds to avoid full rebuilds
- Optimize squashfs compression settings for size vs. speed trade-offs
- Use ARM64-optimized compiler flags where appropriate

### Resource Management
- Monitor disk space during build process
- Implement cleanup routines for temporary build artifacts
- Use memory-mapped files for large data processing
- Optimize network bandwidth usage for package downloads

### Profiling Approaches
- Time all major build steps for performance analysis
- Monitor memory usage during ISO creation
- Profile boot time on target ARM64 hardware
- Analyze package dependency resolution performance

## ARM64-Specific Considerations

### ARM64 Compatibility
- All packages must be available for aarch64 architecture
- Cross-compilation toolchain setup and validation
- ARM64-specific compiler optimizations and flags
- Hardware-specific kernel modules and device tree files

### Cross-Platform Concerns
- Build system runs on x86_64, targets ARM64
- Emulation layers for testing (QEMU, binfmt)
- Native ARM64 package building vs. cross-compilation
- Endianness considerations (ARM64 is little-endian)

### Architecture-Specific Optimizations
```bash
# ARM64-specific compiler optimizations
export CFLAGS="-march=armv8-a -mtune=cortex-a72 -O2"
export CXXFLAGS="${CFLAGS}"
```

### Hardware Considerations
- Raspberry Pi 4/5 specific configurations (GPU, audio, networking)
- Pine64 and other SBC platform support
- Different ARM64 CPU implementations (Cortex-A72, Cortex-A78, etc.)
- GPIO and hardware interface support requirements

## Upstream Compatibility

### Compatibility Requirements
- Maintain compatibility with standard archiso framework
- Follow AcreetionOS package naming and versioning conventions
- Ensure compatibility with upstream AcreetionOS repositories
- Support standard Linux FHS (Filesystem Hierarchy Standard)

### Integration Standards
- Use standard systemd service definitions
- Follow XDG desktop entry specifications
- Implement proper MIME type handling
- Support standard Linux kernel interfaces

### Contribution Guidelines
- Document all ARM64-specific modifications for upstream consideration
- Maintain separate branches for experimental ARM64 features
- Test compatibility with multiple archiso versions
- Provide clear migration paths for configuration updates

### Version Management
- Track archiso version compatibility
- Document ARM64-specific version requirements
- Maintain compatibility matrices for different component versions
- Implement version detection and validation in build scripts

## Project-Specific Context

### AcreetionOS Integration
- Use AcreetionOS ARM64 repositories when available
- Maintain AcreetionOS branding and customizations
- Support AcreetionOS-specific package configurations
- Integration with Calamares installer for ARM64

### Multi-Repository Coordination
- **Dependencies**: arm64-toolchain for cross-compilation environment
- **Integration**: custom-packages for AcreetionOS-specific components
- **Boot systems**: boot-systems submodule for U-Boot configurations
- **Hardware support**: hardware-support submodule for device-specific configs

### Submodule Dependencies
- arm64-toolchain: Cross-compilation tools and environment
- custom-packages: AcreetionOS branding and custom applications
- hardware-support: Device trees and hardware-specific configurations
- boot-systems: Bootloader configurations and firmware

### Build System Integration
- Coordinate with package-builder for custom ARM64 package compilation
- Integrate with testing-infrastructure for automated validation
- Use releases submodule for ISO artifact management
- Sync with upstream-sync for GitLab CE coordination

## Common Patterns and Anti-Patterns

### Recommended Patterns
```bash
# Good: Architecture detection and appropriate handling
detect_build_arch() {
    case "$(uname -m)" in
        "x86_64") BUILD_ARCH="x86_64" ;;
        "aarch64"|"arm64") BUILD_ARCH="aarch64" ;;
        *) echo "Unsupported build architecture"; exit 1 ;;
    esac
}
```

### Anti-Patterns to Avoid
```bash
# Bad: Hardcoded architecture assumptions
packages_file="packages.x86_64"  # Don't assume architecture

# Bad: No validation of cross-compilation environment
gcc -march=armv8-a  # Should validate toolchain first

# Bad: Architecture-specific paths without detection
/usr/lib/x86_64-linux-gnu/  # Use dynamic path detection
```

### Best Practices
- Always validate ARM64 toolchain availability before building
- Use conditional logic for architecture-specific configurations
- Implement proper error handling for cross-compilation failures
- Document all hardware-specific requirements and limitations

### Code Review Focus
- ARM64 package availability and compatibility
- Cross-compilation correctness and error handling
- Hardware-specific configuration accuracy
- Performance implications of ARM64-specific changes

## Error Handling and Logging

### Error Handling Strategy
```bash
# Comprehensive error handling for cross-compilation
setup_cross_toolchain() {
    if ! command -v aarch64-linux-gnu-gcc >/dev/null 2>&1; then
        echo "Error: ARM64 cross-compilation toolchain not found" >&2
        echo "Please install: gcc-aarch64-linux-gnu" >&2
        return 1
    fi
}
```

### Logging Conventions
- Use structured logging with severity levels
- Log all ARM64-specific configuration decisions
- Include timestamps and build context in logs
- Separate logs for different build phases

### Debug Information
- Provide verbose mode for detailed build information
- Include environment and toolchain information in debug output
- Log package resolution and dependency information
- Track build timing and performance metrics

### Monitoring Approaches
- Monitor build success rates across different platforms
- Track ISO size and compression metrics
- Monitor boot time performance on target hardware
- Implement health checks for cross-compilation environment

## Development Workflow

### Branch Management
- feature/arm64-* for ARM64-specific features
- fix/build-* for build system fixes
- hardware/platform-* for platform-specific support
- upstream/sync-* for archiso compatibility updates

### Commit Conventions
```
feat(arm64): add Raspberry Pi 4 boot configuration
fix(build): resolve cross-compilation toolchain detection
docs(readme): update ARM64 hardware compatibility matrix
perf(iso): optimize squashfs compression for ARM64
```

### PR Guidelines
- Always test on both x86_64 build host and ARM64 target
- Include before/after ISO size comparisons for significant changes
- Document any new hardware platform support added
- Verify backward compatibility with existing ARM64 configurations

### Review Process
- Technical review for ARM64 compatibility and correctness
- Performance review for build time and ISO size impact
- Hardware testing review for multi-platform compatibility
- Documentation review for completeness and accuracy

---

*These instructions help GitHub Copilot provide contextually appropriate suggestions for iso-builder development within the AcreetionOS ARM64 project ecosystem.*