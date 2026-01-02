-- Flash: Enhance Search Motion

-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE
local Flash = {
	"folke/flash.nvim",
	event = { "BufReadPost", "BufNewFile" },
	---@type Flash.Config
	opts = {
		modes = {
			char = {
				jump_labels = true,
			},
		},
	},
	keys = {
		{
			"S",
			mode = { "n", "x", "o" },
			function()
				require("flash").treesitter()
			end,
			desc = "Flash Treesitter",
		},
		{
			"r",
			mode = "o",
			function()
				require("flash").remote()
			end,
			desc = "Remote Flash",
		},
		{
			"R",
			mode = { "o", "x" },
			function()
				require("flash").treesitter_search()
			end,
			desc = "Treesitter Search",
		},
		{
			"<leader>ts",
			mode = { "n" },
			function()
				require("flash").toggle()
			end,
			desc = "Toggle Flash Search",
		},
	},
}

return Flash
