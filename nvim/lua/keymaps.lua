vim.keymap.set('i', 'jk', '<esc>', { noremap = true, silent = true, desc = 'better escape' })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true, desc = 'Move cursor down' })
vim.keymap.set('x', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true, desc = 'Move cursor down' })
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true, desc = 'Move cursor up' })
vim.keymap.set('x', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true, desc = 'Move cursor up' })
vim.keymap.set('n', '<esc>', '<cmd>nohlsearch<CR>', { desc = 'escape highlight search' })
vim.keymap.set('n', '\\', '<CMD>:sp<CR>', { desc = 'Split window horizontally' })
vim.keymap.set('n', '|', '<CMD>:vsp<CR>', { desc = 'Split window vertically' })
vim.keymap.set('n', ']q', '<cmd>cnext<cr>', { desc = 'Go to next qf item' })
vim.keymap.set('n', '[q', '<cmd>cprev<cr>', { desc = 'Go to prev qf item' })
vim.keymap.set('n', '<C-d>', '5j', { desc = 'Scroll down by 5 lines' })
vim.keymap.set('n', '<C-u>', '5k', { desc = 'Scroll up by 5 lines' })
vim.keymap.set('n', 'L', 'gt', { noremap = true, desc = 'Go to next buffer' })
vim.keymap.set('n', 'H', 'gT', { noremap = true, desc = 'Go to prev buffer' })
vim.keymap.set('n', '+', '<C-w>|<C-w>_', { desc = 'Maximize nvim pane' })
vim.keymap.set('n', '=', '<C-w>=', { desc = 'Restore nvim panes' })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
