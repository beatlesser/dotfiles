return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	opts = {
		flavour = "mocha",
		term_colors = true,
		integrations = {
			blink_cmp = { style = "bordered" },
			mason = true,
			lualiine = true,
		},
		config = function(_, opts)
			require("catppuccin").setup(opts)
			vim.cmd("colorscheme catppuccin")
			vim.cmd.hi("statusline guibg=NONE")
			vim.cmd.hi("Comment gui=none")
		end,
	},
}
