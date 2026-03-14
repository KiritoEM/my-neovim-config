return {
  'rebelot/heirline.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    'lewis6991/gitsigns.nvim',
  },
  event = 'UiEnter',
  config = function()
    local conditions = require 'heirline.conditions'
    local utils = require 'heirline.utils'
    local devicons = require 'nvim-web-devicons'

    local colors = require('kanagawa.colors').setup()
    local t = colors.theme
    local p = colors.palette

    require('heirline').load_colors {
      bg = t.ui.bg,
      bg_dim = t.ui.bg_dim,
      fg = t.ui.fg,
      blue = p.crystalBlue,
      cyan = p.waveAqua2,
      green = p.springGreen,
      yellow = p.carpYellow,
      orange = p.surimiOrange,
      red = p.peachRed,
      purple = p.oniViolet,
      diag_warn = t.diag.warning,
      diag_err = t.diag.error,
      diag_hint = t.diag.hint,
      diag_info = t.diag.info,
      git_add = t.vcs.added,
      git_del = t.vcs.removed,
      git_chg = t.vcs.changed,
    }

    local Align = { provider = '%=' }
    local Space = { provider = ' ' }

    local ViMode = {
      init = function(self) 
        self.mode = vim.fn.mode(1) 
      end,

      static = {
        mode_names = {
          n = 'NORMAL',
          i = 'INSERT',
          v = 'VISUAL',
          V = 'V-LINE',
          ['\22'] = 'V-BLOCK',
          c = 'COMMAND',
          R = 'REPLACE',
          t = 'TERM',
        },
        mode_colors = {
          n = 'blue',
          i = 'green',
          v = 'purple',
          V = 'purple',
          ['\22'] = 'cyan',
          c = 'orange',
          R = 'red',
          t = 'green',
        },
      },
      {
        provider = function(self)
          return '  %2(' .. (self.mode_names[self.mode] or self.mode) .. '%) '
        end,
        hl = function(self)
          local m = self.mode:sub(1, 1)
          return { fg = 'bg', bg = self.mode_colors[m] or 'blue', bold = true }
        end
      },
      update = {
        'ModeChanged',
        pattern = '*:*',
        callback = vim.schedule_wrap(function() vim.cmd 'redrawstatus' end),
      },
    }

    local FileName = {
      init = function(self)
        self.name = vim.api.nvim_buf_get_name(0)
      end,

      provider = function(self)
        name = vim.fn.fnamemodify(self.name, ':.')
        if name == '' then return ' [No Name] ' end

        if not conditions.width_percent_below(#name, 0.35) then
            name = vim.fn.pathshorten(name)
        end

        return name
      end,
      hl = { fg = 'fg', bold = true },
    }
            
    local FileBlock = { FileName }

    local Ruler = {
      provider = ' (%l/%L):%c %P',
      hl = { fg = 'cyan' },
    }

    local ScrollBar = {
      static = {
        sbar = { '▁', '▂', '▃', '▄', '▅', '▆', '▇', '█' },
      },
      provider = function(self)
        local curr_line = vim.api.nvim_win_get_cursor(0)[1]
        local lines = vim.api.nvim_buf_line_count(0)
        local i = math.floor((curr_line - 1) / lines * #self.sbar) + 1
        return ' '..string.rep(self.sbar[i], 2)
      end,
      hl = { fg = 'blue', bg = 'bg_dim' },
    }

    local Diagnostics = {
      condition = conditions.has_diagnostics,
      update = { 'DiagnosticChanged', 'BufEnter' },

      init = function(self)
        local count = vim.diagnostic.count(0)
        self.errors   = count[vim.diagnostic.severity.ERROR] or 0
        self.warnings = count[vim.diagnostic.severity.WARN]  or 0
        self.hints    = count[vim.diagnostic.severity.HINT]  or 0
        self.info     = count[vim.diagnostic.severity.INFO]  or 0
      end,

      {
        provider = function(self)
          return self.errors > 0 and (' ' .. self.errors .. ' ') or ''
        end,
        hl = { fg = 'diag_err' },
      },
      {
        provider = function(self)
          return self.warnings > 0 and (' ' .. self.warnings .. ' ') or ''
        end,
        hl = { fg = 'diag_warn' },
      },
      {
        provider = function(self)
          return self.info > 0 and (' ' .. self.info .. ' ') or ''
        end,
        hl = { fg = 'diag_info' },
      },
      {
        provider = function(self)
          return self.hints > 0 and (' ' .. self.hints .. ' ') or ''
        end,
        hl = { fg = 'diag_hint' },
          },
    }

    local Git = {
      condition = conditions.is_git_repo,
      update = { 'User', pattern = 'GitSignsUpdate', callback = vim.schedule_wrap(function() vim.cmd 'redrawstatus' end) },

      init = function(self)
        self.status_dict = vim.b.gitsigns_status_dict
        self.has_changes = self.status_dict.added ~= 0 or self.status_dict.removed ~= 0 or self.status_dict.changed ~= 0
      end,

      {
        provider = function(self) return ' ' .. self.status_dict.head end,
        hl = { fg = 'orange', bold = true },
      },
      {
        condition = function(self) return self.has_changes end,
        {
          provider = function(self)
            local count = self.status_dict.added or 0
            return count > 0 and ('+' .. count .. ' ') or ''
          end,
          hl = { fg = 'git_add' },
        },
        {
          provider = function(self)
            local count = self.status_dict.removed or 0
            return count > 0 and ('-' .. count .. ' ') or ''
          end,
          hl = { fg = 'git_del' },
        },
        {
          provider = function(self)
            local count = self.status_dict.changed or 0
            return count > 0 and ('~' .. count .. ' ') or ''
          end,
          hl = { fg = 'git_chg' },
        },
      },
    }

    local FileType = {
      init = function(self)
        local name = vim.api.nvim_buf_get_name(0)
        local ext = vim.fn.fnamemodify(name, ':e')
        self.icon, self.icon_color = devicons.get_icon_color(name, ext, { default = true })
      end,
      provider = function(self)
        local ft = string.upper(vim.bo.filetype)
        if ft == '' then return '' end
        return (self.icon or '') .. ' ' .. ft
      end,
      hl = function(self)
        return { fg = self.icon_color, bold = true }
      end,
    }

    local FileEncoding = {
        provider = function()
            local enc = (vim.bo.fenc ~= '' and vim.bo.fenc) or vim.o.enc
            return enc:upper()
        end
    }

    local FileFlags = {
      {
        condition = function()
            return vim.bo.modified
        end,
        provider = '[+]',
        hl = { fg = "green" },
      },
      {
        condition = function()
            return not vim.bo.modifiable or vim.bo.readonly
        end,
        provider = '',
        hl = { fg = "orange" },
      },
    }

    local DateTime = {
      update = {
        'BufEnter',
        'User',
        pattern = 'HeirlineTimerUpdate',
        callback = vim.schedule_wrap(function() vim.cmd 'redrawstatus' end),
      },
      {
        provider = function()
          return ' ' .. os.date ' %H:%M' .. ' '
        end,
        hl = { fg = 'bg', bg = 'blue', bold = true },
      },
    }

    vim.loop.new_timer():start(
      (60 - os.date('%S')) * 1000, 
      60000,                      
      vim.schedule_wrap(function()
        vim.api.nvim_exec_autocmds('User', { pattern = 'HeirlineTimerUpdate' })
      end)
    )

    require('heirline').setup {
      statusline = {
        hl = { bg = 'bg_dim' },
        ViMode,
        Space,
        FileBlock,
        FileFlags,
        Align,
        Diagnostics,
        Space,
        Git,
        Space,
        FileType,
        Space,
        FileEncoding,
        Space,
        Ruler,
        ScrollBar,
        Space,
        Space,
        DateTime
      },
    }

    vim.api.nvim_create_autocmd('ColorScheme', {
      group = vim.api.nvim_create_augroup('Heirline', { clear = true }),
      callback = function()
        local new_colors = require('kanagawa.colors').setup()
        utils.on_colorscheme(function()
          return {
            bg      = new_colors.theme.ui.bg,
            bg_dim  = new_colors.theme.ui.bg_dim,
            fg      = new_colors.theme.ui.fg,
            blue    = new_colors.palette.crystalBlue,
            cyan    = new_colors.palette.waveAqua2,
            green   = new_colors.palette.springGreen,
            yellow  = new_colors.palette.carpYellow,
            orange  = new_colors.palette.surimiOrange,
            red     = new_colors.palette.peachRed,
            purple  = new_colors.palette.oniViolet,
            diag_warn  = new_colors.theme.diag.warning,
            diag_err   = new_colors.theme.diag.error,
            diag_hint  = new_colors.theme.diag.hint,
            diag_info  = new_colors.theme.diag.info,
            git_add    = new_colors.theme.vcs.added,
            git_del    = new_colors.theme.vcs.removed,
            git_chg    = new_colors.theme.vcs.changed,
          }
        end)
      end,
    })
  end,
}
