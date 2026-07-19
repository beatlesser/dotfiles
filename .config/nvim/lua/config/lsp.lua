local lsp_list = {
    "lua_ls",
    "pyrefly",
    "gopls",
    "rust_analyzer",
    "zls",
    "tsgo",
    "tinymist",
    "markdown_oxide",
}

for _, lsp in ipairs(lsp_list) do
    vim.lsp.enable(lsp)
end

vim.diagnostic.config({ virtual_text = true })
