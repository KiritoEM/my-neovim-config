return {
  -- {
  --   'nvimtools/none-ls.nvim',
  --   dependencies = {
  --     'nvim-lua/plenary.nvim',
  --     'nvimtools/none-ls-extras.nvim',
  --   },
  --   config = function()
  --     local null_ls = require('null-ls')
  --     null_ls.setup({
  --       sources = {
  --         require('none-ls.diagnostics.eslint').with({
  --           diagnostics_format = '[eslint] #{m}\n(#{c})',
  --         }),
  --         null_ls.builtins.diagnostics.fish,
  --       },
  --     })
  --   end,
  -- },
  {
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
      {
        '<leader>f',
        function() require('conform').format { async = true, lsp_format = 'never' } end,
        mode = '',
        desc = '[F]ormat buffer',
      },
    },
    opts = {
      log_level = vim.log.levels.DEBUG,
      notify_on_error = true,
      formatters = {
        prettierd = {
          command = 'prettierd.cmd',
        },
      },
      format_on_save = {
        timeout_ms = 1000,
        lsp_format = 'never',
      },
      formatters_by_ft = {
        lua = { 'stylua' },
        javascript = { 'prettierd', 'prettier', stop_after_first = true },
        typescript = { 'prettierd', 'prettier', stop_after_first = true },
        javascriptreact = { 'prettierd', 'prettier', stop_after_first = true },
        typescriptreact = { 'prettierd', 'prettier', stop_after_first = true },
        css = { 'prettierd', 'prettier', stop_after_first = true },
        html = { 'prettierd', 'prettier', stop_after_first = true },
        json = { 'prettierd', 'prettier', stop_after_first = true },
        markdown = { 'prettierd', 'prettier', stop_after_first = true },
        yaml = { 'prettierd', 'prettier', stop_after_first = true },
        cs = { 'csharpier' },
        fsharp = { 'fantomas' },
      },
    },
  },
}
