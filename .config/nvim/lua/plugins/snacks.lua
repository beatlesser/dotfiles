vim.pack.add({
	{ src = "https://github.com/folke/snacks.nvim" },
})

local logo = [[
███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
]]

require("snacks").setup({
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
	notifier = { enabled = true, timeout = 2000 },
	picker = {},
	image = { doc = { enabled = false } },
})

vim.keymap.set("n", "<leader>ff", Snacks.picker.smart, { desc = "smart find file" })
vim.keymap.set("n", "<leader>fo", Snacks.picker.recent, { desc = "find recent file" })
vim.keymap.set("n", "<leader>fw", Snacks.picker.grep, { desc = "find file content" })
vim.keymap.set("n", "<leader>fm", Snacks.picker.marks, { desc = "find marks" })
vim.keymap.set("n", "<leader>fh", function()
	Snacks.picker.help({ layout = "dropdown" })
end, { desc = "find in help" })
vim.keymap.set("n", "<leader>fn", function()
	Snacks.picker.notifications({ layout = "dropdown" })
end, { desc = "find notifications" })
