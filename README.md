# Neovim Configuration

A modern, minimal Neovim configuration using [lazy.nvim](https://github.com/folke/lazy.nvim) as the plugin manager.

## 📁 Directory Structure

```
~/.config/nvim/
├── init.lua              # Main entry point
├── lazy-lock.json        # Plugin version lock file
└── lua/
    ├── config/
    │   ├── lazy.lua      # Lazy.nvim bootstrap and setup
    │   ├── options.lua   # Neovim options/settings
    │   └── keymaps.lua   # Custom keybindings
    └── plugins/
        ├── conform.lua   # Code formatter
        ├── fzf.lua       # Fuzzy finder
        ├── indent.lua    # Auto-detect indentation
        ├── lsp.lua       # LSP configuration
        ├── oil.lua       # File explorer
        ├── onedark.lua   # Color scheme
        ├── showkeys.lua  # Show key presses
        ├── snacks.lua    # Multi-feature plugin suite
        ├── statusline.lua # Status line
        ├── treesitter.lua # Syntax highlighting
        └── which-key.lua  # Keymap helper
```

## ⚙️ Configuration Files

### init.lua

The main entry point that:
- Loads the lazy.nvim plugin manager
- Sets up an autocommand to restore cursor on exit
- Initializes all plugins and configuration

### lua/config/lazy.lua

Bootstraps and configures lazy.nvim:
- **Leader Keys**: 
  - `<Space>` as `mapleader`
  - `\` as `maplocalleader`
- **Auto-install**: Clones lazy.nvim if not present
- **Plugin Management**: Automatically imports all plugins from `lua/plugins/`
- **Auto-update**: Checker enabled for plugin updates

### lua/config/options.lua

Core Neovim settings:

#### Indentation
- `expandtab = true` - Use spaces instead of tabs
- `shiftwidth = 2` - Indent width for `<<` and `>>`
- `tabstop = 2` - Tab display width
- `softtabstop = 2` - Spaces inserted when pressing Tab
- `smarttab = true` - Smart tab behavior
- `smartindent = true` - Auto-indent new lines
- `autoindent = true` - Copy indent from previous line

#### Files
- `swapfile = false` - No swap files
- `backup = false` - No backup files
- `undofile = true` - Persistent undo history

#### UI/Display
- `number = true` - Show line numbers
- `relativenumber = true` - Relative line numbers
- `cursorline = true` - Highlight current line
- `showmode = false` - Hide mode (shown in statusline)
- `signcolumn = "yes"` - Always show sign column
- `list = true` - Show whitespace characters
- `listchars = { tab = "» ", trail = "·", nbsp = "␣" }` - Whitespace symbols

#### Behavior
- `breakindent = true` - Wrapped lines continue indented
- `mouse = "a"` - Enable mouse support
- `splitright = true` - Vertical splits open on right
- `splitbelow = true` - Horizontal splits open below
- `scrolloff = 5` - Keep 5 lines above/below cursor

### lua/config/keymaps.lua

Custom key mappings:
- `-` - Open parent directory in Oil (floating window)
- `gl` - Open diagnostics in floating window

## 🔌 Plugins

### Color Scheme

#### onedark ([olimorris/onedarkpro.nvim](https://github.com/olimorris/onedarkpro.nvim))
- **Purpose**: OneDark theme for a modern look
- **Priority**: 1000 (loads first)
- **Config**: `lua/plugins/onedark.lua`

### File Navigation

#### Oil.nvim ([stevearc/oil.nvim](https://github.com/stevearc/oil.nvim))
- **Purpose**: File explorer that lets you edit your filesystem like a normal buffer
- **Lazy Loading**: Disabled (always loaded)
- **Dependencies**: mini.icons for file icons
- **Keymap**: `-` opens parent directory in floating window
- **Config**: `lua/plugins/oil.lua`

#### FZF-lua ([ibhagwan/fzf-lua](https://github.com/ibhagwan/fzf-lua))
- **Purpose**: Fast fuzzy finder for files, buffers, and more
- **Dependencies**: mini.icons
- **Features**: 
  - UI select integration for better picker UIs
- **Keymaps**:
  - `<leader>ff` - Find files in project directory
  - `<leader>fg` - Find by grepping in project directory
  - `<leader>fb` - Find active buffers
  - `<leader><leader>` - Find builtin FZF commands
- **Config**: `lua/plugins/fzf.lua`

### Code Intelligence

#### LSP - Language Server Protocol ([neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig))
- **Purpose**: Full IDE features via Language Server Protocol
- **Dependencies**:
  - **mason.nvim** - Automatically install LSP servers
  - **mason-lspconfig.nvim** - Bridge mason with lspconfig
  - **mason-tool-installer.nvim** - Automatically install tools
  - **fidget.nvim** - LSP status updates UI
- **Installed LSP Servers**:
  - **vtsls** - TypeScript/JavaScript (advanced features, inlay hints)
  - **lua_ls** - Lua (optimized for Neovim configuration)
- **Installed Tools**:
  - **stylua** - Lua formatter
- **Diagnostic Configuration**:
  - Rounded borders for floating windows
  - Custom icons for errors, warnings, info, and hints
  - Virtual text only for warnings and errors
  - Severity sorting enabled
  - No updates while typing (insert mode)
- **LSP Keymaps** (available in LSP-enabled buffers):
  - `gd` - Go to definition (FZF)
  - `gr` - Go to references (FZF)
  - `gI` - Go to implementation (FZF)
  - `gD` - Go to declaration
  - `<leader>D` - Type definition (FZF)
  - `<leader>ds` - Document symbols (FZF)
  - `<leader>ws` - Workspace symbols (FZF)
  - `<leader>cr` - Rename symbol
  - `<leader>ca` - Code actions (FZF)
  - `<leader>th` - Toggle inlay hints
  - `[d` - Go to previous diagnostic
  - `]d` - Go to next diagnostic
  - `<leader>cd` - Show line diagnostics
  - `<leader>cD` - Show document diagnostics (FZF)
  - `<leader>cw` - Show workspace diagnostics (FZF)
- **Features**:
  - Auto-highlight references under cursor
  - Inlay hints support (for TypeScript/JavaScript and Lua)
  - Rounded borders for hover and signature help
  - Auto-install language servers via Mason
- **Config**: `lua/plugins/lsp.lua`

#### Conform.nvim ([stevearc/conform.nvim](https://github.com/stevearc/conform.nvim))
- **Purpose**: Fast and flexible code formatter
- **Configured Formatters**:
  - **Lua**: stylua (LSP as fallback)
  - **JavaScript**: prettierd or prettier (first available)
  - **TypeScript**: prettierd or prettier (first available)
- **Keymaps**:
  - `<leader>cf` - Format current buffer
- **Config**: `lua/plugins/conform.lua`

#### Treesitter ([nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter))
- **Purpose**: Advanced syntax highlighting and code understanding
- **Branch**: master
- **Lazy Loading**: Disabled (always loaded)
- **Build**: Runs `:TSUpdate` on install/update
- **Features**:
  - Auto-install language parsers
  - Syntax highlighting
  - Smart indentation
  - Incremental selection:
    - `<Enter>` - Initialize/expand selection
    - `<Backspace>` - Shrink selection
- **Config**: `lua/plugins/treesitter.lua`

#### guess-indent.nvim ([nmac427/guess-indent.nvim](https://github.com/nmac427/guess-indent.nvim))
- **Purpose**: Automatically detects and sets indentation from file content
- **Config**: `lua/plugins/indent.lua`

### UI Enhancements

#### mini.statusline ([nvim-mini/mini.statusline](https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-statusline.md))
- **Purpose**: Minimal, fast statusline
- **Customization**: 
  - Insert mode uses light green background (#a6e3a1) with dark text (#1e1e2e)
- **Config**: `lua/plugins/statusline.lua`

#### which-key.nvim ([folke/which-key.nvim](https://github.com/folke/which-key.nvim))
- **Purpose**: Displays available keybindings in a popup
- **Preset**: Modern style
- **Event**: Loads on VeryLazy
- **Keymaps**:
  - `<leader>?` - Show buffer-local keymaps
- **Config**: `lua/plugins/which-key.lua`

#### showkeys ([nvzone/showkeys](https://github.com/nvzone/showkeys))
- **Purpose**: Display pressed keys on screen (useful for demos/screencasts)
- **Default State**: Toggled off on startup (for performance)
- **Command**: `:ShowkeysToggle` to enable/disable
- **Config**: `lua/plugins/showkeys.lua`

#### Snacks.nvim ([folke/snacks.nvim](https://github.com/folke/snacks.nvim))
- **Purpose**: Collection of useful Neovim utilities in one plugin
- **Priority**: 1000 (loads early)
- **Lazy Loading**: Disabled (always loaded)
- **Enabled Features**:
  - **bigfile** - Optimize handling of large files
  - **dashboard** - Welcome screen with quick actions
  - **explorer** - Alternative file explorer
  - **indent** - Indent guides and animations
  - **input** - Enhanced input UI
  - **notifier** - Notification system (5 second timeout)
  - **quickfile** - Faster file opening
  - **scope** - Scope-based indentation
  - **scroll** - Smooth scrolling
  - **statuscolumn** - Enhanced status column with git signs
  - **words** - Word highlighting and navigation
- **Keymaps**:
  - `<leader>e` - Open file explorer
  - `<leader>z` - Toggle zen mode
  - `<Ctrl-_>` - Toggle terminal (Ctrl+/)
- **Config**: `lua/plugins/snacks.lua`

## 🚀 Installation

### Prerequisites

- Neovim >= 0.9.0 (0.10+ recommended)
- Git
- A [Nerd Font](https://www.nerdfonts.com/) for icons (optional but recommended)
- `fzf` binary for fuzzy finding
- Node.js and npm (for LSP servers like vtsls)
- Language-specific tools:
  - **prettierd** or **prettier** for JavaScript/TypeScript formatting: `npm install -g prettier @fsouza/prettierd`

### Steps

1. **Backup existing configuration** (if any):
   ```bash
   mv ~/.config/nvim ~/.config/nvim.backup
   ```

2. **Clone this configuration**:
   ```bash
   git clone <your-repo-url> ~/.config/nvim
   ```

3. **Start Neovim**:
   ```bash
   nvim
   ```

4. **Wait for plugins to install**: lazy.nvim will automatically install all plugins on first launch

5. **Restart Neovim**: Some plugins may require a restart to function properly

## 📝 Usage

### Basic Keybindings

#### Leader Key
- `<Space>` is the leader key
- `\` is the local leader key

#### File Navigation
- `-` - Open parent directory in Oil (file explorer)
- `<leader>e` - Open Snacks file explorer
- `<leader>ff` - Find files with FZF
- `<leader>fg` - Grep search in project
- `<leader>fb` - Find open buffers
- `<leader><leader>` - FZF builtin commands

#### Code Navigation (LSP)
- `gd` - Go to definition
- `gr` - Go to references
- `gI` - Go to implementation
- `gD` - Go to declaration
- `<leader>D` - Type definition
- `<leader>ds` - Document symbols
- `<leader>ws` - Workspace symbols

#### Code Actions (LSP)
- `<leader>cr` - Rename symbol
- `<leader>ca` - Code actions
- `<leader>cf` - Format buffer
- `<leader>th` - Toggle inlay hints

#### Diagnostics
- `gl` - Show diagnostics in float
- `[d` - Previous diagnostic
- `]d` - Next diagnostic
- `<leader>cd` - Line diagnostics
- `<leader>cD` - Document diagnostics
- `<leader>cw` - Workspace diagnostics

#### UI
- `<leader>?` - Show buffer-local keymaps (which-key)
- `<leader>z` - Toggle zen mode
- `<Ctrl-_>` - Toggle terminal (Ctrl+/)

#### Treesitter Selection
- `<Enter>` - Start/expand selection
- `<Backspace>` - Shrink selection

### Plugin Management

lazy.nvim provides these commands:
- `:Lazy` - Open lazy.nvim UI
- `:Lazy update` - Update plugins
- `:Lazy sync` - Install missing and update plugins
- `:Lazy clean` - Remove unused plugins
- `:Lazy check` - Check for updates

### Useful Commands

#### Plugin Management
- `:Lazy` - Open lazy.nvim UI
- `:Lazy update` - Update all plugins
- `:Lazy sync` - Install missing and update plugins
- `:Lazy clean` - Remove unused plugins

#### LSP & Tools
- `:Mason` - Open Mason UI (manage LSP servers and tools)
- `:LspInfo` - Show LSP server information
- `:LspRestart` - Restart LSP server

#### Syntax & Formatting
- `:TSUpdate` - Update Treesitter parsers
- `:TSInstall <language>` - Install specific language parser
- `:ConformInfo` - Show formatter information

#### UI
- `:ShowkeysToggle` - Toggle showkeys display
- `:Oil` - Open Oil file explorer

## 🎨 Customization

### Adding New Plugins

Create a new file in `lua/plugins/` with the plugin specification:

```lua
-- lua/plugins/example.lua
return {
  "author/plugin-name",
  opts = {},
  -- Additional configuration
}
```

lazy.nvim will automatically load it on next startup.

### Modifying Options

Edit `lua/config/options.lua` to change Neovim settings.

### Adding Keymaps

Edit `lua/config/keymaps.lua` to add custom keybindings:

```lua
vim.keymap.set("n", "<leader>key", "<cmd>Command<CR>", { desc = "Description" })
```

### Changing Color Scheme

Edit `lua/plugins/onedark.lua` to use a different theme, or install additional themes in the `lua/plugins/` directory.

## 🔧 Troubleshooting

### Plugins not loading
- Run `:Lazy` to check plugin status
- Try `:Lazy sync` to reinstall plugins
- Check `:checkhealth` for general issues

### LSP not working
- Run `:Mason` to check if language servers are installed
- Use `:LspInfo` to see active LSP clients
- Check `:checkhealth lspconfig` for LSP issues
- Ensure language-specific tools are installed (e.g., Node.js for vtsls)

### Formatter not working
- Run `:ConformInfo` to check formatter status
- Ensure formatters are installed (e.g., `npm install -g prettier`)
- Check `:Mason` to verify tool installation

### Treesitter errors
- Run `:TSUpdate` to update parsers
- Check `:checkhealth nvim-treesitter`

### Icons not showing
- Install a Nerd Font and configure your terminal to use it
- Restart your terminal after font installation

### FZF not working
- Ensure `fzf` is installed on your system
- On Ubuntu/Debian: `sudo apt install fzf`
- On macOS: `brew install fzf`

### Performance issues
- Large files are automatically optimized by Snacks bigfile
- Disable inlay hints with `<leader>th` if typing feels slow
- Check `:checkhealth` for performance recommendations

## 📚 Resources

- [Neovim Documentation](https://neovim.io/doc/)
- [lazy.nvim Documentation](https://github.com/folke/lazy.nvim)
- [Lua Guide for Neovim](https://neovim.io/doc/user/lua-guide.html)

## 📄 License

This configuration is free to use and modify as you see fit.
