vim.pack.add({
	{ src = "https://github.com/stevearc/oil.nvim" },
})

require("oil").setup({
	columns = { "icon" },
	default_file_explorer = true,
	skip_confirm_for_simple_edits = true,
	lsp_file_methods = {
		enabled = true,
		timeout_ms = 1000,
		autosave_change = true,
	},
	keymaps = {
		["L"] = { "actions.select", mode = "n" },
		["H"] = { "actions.parent", mode = "n" },
		["q"] = { "actions.close", mode = "n" },
		["<C-r>"] = { "actions.refresh", mode = "n" },
		["<C-y>"] = { "actions.yank_entry", mode = "n" },
		["\\"] = { "actions.select", opts = { horizontal = true } },
		["|"] = { "actions.select", opts = { vertical = true } },
	},
})

vim.keymap.set("n", "-", "<cmd>Oil<cr>")
