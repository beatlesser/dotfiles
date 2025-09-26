-- Load user defined settings after Lazy initialization
vim.api.nvim_create_autocmd('User', {
	pattern = 'LazyVimStarted',
	callback = function()
            vim.schedule(function()
                require('configs.options').apply()
                require('configs.keymaps').apply()
                require('configs.autocmds').apply()
            end)
	end
})
--Before lazy load
require('configs.preload').apply()
--Setup lazy.vim
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.uv.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({ { import = 'plugins' } }, { ui = { icons = {}, border = 'rounded' } })
