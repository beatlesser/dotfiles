-- This file contains options, which is executed after lazy initialization
local Options = {}

Options = {

	opt = {
        laststatus = 0,
		spell = false, -- sets vim.opt.spell
		signcolumn = "auto", -- sets vim.opt.signcolumn to auto
		wrap = false, -- sets vim.opt.wrap
		tabstop = 4,
		shiftwidth = 4,
		expandtab = true,
		smartindent = true,
		autoindent = true,
		cindent = true,
		clipboard = "unnamedplus",
		termguicolors = true,
		wildmenu = true,
		ignorecase = true,
		scrolloff = 5,
		virtualedit = "block",
	},
}

function Options.apply()
	for k, v in pairs(Options.opt) do
		vim.opt[k] = v
	end
end

return Options
