return {
  'folke/noice.nvim',
  event = 'UIEnter',
  dependencies = {
    'MunifTanjim/nui.nvim',
    'rcarriga/nvim-notify',
  },
  opts = {
    views = {
      mini = {
        win_options = { winblend = 0 },
      },
      cmdline_popup = {
        win_options = { winblend = 0 },
      },
      popupmenu = {
        win_options = { winblend = 0 },
      },
      hover = {                              
        win_options = { winblend = 0 },
      },
      notify = {
        backend = 'notify',
        fallback = 'mini',
        format = 'notify',
        replace = false,
        merge = false,
      },
   },
    cmdline = {
        enabled = true,
        view = 'cmdline_popup',
    },
    lsp = {
      hover = { enabled = true },        
      signature = { enabled = true },
      override = {
        ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
        ['vim.lsp.util.stylize_markdown'] = true,
        ['cmp.entry.get_documentation'] = false, 
      }
    },
    presets = {
        command_palette       = true,
        long_message_to_split = true, 
        lsp_doc_border        = true, 
    },
    routes = {
        { filter = { event = 'msg_show', kind = '', find = 'written' }, opts = { skip = true } }, 
        { filter = { event = 'msg_show', kind = 'search_count' }, opts = { skip = true } }, 
        { filter = { event = 'msg_show', find = 'yanked' }, opts = { skip = true } }, 
        { filter = { event = 'notify', find = 'No information available' }, opts = { skip = true } },
    },
  },
}