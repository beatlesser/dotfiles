local logo = [[
███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
]]

return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		dashboard = {
			enabled = true,
			sections = {
				{ section = "header" },
				{ section = "keys", gap = 1, padding = 1 },
			},
			preset = {
				header = logo,
				keys = {
					{ icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.picker.smart()" },
					{ icon = " ", key = "o", desc = "Recent Files", action = ":lua Snacks.picker.recent()" },
					{ icon = " ", key = "n", desc = "New File", action = ":enew" },
					{ icon = " ", key = "q", desc = "Quit", action = ":qa" },
				},
			},
		},
		notifier = { enabled = true },
		picker = {},
		image = { doc = { enabled = false } },
	},
	keys = {
		{
			"<leader>ff",
			function()
				Snacks.picker.smart()
			end,
			desc = "smart find file",
		},
		{
			"<leader>fo",
			function()
				Snacks.picker.recent()
			end,
			desc = "find recent file",
		},
		{
			"<leader>fw",
			function()
				Snacks.picker.grep()
			end,
			desc = "find file content",
		},
		{
			"<leader>fm",
			function()
				Snacks.picker.marks()
			end,
			desc = "find marks",
		},
		{
			"<leader>fh",
			function()
				Snacks.picker.help({ layout = "dropdown" })
			end,
			desc = "find in help",
		},
		{
			"<leader>fn",
			function()
				Snacks.picker.notifications({ layout = "dropdown" })
			end,
			desc = "find notifications",
		},
	},
}
