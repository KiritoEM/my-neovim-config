return {
  'rebelot/kanagawa.nvim',
  priority = 1000,
  config   = function()
    vim.o.winblend  = 0
    vim.o.pumblend  = 0

    require('kanagawa').setup {
      compile = false,
      transparent    = true,
      terminalColors = true,
      styles = { comments = { italic = false } },
      colors = {
        theme = {
          all = {
            ui = {
              bg_gutter = 'none', 
            }
          }
        }
     },
      overrides = function(colors)
        local theme = colors.theme
        return {
          NormalFloat = { bg = 'none' },
          FloatBorder = { bg = 'none', fg = theme.ui.shade0 },
          FloatTitle = { bg = 'none' },
          NoiceCmdlinePopup        = { bg = 'none' },
          NoiceCmdlinePopupBorder  = { bg = 'none', fg = theme.ui.shade0 },
          NoiceCmdlinePopupTitle   = { bg = 'none' },
          NoiceCmdlineIcon         = { bg = 'none' },     
          NoicePopup               = { bg = 'none' },
          NoicePopupBorder         = { bg = 'none', fg = theme.ui.shade0 },
          NoiceConfirm             = { bg = 'none' },
          NoiceConfirmBorder       = { bg = 'none', fg = theme.ui.shade0 },
          NoiceMini                = { bg = 'none' },
          NotifyBackground   = { bg = theme.ui.bg },
          NotifyERRORBody    = { bg = 'none' },
          NotifyWARNBody     = { bg = 'none' },
          NotifyINFOBody     = { bg = 'none' },
          NotifyDEBUGBody    = { bg = 'none' },
          NotifyTRACEBody    = { bg = 'none' },
          NotifyERRORBorder  = { bg = 'none', fg = theme.diag.error },
          NotifyWARNBorder   = { bg = 'none', fg = theme.diag.warning },
          NotifyINFOBorder   = { bg = 'none', fg = theme.diag.info },
          NotifyDEBUGBorder  = { bg = 'none' },
          NotifyTRACEBorder  = { bg = 'none' },
          Pmenu      = { fg = theme.ui.shade0, bg = 'none' },
          PmenuSel   = { fg = 'NONE', bg = theme.ui.bg_p2 },
          PmenuSbar  = { bg = 'none' },
          PmenuThumb = { bg = theme.ui.shade0 },
          LspFloatWinNormal  = { bg = 'none' },
          LspFloatWinBorder  = { bg = 'none', fg = theme.ui.shade0 },
          DiagnosticFloatingError = { bg = 'none' },
          DiagnosticFloatingWarn  = { bg = 'none' },
          DiagnosticFloatingInfo  = { bg = 'none' },
          DiagnosticFloatingHint  = { bg = 'none' },
          TelescopeTitle         = { fg = theme.ui.special, bold = true },
          TelescopePromptNormal  = { bg = theme.ui.bg_p1 },
          TelescopePromptBorder  = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
          TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
          TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
          TelescopePreviewNormal = { bg = theme.ui.bg_dim },
          TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },
          NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },
          LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
          MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
          FloatermBorder = { bg = 'none', fg = theme.ui.shade0 }, 
          }
      end,
    }
    vim.cmd.colorscheme 'kanagawa'
  end,
}
