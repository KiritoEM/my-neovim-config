return {
  'nvimdev/dashboard-nvim',
  event        = 'VimEnter',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config       = function()
    require('dashboard').setup {
      theme  = 'doom',
      config = {
       header = {
          '                                                       ',
          '            ░░░░░░░░░░░░░░░░░░░░░░░░░                 ',
          '          ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░               ',
          '        ░░░░░░  ░░░░░░░░░░░░░░░░  ░░░░░░              ',
          '       ░░░░░░    ░░░░░░░░░░░░░░    ░░░░░░             ',
          '      ░░░░░░  ░░  ░░░░░░░░░░░░  ░░  ░░░░░            ',
          '      ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░            ',
          '      ░░░░░░  ░░  ░░  ░░  ░░  ░░  ░░░░░░░            ',
          '      ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░            ',
          '       ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░             ',
          '         ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░               ',
          '                                                       ',
          '                 [ Bienvenue KiritoEM ]                    ',       
          '                                                        ',
          '                                                        ',
        },
        center = {
          {
            icon = '  ',
            icon_hl = 'DashboardIcon',
            desc = 'New file          ',
            desc_hl = 'DashboardDesc',
            key = 'n',
            key_hl = 'DashboardKey',
            key_format = ' %s',
            action = 'ene | startinsert',
          },
          {
            icon = '󰈞  ', 
            icon_hl = 'DashboardIcon',
            desc = 'Find file         ',
            desc_hl = 'DashboardDesc',
            key = 'f',
            key_hl = 'DashboardKey',
            key_format = ' %s',
            action = 'Telescope find_files',
          },
          {
            icon = '󰋚  ',
            icon_hl = 'DashboardIcon',
            desc = 'Recent files      ',
            desc_hl = 'DashboardDesc',
            key = 'r',
            key_hl = 'DashboardKey',
            key_format = ' %s',
            action = 'Telescope oldfiles',
          },
          {
            icon = '  ',
            icon_hl = 'DashboardIcon',
            desc = 'Find text         ',
            desc_hl = 'DashboardDesc',
            key = 't',
            key_hl = 'DashboardKey',
            key_format = ' %s',
            action = 'Telescope live_grep',
          },
          {
            icon = '  ', 
            icon_hl = 'DashboardIcon',
            desc = 'Neovim config     ',
            desc_hl = 'DashboardDesc',
            key = 'c',
            key_hl = 'DashboardKey',
            key_format = ' %s',
            action = 'e $MYVIMRC',
          },
          {
            icon = '󰒲  ',
            icon_hl = 'DashboardIcon',
            desc = 'Lazy              ',
            desc_hl = 'DashboardDesc',
            key = 'l',
            key_hl = 'DashboardKey',
            key_format = ' %s',
            action = 'Lazy',
          },
          {
            icon = '󰐥  ',
            icon_hl = 'DashboardIcon',
            desc = 'Quit NVIM         ',
            desc_hl = 'DashboardDesc',
            key = 'q',
            key_hl = 'DashboardKey',
            key_format = ' %s',
            action = 'qa',
          },
        },
        footer = function()
          local stats = require('lazy').stats()
          return { '', '⚡ Neovim loaded ' .. stats.loaded .. '/' .. stats.count .. ' plugins in ' .. math.floor(stats.startuptime) .. 'ms' }
        end,
      },
    }

    vim.api.nvim_set_hl(0, 'DashboardHeader', { fg = '#5896e9', bold = true })
    vim.api.nvim_set_hl(0, 'DashboardIcon',   { fg = '#7fb4ca' })
    vim.api.nvim_set_hl(0, 'DashboardDesc',   { fg = '#e7eceb' })
    vim.api.nvim_set_hl(0, 'DashboardKey',    { fg = '#e46876', bold = true })
    vim.api.nvim_set_hl(0, 'DashboardFooter', { fg = '#7fb4ca', italic = true })
  end,
}