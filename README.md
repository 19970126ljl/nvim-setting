# Neovim Configuration

## Prerequisites

```bash
# Ubuntu/Debian
apt install neovim git ripgrep build-essential

# macOS
brew install neovim git ripgrep
```

Requires Neovim 0.9+

## Installation

```bash
git clone <your-repo> ~/.config/nvim
nvim
# Run :Lazy sync to install plugins
```

## Plugins

| Plugin | Description |
|--------|-------------|
| lazy.nvim | Plugin manager |
| nvim-tree | File explorer |
| lualine | Status line |
| telescope | Fuzzy finder |
| render-markdown | Markdown rendering |

## Keybindings

Leader key: `<Space>`

### File Explorer (nvim-tree)

| Key | Action |
|-----|--------|
| `<Space>e` | Toggle file explorer |
| `<Space>E` | Find current file in explorer |

### Telescope

| Key | Action |
|-----|--------|
| `<Space>ff` | Find files |
| `<Space>fg` | Live grep (search in files) |
| `<Space>fb` | Find buffers |
| `<Space>fh` | Search help |
| `<Space>fo` | Recent files |
| `<Space>fw` | Find word under cursor |
| `<Space>fr` | Resume last picker |
| `<Space>/` | Search in current buffer |
| `<Space>*` | Search word under cursor in buffer |
| `<Space>gc` | Git commits |
| `<Space>gs` | Git status |

### Telescope Buffer Actions

| Key | Action |
|-----|--------|
| `<CR>` | Open |
| `<C-t>` | Open in new tab |
| `<C-v>` | Open in vertical split |
| `<C-x>` | Open in horizontal split |
| `<C-d>` | Delete buffer (in buffers picker) |
