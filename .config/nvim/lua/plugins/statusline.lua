-- Status Line
-- if true then return {} end --WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE
local StatusLine = {
    'nvim-lualine/lualine.nvim',
    dependencies = {
        'nvim-tree/nvim-web-devicons',
    },
    event = 'VeryLazy',
    opts = {
	extensions = {'neo-tree','lazy','mason'}
    },
}


return StatusLine
