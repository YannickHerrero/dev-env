# Development Environment Setup

A comprehensive development environment configuration for Linux/WSL2 systems, featuring modern terminal tools, Neovim with full IDE capabilities, and automated setup scripts.

## Features

- **Neovim Configuration**: Full IDE setup with LSP, autocompletion, file explorer, and 15+ plugins
- **Tmux Setup**: Custom key bindings, session management, and project switcher
- **Shell Environment**: Zsh with oh-my-posh prompt and smart directory navigation
- **Automated Installation**: One-command setup for the entire environment
- **Windows Support**: Automated Windows configuration deployment via WSL

## Quick Start

```bash
# Clone the repository
git clone https://github.com/YannickHerrero/dev-env
cd dev-env

# Linux/WSL2 Installation
# Preview what will be installed (dry run)
./install/main --dry

# Install the complete environment
./install/main

# Or install specific components
./install/runner nvim    # Neovim only
./install/runner tmux    # Tmux only
./install/runner dev     # Development tools only

# Windows Configuration (from WSL)
# Deploy all Windows configs
./install/windows

# Deploy specific Windows app configs
./install/windows glazwm      # GlazeWM window manager
./install/windows qutebrowser # Qutebrowser configs
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
├── install/           # Installation system
│   ├── main          # Main installer
│   ├── runner        # Component runner
│   ├── windows       # Windows config deployment
│   └── components/   # Individual installers
│       ├── linux/    # Linux-specific installers
│       └── windows/  # Windows-specific installers
├── config/           # All configuration files
│   ├── linux/        # Linux configurations
│   │   ├── home/     # Home directory dotfiles
│   │   └── dotconfig/ # ~/.config app configurations
│   └── windows/      # Windows configurations
├── scripts/          # Utility scripts (sessionizer)
└── docs/            # Documentation
```

## Customization

The modular design allows easy customization:
- Modify plugin configurations in `config/linux/dotconfig/nvim/lua/plugins/`
- Adjust shell settings in `config/linux/home/.zshrc`
- Customize tmux behavior in `config/linux/home/.tmux.conf`
- Add new Linux installation scripts to `install/components/linux/` directory
- Add new Windows installation scripts to `install/components/windows/` directory

## Requirements

### Linux/WSL2
- Linux or WSL2 environment
- Git installed
- Sudo privileges for package installation
- Internet connection for downloading packages and plugins

### Windows (via WSL)
- WSL2 with access to Windows filesystem (`/mnt/c`)
- Windows applications (GlazeWM, Qutebrowser) installed separately
- Configuration deployment handled automatically via WSL scripts