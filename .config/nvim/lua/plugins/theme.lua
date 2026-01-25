vim.pack.add({
	"https://github.com/catppuccin/nvim",
})

require("catppuccin").setup({
	flavour = "mocha",
	term_colors = true,
	integrations = {
		blink_cmp = { style = "bordered" },
		mason = true,
		noice = true,
		lualiine = true,
	},
})

vim.cmd("colorscheme catppuccin")
vim.cmd.hi("statusline guibg=NONE")
vim.cmd.hi("Comment gui=none")
