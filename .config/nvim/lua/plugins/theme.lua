return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			flavour = "mocha",
			transparent_background = true,
			float = {
				transparent = true,
			},
		})
		vim.cmd("colorscheme catppuccin")
		vim.cmd.hi("statusline guibg=NONE")
		vim.cmd.hi("Comment gui=none")
	end,
}
