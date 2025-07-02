# Development Environment Setup

A comprehensive development environment configuration for Linux/WSL2 systems, featuring modern terminal tools, Neovim with full IDE capabilities, and automated setup scripts.

## Features

- **Neovim Configuration**: Full IDE setup with LSP, autocompletion, file explorer, and 15+ plugins
- **Tmux Setup**: Custom key bindings, session management, and project switcher
- **Shell Environment**: Zsh with oh-my-posh prompt and smart directory navigation
- **Automated Installation**: One-command setup for the entire environment

## Quick Start

```bash
# Clone the repository
git clone https://github.com/YannickHerrero/dev-env
cd dev-env

# Preview what will be installed (dry run)
./dev-env --dry

# Install the complete environment
./dev-env

# Or install specific components
./run nvim    # Neovim only
./run tmux    # Tmux only
./run dev     # Development tools only
```

## What Gets Installed

### Development Tools
- **Core utilities**: git-delta, fzf, tldr, ripgrep, fd-find, starship, zoxide
- **Neovim**: Built from source (release-0.11) with comprehensive plugin suite
- **Tmux**: Terminal multiplexer with plugin ecosystem

### Key Features
- **Project Sessionizer**: Press `Ctrl-a f` in tmux to quickly switch between projects
- **Smart Navigation**: Seamless movement between tmux panes and vim splits
- **Modern Shell**: Zsh with syntax highlighting, autosuggestions, and smart completion
- **LSP Integration**: Full language server support for TypeScript, Lua, and more

## Configuration Highlights

### Neovim
- Leader key: `<Space>`
- File finder: `<Space><Space>`
- Live grep: `<Leader>sg`
- File tree: `<Leader>e`
- LSP features: hover (`K`), go to definition (`gd`), references (`gr`)

### Tmux
- Prefix key: `Ctrl-a`
- Split panes: `|` (horizontal), `-` (vertical)
- Project switcher: `Ctrl-a f`
- Vim-style navigation: `Ctrl-h/j/k/l`

### Shell
- Smart directory jumping with zoxide (`cd` command)
- Rich prompt with git integration
- Comprehensive history management

## WSL2 Setup

For telescope.nvim to work properly in WSL, ensure fd is available:
```bash
sudo apt install fd-find
sudo ln -s $(which fdfind) /usr/bin/fd
```

## File Structure

```
dev-env/
├── .config/           # Application configurations
│   ├── nvim/         # Neovim setup with plugins
│   └── ohmyposh/     # Prompt theme
├── config-files/      # Dotfiles (.tmux.conf, .zshrc, .gitconfig)
├── runs/             # Individual installation scripts
├── scripts/          # Utility scripts (sessionizer)
├── dev-env           # Main setup script
└── run              # Script runner with filtering
```

## Customization

The modular design allows easy customization:
- Modify plugin configurations in `.config/nvim/lua/plugins/`
- Adjust shell settings in `config-files/.zshrc`
- Customize tmux behavior in `config-files/.tmux.conf`
- Add new installation scripts to `runs/` directory

## Requirements

- Linux or WSL2 environment
- Git installed
- Sudo privileges for package installation
- Internet connection for downloading packages and plugins