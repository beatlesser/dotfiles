-- Diagnostics config

local DiagnosticConfig = {}

DiagnosticConfig.apply = function()
    -- diagnostic info
    vim.diagnostic.config {
    -- virtual_lines = { current_line = true },
      virtual_text = {
        spacing = 5,
        prefix = '◍ ',
      },
      float = { severity_sort = true },
      severity_sort = true,
      signs = {
        text = {
          -- [vim.diagnostic.severity.ERROR] = '',
          [vim.diagnostic.severity.ERROR] = '',
          [vim.diagnostic.severity.WARN] = '',
          [vim.diagnostic.severity.INFO] = '',
          [vim.diagnostic.severity.HINT] = '',
        },
        numhl = {
          [vim.diagnostic.severity.ERROR] = 'DiagnosticError',
          [vim.diagnostic.severity.WARN] = 'DiagnosticWarning',
          [vim.diagnostic.severity.INFO] = 'DiagnosticInfo',
          [vim.diagnostic.severity.HINT] = 'DiagnosticHint',
        },
      },
    }
end

return DiagnosticConfig
