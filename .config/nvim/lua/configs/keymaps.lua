local Keymaps = {}

function Keymaps.apply() 
	--vim.keymap.set('i', 'jk', '<esc>', { desc = 'better escape', noremap = true })
    --resize window
    vim.keymap.set('n', '<C-Left>', '<cmd>SmartResizeLeft<cr>', { noremap = true, silent = true })
    vim.keymap.set('n', '<C-Right>', '<cmd>SmartResizeRight<cr>', { noremap = true, silent = true })
    vim.keymap.set('n', '<C-Up>', '<cmd>SmartResizeUp<cr>', { noremap = true, silent = true })
    vim.keymap.set('n', '<C-Down>', '<cmd>SmartResizeDown<cr>', { noremap = true, silent = true })
    --buffer switch
	vim.keymap.set('n', '<C-h>', '<cmd>SmartCursorMoveLeft<cr>', { desc = 'Move to left window', noremap = true, silent = true })
	vim.keymap.set('n', '<C-j>', '<cmd>SmartCursorMoveDown<cr>', { desc = 'Move to below window', noremap = true, silent = true })
	vim.keymap.set('n', '<C-k>', '<cmd>SmartCursorMoveUp<cr>', { desc = 'Move to above window', noremap = true, silent = true })
	vim.keymap.set('n', '<C-l>', '<cmd>SmartCursorMoveRight<cr>', { desc = 'Move to right window', noremap = true, silent = true })
	vim.keymap.set('n', 'H', '<cmd>bp<cr>', { desc = 'Move to prev buffer', noremap = true, silent = true })
	vim.keymap.set('n', 'L', '<cmd>bn<cr>', { desc = 'Move to next buffer', noremap = true, silent = true })
    -- fuzzy search related
    vim.keymap.set('n', '<Leader>ff', '<cmd>Telescope find_files<cr>', { desc = 'Find Files', noremap = true, silent = true })
    vim.keymap.set('n', '<Leader>fo', '<cmd>Telescope oldfiles<cr>', { desc = 'Find Recent Files', noremap = true, silent = true })
    vim.keymap.set('n', '<Leader>fw', '<cmd>Telescope live_grep<cr>', { desc = 'Find Word', noremap = true, silent = true })
    vim.keymap.set('n', '<Leader>fb', '<cmd>Telescope buffers<cr>', { desc = 'Find Buffer', noremap = true, silent = true })
    vim.keymap.set('n', '<Leader>fd', '<cmd>Telescope diagnostics<cr>', { desc = 'Find Diagnostics', noremap = true, silent = true })
    vim.keymap.set('n', '<Leader>fs', '<cmd>Telescope lsp_dynamic_workspace_symbols<cr>', { desc = 'Find Workspace Symbols', noremap = true, silent = true })
    --git search related
    vim.keymap.set('n', '<Leader>fg', '<cmd>Telescope git_status<cr>', { desc = 'Find Git Status', noremap = true, silent = true })


    vim.keymap.set({ 'n', 'v' }, 'j', 'gj', { noremap = true, silent = true })
    vim.keymap.set({ 'n', 'v' }, 'k', 'gk', { noremap = true, silent = true })

    --explorer related
	vim.keymap.set('n', '<Leader>bc', '<cmd>bp | bd #<cr>', { desc = 'Close Current Buffer', noremap = true, silent = true })
	vim.keymap.set('n', '<leader>e', '<cmd>Neotree toggle<cr>', {
        desc = 'Toggle NeoTree file explorer',
        noremap = true,
        silent = true,
    })
    vim.keymap.set('n', '<esc>', '<cmd>nohlsearch<cr>', { silent = true })
end

return Keymaps
