vim.pack.add({
	{ src = "https://github.com/MeanderingProgrammer/render-markdown.nvim" },
})

require("render-markdown").setup({
	completions = { lsp = { enabled = true } },
})

vim.keymap.set("n", "<leader>mp", "<cmd>RenderMarkdown toggle<cr>", { desc = "Toggle Markdown Preview" })
