return {
  'rebelot/kanagawa.nvim',
  priority = 1000,
  config   = function()
    require('kanagawa').setup {
      transparent    = true,
      terminalColors = true,
      styles         = { comments = { italic = false } },
      overrides      = function(colors)
        local theme = colors.theme
        return {
          NormalFloat    = { bg = 'none' },
          FloatBorder    = { bg = 'none' },
          FloatTitle     = { bg = 'none' },
          Floaterm       = { bg = theme.ui.bg_dim },
          FloatermBorder = { bg = 'none' },
        }
      end,
    }
    vim.cmd.colorscheme 'kanagawa'
  end,
}