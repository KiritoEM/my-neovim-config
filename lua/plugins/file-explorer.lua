return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', 
    'MunifTanjim/nui.nvim',
  },
  lazy = false,
  keys = {
    { 
      '\\', ':Neotree reveal<CR>', 
      desc = 'NeoTree reveal', 
      silent = true 
    },
  },
  ---@module 'neo-tree'
  ---@type neotree.Config
  opts = {
    filesystem = {
    hide_hidden = false,
    follow_current_file = {
        enabled = true,
        leave_dirs_open = true,
    },
    window = {
        mappings = {
          ['\\'] = 'close_window',
        },
      },
    },
  }
}
