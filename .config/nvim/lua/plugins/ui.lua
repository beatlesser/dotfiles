return {
	{
		"nvim-lualine/lualine.nvim",
		event = "UIEnter",
		opts = {
			options = {
				disabled_filetypes = {
					statusline = { "snacks_dashboard" },
				},
			},
		},
	},
	{ "rebelot/heirline.nvim", enabled = false, event = "UIEnter", opts = {} },
}
