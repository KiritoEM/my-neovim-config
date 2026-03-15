return {
  'folke/noice.nvim',
  event = 'VeryLazy',
  dependencies = {
    'MunifTanjim/nui.nvim',
    'rcarriga/nvim-notify',
  },
  opts = {
    cmdline = {
        enabled = true,
        view = 'cmdline_popup',
    },
    lsp = {
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