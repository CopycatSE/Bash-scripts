#!/bin/bash
set -e

# Detect OS and install zsh, curl, git if not already installed.
if [ "$(uname)" = "Darwin" ]; then
    echo "Detected macOS..."
    if ! command -v zsh &>/dev/null; then
        echo "Zsh not found. Installing via Homebrew..."
        if ! command -v brew &>/dev/null; then
            echo "Homebrew not found. Installing Homebrew first..."
            /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        fi
        brew install zsh
    fi
elif command -v apt-get &>/dev/null; then
    echo "Detected Debian-based Linux..."
    sudo apt-get update -y
    sudo apt-get install -y zsh curl git
elif command -v dnf &>/dev/null; 
    echo "Detected Fedora-based Linux..."
    sudo dnf install -y zsh curl git
else
    echo "Unsupported OS. Please install zsh, curl, and git manually."
    exit 1
fi

# Install Oh My Zsh non-interactively.
export RUNZSH=no
export CHSH=no
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
else
    echo "Oh My Zsh already installed. Moving on..."
fi

# Install Powerlevel10k theme.
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k" ]; then
    echo "Installing Powerlevel10k theme..."
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \
      ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
else
    echo "Powerlevel10k is already installed."
fi

# Install zsh-syntax-highlighting plugin.
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting" ]; then
    echo "Installing zsh-syntax-highlighting..."
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
      ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
else
    echo "zsh-syntax-highlighting already exists."
fi

# Install zsh-autosuggestions plugin.
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions" ]; then
    echo "Installing zsh-autosuggestions..."
    git clone https://github.com/zsh-users/zsh-autosuggestions.git \
      ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
else
    echo "zsh-autosuggestions already exists."
fi

# Note: The 'web-search' plugin is part of the default Oh My Zsh package,
# so no extra installation is needed.

# Update ~/.zshrc to set the Powerlevel10k theme and enable the plugins.
ZSHRC="$HOME/.zshrc"
if [ -f "$ZSHRC" ]; then
    echo "Configuring .zshrc..."
    if [[ "$OSTYPE" == "darwin"* ]]; then
        sed -i '' 's/^ZSH_THEME=".*"/ZSH_THEME="powerlevel10k\/powerlevel10k"/' "$ZSHRC"
        sed -i '' 's/^plugins=(.*)/plugins=(git zsh-syntax-highlighting zsh-autosuggestions web-search)/' "$ZSHRC"
    else
        sed -i 's/^ZSH_THEME=".*"/ZSH_THEME="powerlevel10k\/powerlevel10k"/' "$ZSHRC"
        sed -i 's/^plugins=(.*)/plugins=(git zsh-syntax-highlighting zsh-autosuggestions web-search)/' "$ZSHRC"
    fi
else
    echo "No .zshrc found. Creating one from the template..."
    cp "$HOME/.oh-my-zsh/templates/zshrc.zsh-template" "$ZSHRC"
    echo 'ZSH_THEME="powerlevel10k/powerlevel10k"' >> "$ZSHRC"
    echo 'plugins=(git zsh-syntax-highlighting zsh-autosuggestions web-search)' >> "$ZSHRC"
fi

# Change the default shell to zsh.
echo "Changing default shell to zsh..."
chsh -s "$(command -v zsh)" "$(whoami)" || \
    echo "Uh oh, automatic shell change failed. Please run 'chsh -s $(command -v zsh)' manually."

echo "All done! Restart your terminal or run 'source ~/.zshrc' to start using your new zsh setup."