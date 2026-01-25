vim.pack.add({
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
})
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	group = vim.api.nvim_create_augroup("Setup Treesitter", { clear = true }),
	once = true,
	callback = function()
		require("nvim-treesitter").setup({
			ensure_installed = { "lua", "python", "json", "vim", "markdown", "rust", "zig", "c" },
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
})
