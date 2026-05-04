local lsp_list = {
	"lua_ls",
	"ty",
	"zls",
	"gopls",
	"rust_analyzer",
	"oxlint",
	"bashls",
	"markdown_oxide",
}

for _, lsp in ipairs(lsp_list) do
	vim.lsp.enable(lsp)
end

vim.diagnostic.config({ virtual_text = true })
