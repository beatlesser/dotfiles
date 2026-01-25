-- Make line numbers default
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "auto"

-- Show which line your cursor is on
vim.opt.cursorline = true

-- only one statusline
vim.opt.laststatus = 3

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- tab indent width
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- enable soft line wrap
vim.opt.wrap = true

-- Enable break indent
vim.opt.breakindent = true

-- nvim window border shape
vim.opt.winborder = "rounded"

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = "auto"

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 5

-- Decrease update time
vim.opt.updatetime = 250

-- Save undo history
vim.opt.undofile = true
-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"

-- "<leader>" and "<localleader>" in keymap
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- use system clipboard
vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)
