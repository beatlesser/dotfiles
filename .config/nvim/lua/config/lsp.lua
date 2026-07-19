local lsp_list = {
	"shuck",
	"lua_ls",
	"pyrefly",
	"gopls",
	"rust_analyzer",
	"zls",
	"tinymist",
	"markdown_oxide",
}

for _, lsp in ipairs(lsp_list) do
	vim.lsp.enable(lsp)
end

vim.diagnostic.config({
	virtual_text = true,
	virtual_lines = false,
	float = { source = true },
})

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("LSP-Setup", {}),
	callback = function(event)
		local client = assert(vim.lsp.get_client_by_id(event.data.client_id))

		if client and client:supports_method("textDocument/foldingRange") then
			local win = vim.api.nvim_get_current_win()
			vim.wo[win][0].foldexpr = "v:lua.vim.lsp.foldexpr()"
		end

		if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
			vim.keymap.set("n", "<leader>th", function()
				vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
			end, { buffer = event.buf, desc = "LSP: Toggle Inlay Hints" })
		end

		vim.keymap.set("n", "gh", function()
			vim.lsp.buf.hover({ silent = true })
		end, { buf = event.buf, desc = "Display Float Definition" })

		vim.keymap.set("n", "gd", function()
			local params = vim.lsp.util.make_position_params(0, "utf-8")
			vim.lsp.buf_request(0, "textDocument/definition", params, function(_, result, _, _)
				if not result or vim.tbl_isempty(result) then
					vim.notify("No definition found", vim.log.levels.INFO)
				else
					Snacks.picker.lsp_definition()
				end
			end)
		end, { buffer = event.buf, desc = "LSP: Goto Definition" })
		vim.keymap.set("n", "gD", function()
			local params = vim.lsp.util.make_position_params(0, "utf-8")
			vim.lsp.buf_request(0, "textDocument/declaration", params, function(_, result, _, _)
				if not result or vim.tbl_isempty(result) then
					vim.notify("No declaration found", vim.log.levels.INFO)
				else
					Snacks.picker.lsp_declaration()
				end
			end)
		end, { buffer = event.buf, desc = "LSP: Goto Declaration" })

		if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
			local highlight_augroup = vim.api.nvim_create_augroup("LSP-Hightlight", { clear = false })
			vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
				buffer = event.buf,
				group = highlight_augroup,
				callback = vim.lsp.buf.document_highlight,
			})

			vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
				buffer = event.buf,
				group = highlight_augroup,
				callback = vim.lsp.buf.clear_references,
			})

			vim.api.nvim_create_autocmd("LspDetach", {
				group = vim.api.nvim_create_augroup("LSP-Detach", { clear = true }),
				callback = function(event2)
					vim.lsp.buf.clear_references()
					vim.api.nvim_clear_autocmds({ group = "LSP-Hightlight", buffer = event2.buf })
				end,
			})
		end
	end,
})
