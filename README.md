# dotfiles

My personal Linux configuration files for zsh, neovim, tmux, and git.

## Installation

```bash
git clone https://github.com/akunbaruaja/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install.sh
```

## What's Included

### Zsh (`zsh/`)
- `.zshrc` — Main config with aliases, functions, prompt
- `aliases.zsh` — Custom command shortcuts
- `exports.zsh` — Environment variables

### Neovim (`nvim/`)
- `init.lua` — Lazy.nvim plugin manager setup
- Keymaps, LSP config, telescope, treesitter

### Tmux (`tmux/`)
- `.tmux.conf` — Status bar, keybindings, plugins

### Git (`git/`)
- `.gitconfig` — Aliases, diff settings, signing

## Screenshots

```
┌─────────────────────────────────────┐
│  ~ dotfiles on main via △ v3.5.1    │
│  ❯ nv .                             │
│  [neovim opens with lazy.nvim]      │
└─────────────────────────────────────┘
```

## License

MIT
