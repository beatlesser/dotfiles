vim.keymap.set({ "n", "x", "v" }, "j", "gj", { silent = true, desc = "Move cursor down" })
vim.keymap.set({ "n", "x", "v" }, "k", "gk", { silent = true, desc = "Move cursor up" })
vim.keymap.set("n", "<leader>R", "<cmd>restart<cr>", { silent = true, desc = "Restart config" })

-- buffer
vim.keymap.set("n", '<leader>bn', "<cmd>bnext<cr>", { silent = true, desc = "Move to next buffer" })
vim.keymap.set("n", '<leader>bp', "<cmd>bprev<cr>", { silent = true, desc = "Move to prev buffer" })

-- window
vim.keymap.set("n", 'H', '<C-w>h', { silent = true, desc = "Focus on left window" })
vim.keymap.set("n", 'J', '<C-w>j', { silent = true, desc = "Focus on down window" })
vim.keymap.set("n", 'K', '<C-w>k', { silent = true, desc = "Focus on up window" })
vim.keymap.set("n", 'L', '<C-w>l', { silent = true, desc = "Focus on right window" })
vim.keymap.set("n", "<C-Left>", '<cmd>vertical resize -2<cr>', { silent = true, desc = "Dec window width" })
vim.keymap.set("n", "<C-Right>", '<cmd>vertical resize +2<cr>', { silent = true, desc = "Inc window width" })
vim.keymap.set("n", "<C-Down>", '<cmd>resize -5<cr>', { silent = true, desc = "Dec window height" })
vim.keymap.set("n", "<C-Up>", '<cmd>resize +5<cr>', { silent = true, desc = "Inc window height" })

-- no hightlight search
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { silent = true, desc = "Clear highlight search" })
