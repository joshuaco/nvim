vim.opt.expandtab = true -- Convert tabs to spaces
vim.opt.shiftwidth = 2 -- Amount to indent with << and >>
vim.opt.tabstop = 2 -- How many spaces are shown per tab
vim.opt.softtabstop = 2 -- How many spaces are applied when pressing tab

vim.opt.swapfile = false -- Don't create swapfile
vim.opt.backup = false -- Don't create backupfile

-- Set undofile
vim.opt.undofile = true

vim.opt.smarttab = true
vim.opt.smartindent = true
vim.opt.autoindent = true -- Keep identation from previous line

vim.opt.number = true
vim.opt.relativenumber =  true

-- show line under cursor
vim.opt.cursorline = true

-- Don't show the mode in the status line
vim.opt.showmode = false

-- Enale break indent
vim.opt.breakindent = true

-- Enable mouse mode
vim.opt.mouse = "a"

-- Keep signcolumn on by default
vim.opt.signcolumn = "yes"

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 5
