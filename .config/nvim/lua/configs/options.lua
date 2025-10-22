-- This file contains options, which is executed after lazy initialization
local Options = {}

Options.opt = {
    relativenumber = true, -- sets vim.opt.relativenumber
    spell = false, -- sets vim.opt.spell
    signcolumn = 'auto', -- sets vim.opt.signcolumn to auto
    wrap = false, -- sets vim.opt.wrap
    tabstop = 4,
    shiftwidth = 4,
    expandtab = true,
    smartindent = true,
    autoindent = true,
    cindent = true,
    clipboard = 'unnamedplus',
    termguicolors = true,
    wildmenu = true,
    ignorecase = true,
    undofile = true,
    undodir = vim.fn.stdpath 'state' .. '/undo',
    scrolloff = 5,
    virtualedit = 'block',
}

function Options.apply()
    vim.fn.mkdir(vim.opt.undodir:get()[1], 'p')

    for k, v in pairs(Options.opt) do
        vim.o[k] = v
    end
end

return Options
