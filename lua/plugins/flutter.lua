return {
  {
    'nvim-flutter/flutter-tools.nvim',
    lazy = false,
    dependencies = {
      'nvim-lua/plenary.nvim',
      'stevearc/dressing.nvim',
    },
    config = function()
      require('flutter-tools').setup {
        flutter_path = nil,
        widget_guides = {
          enabled = true,
        },
        closing_tags = {
          highlight = 'Comment',
          prefix = '// ',
          enabled = true,
        },
        lsp = {
          settings = {
            showTodos = true,
            completeFunctionCalls = true,
            updateImportsOnRename = true,
            enableSnippets = true,
            analysisExcludedFolders = {
              vim.fn.expand '$HOME/.pub-cache',
            },
          },
        },
        decorations = {
          statusline = {
            app_version = true,
            device = true,
          },
        },
        debugger = {
          enabled = true,
          run_via_dap = true,
        },
      }
    end,

    keys = {
      { '<leader>Fr', '<cmd>FlutterRun<cr>', desc = 'Flutter Run' },
      { '<leader>Fq', '<cmd>FlutterQuit<cr>', desc = 'Flutter Quit' },
      { '<leader>FR', '<cmd>FlutterRestart<cr>', desc = 'Flutter Restart' },
      { '<leader>Fh', '<cmd>FlutterReload<cr>', desc = 'Flutter Hot Reload' },
      { '<leader>Fd', '<cmd>FlutterDevices<cr>', desc = 'Flutter Devices' },
      { '<leader>Fe', '<cmd>FlutterEmulators<cr>', desc = 'Flutter Emulators' },
      { '<leader>Fo', '<cmd>FlutterOutlineToggle<cr>', desc = 'Flutter Outline' },
      { '<leader>FL', '<cmd>FlutterLspRestart<cr>', desc = 'Flutter LSP Restart' },
    },
  },
}
