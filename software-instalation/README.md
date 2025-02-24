# Package Installer Script

This script installs essential software on Debian/Ubuntu systems. It installs the following packages:

- **btop**
- **mc** (Midnight Commander)
- **htop**
- **git**
- **Network management tools:**
  - net-tools
  - iproute2
  - nmap
  - network-manager

## Overview

The script is designed for non-interactive installation, meaning it will not prompt for confirmation during the process. It requires either running as root or having passwordless sudo configured. The `DEBIAN_FRONTEND=noninteractive` environment variable is set to ensure a smooth, non-interactive experience.

## Prerequisites

- A Debian/Ubuntu based system.
- Root privileges or passwordless sudo configured.

## How to Use

1. **Download or clone** this repository, or copy the script into a file (e.g., `install_packages.sh`).
2. **Make the script executable:**
   ```bash
   chmod +x install_packages.sh
   ```
