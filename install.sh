#!/bin/bash
# Install dotfiles by creating symlinks

set -e

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

link() {
    local src="$DOTFILES_DIR/$1"
    local dest="$HOME/$2"
    mkdir -p "$(dirname "$dest")"
    if [ -e "$dest" ] && [ ! -L "$dest" ]; then
        echo "  Backing up existing $dest → ${dest}.bak"
        mv "$dest" "${dest}.bak"
    fi
    ln -sf "$src" "$dest"
    echo "  Linked: $dest → $src"
}

echo "Installing dotfiles..."
echo ""

echo "[Zsh]"
link "zsh/.zshrc" ".zshrc"
link "zsh/aliases.zsh" ".config/zsh/aliases.zsh"
link "zsh/exports.zsh" ".config/zsh/exports.zsh"

echo "[Neovim]"
link "nvim/init.lua" ".config/nvim/init.lua"

echo "[Tmux]"
link "tmux/.tmux.conf" ".tmux.conf"

echo "[Git]"
link "git/.gitconfig" ".gitconfig"

echo ""
echo "Done! Restart your shell or run: source ~/.zshrc"
