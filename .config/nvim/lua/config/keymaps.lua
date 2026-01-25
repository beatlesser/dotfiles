#vim.keymap.set("i", "jk", "<esc>", { noremap = true, desc = "jk to escape to normal mode" })
vim.keymap.set({ "n", "x", "v" }, "j", "gj", { silent = true, desc = "Move cursor down" })
vim.keymap.set({ "n", "x", "v" }, "k", "gk", { silent = true, desc = "Move cursor up" })
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { silent = true, desc = "clear highlight search" })
