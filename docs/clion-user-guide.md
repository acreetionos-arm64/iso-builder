# CLion User Guide for AcreetionOS ARM64 Port Project

This guide covers using CLion effectively for the AcreetionOS ARM64 port project, focusing on systems development, cross-compilation, and shell scripting workflows.

## Getting Started

### 1. Opening the Project

1. **Open CLion**
2. **File → Open** → Navigate to `/Users/johnjunkins/acreetionOS_Arm_Project/acreetionos-junkins-fork`
3. CLion will detect this as a **general project** (not CMake-based)
4. Click **"Open as Project"**

**Documentation**: [Opening Projects in CLion](https://www.jetbrains.com/help/clion/opening-and-reopening-projects.html)

### 2. Project Structure Understanding

CLion will automatically index your project files:
- **Shell scripts**: `build.sh`, `mkarchiso.sh`, `refresh.sh`
- **Configuration files**: `profiledef.sh`, `pacman.conf`, `packages.x86_64`
- **System overlays**: `airootfs/` directory structure
- **Documentation**: `analysis/` directory with your technical docs
- **Boot configurations**: `syslinux/`, `grub/`, `efiboot/`

## Core Development Workflows

### 3. Shell Script Development

#### **Editing and Syntax Highlighting**
- CLion provides **native shell script support** with syntax highlighting
- **Right-click** any `.sh` file → **"Run"** to execute directly
- **Ctrl+Shift+F10** (macOS: **Cmd+Shift+R**) to run current script

#### **Script Debugging**
- **Run/Debug Configurations**: **Run → Edit Configurations**
- Add **Shell Script** configuration for `build.sh`, `mkarchiso.sh`
- Set **working directory** to project root
- Enable **"Show command line afterwards"** for build output analysis

**Documentation**: [Shell Scripts in CLion](https://www.jetbrains.com/help/clion/running-and-debugging-shell-scripts.html)

#### **Integrated Linting**
- CLion includes **shellcheck integration**
- Install shellcheck if not present: `brew install shellcheck` (macOS)
- **Preferences → Tools → External Tools** to configure custom linting
- **Code → Inspect Code** for project-wide script analysis

**Documentation**: [External Tools Configuration](https://www.jetbrains.com/help/clion/configuring-third-party-tools.html)

### 4. Configuration File Management

#### **Multi-file Editing**
- **Split editor**: **Window → Editor Tabs → Split Right**
- Compare `packages.x86_64` with future `packages.aarch64`
- **View → Compare Files** for detailed package list analysis
- **Find in Files** (**Ctrl+Shift+F**) for architecture-specific references

#### **Advanced Search and Replace**
- **Edit → Find → Replace in Path** (**Ctrl+Shift+R**)
- Use **Regular expressions** for architecture-specific replacements:
  - `x86_64` → `aarch64`
  - `intel-ucode|amd-ucode` → (remove for ARM64)
- **Preview changes** before applying mass replacements

**Documentation**: [Finding and Replacing Text](https://www.jetbrains.com/help/clion/finding-and-replacing-text-in-project.html)

### 5. Cross-Compilation Setup for ARM64

#### **Terminal Integration**
- **View → Tool Windows → Terminal** (or **Alt+F12**)
- CLion terminal inherits your shell environment
- Perfect for **archiso commands** and **cross-compilation testing**

#### **Build System Integration**
- **Run → Edit Configurations → Add New → Shell Script**
- Create configurations for:
  - **"Clean Build"**: `./refresh.sh`
  - **"Full Build"**: `./build.sh`
  - **"ARM64 Build"** (future): `./build-arm64.sh`

#### **Remote Development (ARM64 Hardware)**
- **Tools → Deployment → Configuration** for Raspberry Pi/ARM64 boards
- **SSH/SFTP setup** for testing on real ARM64 hardware
- **Remote debugging** capabilities for Phase 3 testing

**Documentation**: [Remote Development](https://www.jetbrains.com/help/clion/remote-projects-support.html)

### 6. Version Control Integration

#### **GitLab Integration**
- **VCS → Get from Version Control** if cloning fresh
- **View → Tool Windows → Git** for commit/branch management
- **VCS → Create Pull Request** for GitLab merge requests
- **Annotate** feature (**right-click in editor → Git → Annotate**) for blame analysis

#### **Issue Integration**
- **Tools → Tasks & Contexts → Open Task**
- Connect to your GitLab issues: `https://gitlab.acreetionos.org/acreetionos_on_arm/acreetionos-junkins-fork/-/issues`
- Automatic branch creation for issue work
- Commit message templates referencing GitLab issues

**Documentation**: [Version Control with CLion](https://www.jetbrains.com/help/clion/version-control-integration.html)

### 7. Project-Specific Workflows

#### **Package Analysis (Phase 1-2)**
- **Navigate → File** (**Ctrl+Shift+N**) for quick file access
- **Find Usages** (**Alt+F7**) to track package dependencies
- **Bookmarks** (**F11**) to mark important configuration sections
- **TODO tool window** to track ARM64 conversion tasks

#### **Documentation Management**
- **Markdown support** for your `analysis/` directory
- **Live preview** for documentation editing
- **Diagrams** support for architecture documentation
- **File Watchers** to auto-update analysis documents

**Documentation**: [Markdown Support](https://www.jetbrains.com/help/clion/markdown.html)

## Phase-Specific Usage

### Phase 1: Foundation and Infrastructure

#### **Environment Setup Tracking**
- **Run Configurations** for cross-compilation test commands
- **External Tools** for archiso validation
- **File Templates** for new ARM64 configuration files

#### **Repository Analysis**
- **Find in Path** to locate all x86_64 references
- **Structural Search and Replace** for complex pattern matching
- **Code Inspection** for potential ARM64 compatibility issues

### Phase 2: Hardware Support and Drivers

#### **Package Compilation Management**
- **Build system integration** for custom package builds
- **Remote debugging** setup for ARM64 hardware testing
- **Log analysis** tools for compilation error tracking

### Phase 3: System Integration and Testing

#### **Multi-platform Testing**
- **Multiple deployment configurations** for different ARM64 boards
- **Test result integration** and analysis
- **Remote file synchronization** for testing workflows

### Phase 4: Production Readiness

#### **Release Management**
- **Build artifacts** management and tracking
- **Documentation generation** and validation
- **Final testing** coordination across platforms

## Productivity Tips

### 8. Essential Keyboard Shortcuts

| Action | Shortcut (macOS) | Shortcut (Linux/Win) |
|--------|------------------|---------------------|
| **Quick Open File** | Cmd+Shift+O | Ctrl+Shift+N |
| **Find in Files** | Cmd+Shift+F | Ctrl+Shift+F |
| **Replace in Path** | Cmd+Shift+R | Ctrl+Shift+R |
| **Run Current Script** | Cmd+Shift+R | Ctrl+Shift+F10 |
| **Terminal** | Alt+F12 | Alt+F12 |
| **Git Tool Window** | Cmd+9 | Alt+9 |
| **Find Usages** | Alt+F7 | Alt+F7 |
| **Navigate Back** | Cmd+Alt+Left | Ctrl+Alt+Left |

### 9. Useful Tool Windows

- **Project** (**Cmd+1**): File tree navigation
- **Terminal** (**Alt+F12**): Integrated shell
- **Git** (**Cmd+9**): Version control operations
- **TODO** (**Cmd+6**): Track ARM64 conversion tasks
- **Find** (**Cmd+3**): Search results management
- **Run** (**Cmd+4**): Build output and script results

### 10. Code Navigation

- **Recent Files** (**Cmd+E**): Quick switching between edited files
- **Recent Locations** (**Cmd+Shift+E**): Jump to recently edited code sections
- **File Structure** (**Cmd+F12**): Navigate within configuration files
- **Breadcrumbs**: Track your location in deep directory structures

## Integration with ARM64 Development

### 11. Cross-Compilation Workflow

```bash
# Terminal commands you'll use frequently in CLion:
./refresh.sh                    # Clean builds
./build.sh                      # Full x86_64 build (current)
shellcheck *.sh                 # Lint shell scripts
mkarchiso -h                    # Check archiso options
pacman -Ss package-name         # Search for ARM64 packages
```

### 12. ARM64-Specific File Monitoring

Set up **File Watchers** for automatic tasks:
- **Shell script validation** on `.sh` file changes
- **Configuration validation** on `profiledef.sh` changes
- **Package list analysis** on `packages.*` changes

**Documentation**: [File Watchers](https://www.jetbrains.com/help/clion/using-file-watchers.html)

## Troubleshooting

### Common Issues

1. **Shell scripts not executing**: Check file permissions with `chmod +x *.sh`
2. **Terminal not finding commands**: Verify PATH includes necessary tools (archiso, pacman)
3. **Git integration issues**: Ensure SSH keys are configured for GitLab access
4. **Remote development problems**: Check SSH connectivity to ARM64 hardware

### Performance Optimization

- **Exclude build directories**: **Preferences → Build, Execution, Deployment → Excluded**
- Add `work/`, `out/`, `../ISO` to excluded paths
- **Index optimization** for large configuration files

**Documentation**: [Configuring Project Structure](https://www.jetbrains.com/help/clion/configuring-project-structure.html)

## Additional Resources

### JetBrains Documentation
- [CLion Quick Start Guide](https://www.jetbrains.com/help/clion/clion-quick-start-guide.html)
- [Working with Shell Scripts](https://www.jetbrains.com/help/clion/running-and-debugging-shell-scripts.html)
- [Remote Development](https://www.jetbrains.com/help/clion/remote-projects-support.html)
- [Version Control Integration](https://www.jetbrains.com/help/clion/version-control-integration.html)

### Systems Development Specific
- [External Tools and External Resources](https://www.jetbrains.com/help/clion/configuring-third-party-tools.html)
- [Code Inspection and Analysis](https://www.jetbrains.com/help/clion/code-inspection.html)
- [Working with Makefiles](https://www.jetbrains.com/help/clion/makefiles-support.html)

This guide should get you productive immediately with CLion for your ARM64 port project. The IDE's strength in systems development, shell scripting, and cross-platform work makes it ideal for the technical challenges you'll face across all four development phases.