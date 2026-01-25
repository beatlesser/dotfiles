vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "highlight copying text",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank({ timeout = 100 })
	end,
})

vim.api.nvim_create_autocmd("LspProgress", {
	---@param ev {data: {client_id: integer, params: lsp.ProgressParams}}
	callback = function(ev)
		local spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
		vim.notify(vim.lsp.status(), vim.log.levels.INFO, {
			id = "lsp_progress",
			title = "LSP Progress",
			opts = function(notif)
				notif.icon = ev.data.params.value.kind == "end" and " "
					or spinner[math.floor(vim.uv.hrtime() / (1e6 * 80)) % #spinner + 1]
			end,
		})
	end,
})

vim.api.nvim_create_user_command("Packdel", function(args)
	local plugins = args.fargs
	if #plugins then
		vim.pack.del(plugins, { force = true })
		return
	end
	local non_active_plugins = vim.iter(vim.pack.get())
		:filter(function(x)
			return not x.active
		end)
		:map(function(x)
			return x.spec.name
		end)
		:totable()
	vim.pack.del(non_active_plugins)
end, {
	desc = "Delete The Specified Plugins",
	nargs = "*",
	complete = function(arglead)
		return vim.iter(vim.pack.get())
			:map(function(p)
				return p.spec.name
			end)
			:filter(function(name)
				return name:find("^" .. vim.pesc(arglead))
			end)
			:totable()
	end,
})
