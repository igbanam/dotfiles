# igbanam's dotfiles

Personal TUI configuration managed with [Dotbot](https://github.com/anishathalye/dotbot).

## What's Included

- **Vim 9** - Text editor with Vim9script configuration
- **tmux** - Terminal multiplexer with TPM plugins
- **Git** - Extensive aliases and modern defaults
- **Ghostty** - Terminal emulator configuration
- **Homebrew** - Package management via Brewfile

## Quick Start

```bash
# Clone with submodules
git clone --recursive https://github.com/igbanam/dotfiles.git ~/.dotfiles
cd ~/.dotfiles

# Run installer
./install
```

## Installation Options

```bash
./install              # Full installation
./install --help       # Show help
./install --no-brew    # Skip Homebrew check
./install --verbose    # Verbose output
```

## Requirements

- **macOS** or **Linux**
- **Homebrew** (will prompt to install if missing)
- **Git** 2.x+
- **Vim** 9.x+ (installed via Brewfile)

## Structure

```
dotfiles/
├── install              # Bootstrap script
├── install.conf.yaml    # Dotbot configuration
├── Brewfile             # Homebrew packages
├── vimrc                # Vim configuration
├── vim.d/               # Vim modules
│   ├── plugs.vim        # Plugin declarations
│   ├── core/            # Core settings
│   └── plug/            # Plugin configurations
├── tmux.conf            # tmux configuration
├── gitconfig            # Git configuration
├── gitignore-system     # Global gitignore
└── ghostty/             # Ghostty terminal config
```

## Post-Installation

1. Restart your shell: `exec $SHELL`
2. Install Vim plugins: `:PlugInstall` (runs automatically, but verify)
3. Configure git identity in `~/.gitconfig.includeables`:
   ```ini
   [user]
       name = Your Name
       email = you@example.com
   ```

## Modern CLI Tools

The Brewfile includes modern replacements for classic tools:

| Classic | Modern | Description |
|---------|--------|-------------|
| `grep`  | `rg` (ripgrep) | Faster recursive search |
| `find`  | `fd` | Simpler syntax, respects gitignore |
| `cat`   | `bat` | Syntax highlighting, line numbers |
| `ls`    | `eza` | Icons, git status, tree view |
| `cd`    | `z` (zoxide) | Smart directory jumping |
| `diff`  | `delta` | Better git diffs |

## License

[MIT](LICENSE)
