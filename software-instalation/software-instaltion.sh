#!/usr/bin/env bash

set -euo pipefail

# Ensures no interactive prompts

export DEBIAN_FRONTEND=noninteractive

# Check if the user has root privileges or passwordless sudo

if [["$(id -u)" -ne 0]]; then

# Try passwordless sudo

if sudo -n true 2>/dev/null; then
echo "[INFO] Using passwordless sudo to install packages..."
else
echo "[ERROR] This script requires running as root or passwordless sudo configured."
exit 1
fi
fi

echo "[INFO] Updating package lists..."
sudo -n apt-get update -qq

echo "[INFO] Installing packages: btop, mc, htop, git, net-tools, iproute2, nmap, network-manager..."
sudo -n apt-get install -y \
 btop \
 mc \
 htop \
 git \
 net-tools \
 iproute2 \
 nmap \
 network-manager

echo "[INFO] Installation completed successfully!"
