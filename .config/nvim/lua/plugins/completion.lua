return {
  'saghen/blink.cmp',
  dependencies = { 'rafamadriz/friendly-snippets' },
  version = '1.*',
  event = { 'CmdlineEnter', 'BufReadPre', 'BufNewFile' },
  opts = {
    keymap = { preset = 'super-tab' },
    completion = { documentation = { auto_show = false } },
    sources = {
      default = { 'snippets','lsp', 'path', 'buffer' },
    },
    fuzzy = { implementation = "prefer_rust_with_warning" }
  },
  opts_extend = { "sources.default" }
}
