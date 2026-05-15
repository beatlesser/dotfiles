return {
	"stevearc/conform.nvim",
	event = { "BufReadPost", "BufNewFile" },
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			go = { "goimports", "gofmt" },
			rust = { "rustfmt", lsp_format = "fallback" },
			zig = { "zigfmt" },
			python = { "ruff" },
		},
		format_on_save = {
			timeout_ms = 500,
			lsp_format = "fallback",
		},
	},
}
