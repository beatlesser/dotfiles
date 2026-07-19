return {
	"MeanderingProgrammer/render-markdown.nvim",
	keys = {
		{ "<leader>mp", "<cmd>RenderMarkdown toggle<cr>", desc = "Toggle Markdown Preview" },
	},
	opts = {
		completions = { lsp = { enabled = true } },
	},
}
