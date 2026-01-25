local lsp_enable_list = {
	"lua_ls",
	"ty",
	"rust_analyzer",
	"bashls",
	"markdown_oxide",
}

for _, lsp in ipairs(lsp_enable_list) do
	vim.lsp.enable(lsp)
end

vim.diagnostic.config({ virtual_text = true })
