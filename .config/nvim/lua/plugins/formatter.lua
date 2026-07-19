return {
	"stevearc/conform.nvim",
	event = { "BufReadPost", "BufNewFile" },
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			go = { "gofmt" },
			rust = { "rustfmt" },
			zig = { "zigfmt" },
			python = { "ruff" },
			json = { "jq" },
			yaml = { "yamlfmt" },
			toml = { "taplo" },
		},
		format_on_save = {
			timeout_ms = 500,
			lsp_format = "fallback",
		},
	},
}
