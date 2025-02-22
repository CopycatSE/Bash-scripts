# Bash-scripts

# Zsh Auto-Setup Script

## Overview

This script automates the installation and setup of **Zsh**, **Oh My Zsh**, and the **Powerlevel10k theme** along with essential plugins like **zsh-syntax-highlighting**, **zsh-autosuggestions**, and **web-search**. It ensures a smooth, non-interactive installation across macOS, Debian-based, and Fedora-based Linux systems.

## Features

- Installs **Zsh**, **curl**, and **git** if not already installed.
- Installs **Oh My Zsh** automatically.
- Configures **Powerlevel10k** as the default theme.
- Installs and enables the following plugins:
  - **zsh-syntax-highlighting**
  - **zsh-autosuggestions**
  - **web-search** (included with Oh My Zsh)
- Ensures installation is non-interruptive.
- Changes the default shell to Zsh.

## Supported Operating Systems

- **macOS** (via Homebrew)
- **Debian-based Linux** (Ubuntu, Raspberry Pi OS, etc.)
- **Fedora-based Linux**

## Installation

### 1. Download the script

```bash
curl -O https://your-repo-link/zsh-instalation.sh
```

### 2. Make it executable

```bash
chmod +x zsh-instalation.sh
```

### 3. Run the script

```bash
./zsh-instalation.sh
```

If prompted for a password, enter your **sudo** password to allow package installations.

## Usage

Once installed, restart your terminal or run:

```bash
source ~/.zshrc
```

## Troubleshooting

### **Automatic shell change failed**

If the script fails to change the default shell, run this manually:

```bash
chsh -s $(which zsh)
```

Then, restart your terminal.

### **DNS resolution issues when cloning from GitHub**

If the script fails to download dependencies, try:

```bash
ping -c 3 8.8.8.8  # Check internet connectivity
sudo echo "nameserver 8.8.8.8" | sudo tee /etc/resolv.conf > /dev/null  # Fix DNS
```

## Uninstallation

To revert to your previous shell and remove Oh My Zsh:

```bash
sh ~/.oh-my-zsh/tools/uninstall.sh
chsh -s $(which bash)  # Or your preferred shell
rm -rf ~/.oh-my-zsh ~/.zshrc ~/.p10k.zsh
```

## License

This script is provided under the **MIT License**. Feel free to modify and distribute it!
