return {
  'saghen/blink.cmp',
  event    = 'VimEnter',
  version  = '1.*',
  dependencies = {
    {
      'L3MON4D3/LuaSnip',
      version = '2.*',
      build = (function()
        if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then return end
        return 'make install_jsregexp'
      end)(),
      opts = {},
    },
    'brenoprata10/nvim-highlight-colors',
  },

  opts = {
    keymap = {
      preset    = 'default',
      ['<Tab>']   = { 'select_next', 'snippet_forward',   'fallback' },
      ['<S-Tab>'] = { 'select_prev', 'snippet_backward',  'fallback' },
      ['<CR>']    = { 'accept',  'fallback' },
      ['<Esc>']   = { 'hide',    'fallback' },
      ['<c-e>']   = { 'show',    'fallback' },
    },

    sources  = { default = { 'lsp', 'path', 'snippets', 'buffer' } },
    snippets = { preset = 'luasnip' },
    fuzzy    = { implementation = 'lua' },
    signature = { enabled = true },
  },

  config = function(_, opts)
    require('nvim-highlight-colors').setup {
      render                    = 'virtual',
      virtual_symbol            = '■',
      virtual_symbol_suffix     = ' ',
      virtual_symbol_prefix     = '',
      virtual_symbol_position   = 'inline',
      enable_hex                = true,
      enable_short_hex          = true,
      enable_rgb                = true,
      enable_hsl                = true,
      enable_hsl_without_function = true,
      enable_var_usage          = true,
      enable_named_colors       = false,
      enable_tailwind           = false,
    }

    require('blink.cmp').setup(opts)
  end,
}
