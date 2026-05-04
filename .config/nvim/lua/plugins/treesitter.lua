return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPost", "BufNewFile" },
	opts = {
		ensure_installed = { "lua", "python", "json", "vim", "markdown", "rust", "zig", "c" },
		highlight = { enable = true },
		indent = { enable = true },
	},
}
