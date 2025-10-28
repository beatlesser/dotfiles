-- Format code

-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

local CodeFormatter = {
	"stevearc/conform.nvim",
	event = { "BufReadPost", "BufNewFile" },
	opts = {},

	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				go = { "goimports" },
				typescript = { "biome" },
				json = { "biome" },
				jsonc = { "biome" },
				nix = { "alejandra", "nixfmt", "nixpkgs-fmt" },
				xml = { "xmlformatter" },
				kdl = { "kdlfmt" },
			},
			format_on_save = {
				-- These options will be passed to conform.format()
				timeout_ms = 500,
				lsp_format = "fallback",
			},
		})

		local do_format = function()
			require("conform").format({ async = true, lsp_fallback = true })
		end

		vim.keymap.set("n", "<leader>lf", do_format, { desc = "Format Current Buffer", noremap = true, silent = true })

		vim.api.nvim_create_user_command("Format", do_format, { desc = "Format Current Buffer" })
	end,
}

return CodeFormatter
