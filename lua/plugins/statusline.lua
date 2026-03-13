return {
  'rebelot/heirline.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    'lewis6991/gitsigns.nvim',
  },
  event = 'UiEnter',
  config = function()
    local conditions = require('heirline.conditions')
    local utils      = require('heirline.utils')
    local devicons   = require('nvim-web-devicons')

    local colors = require('kanagawa.colors').setup()
    local t      = colors.theme
    local p      = colors.palette

    require('heirline').load_colors({
      bg        = t.ui.bg,
      bg_dim    = t.ui.bg_dim,
      fg        = t.ui.fg,
      blue      = p.crystalBlue,
      cyan      = p.waveAqua2,
      green     = p.springGreen,
      yellow    = p.carpYellow,
      orange    = p.surimiOrange,
      red       = p.peachRed,
      purple    = p.oniViolet,
      diag_warn = t.diag.warning,
      diag_err  = t.diag.error,
      diag_hint = t.diag.hint,
      diag_info = t.diag.info,
      git_add   = t.vcs.added,
      git_del   = t.vcs.removed,
      git_chg   = t.vcs.changed,
    })

    local Align = { provider = '%=' }
    local Space = { provider = ' ' }

    local ViMode = {
      init = function(self) self.mode = vim.fn.mode(1) end,
      static = {
        mode_names = {
          n = 'NORMAL', i = 'INSERT', v = 'VISUAL', V = 'V-LINE',
          ['\22'] = 'V-BLOCK', c = 'COMMAND', R = 'REPLACE', t = 'TERM',
        },
        mode_colors = {
          n = 'blue', i = 'green', v = 'purple', V = 'purple',
          ['\22'] = 'cyan', c = 'orange', R = 'red', t = 'green',
        },
      },
      provider = function(self)
        return '  ' .. (self.mode_names[self.mode] or self.mode) .. ' '
      end,
      hl = function(self)
        local m = self.mode:sub(1, 1)
        return { fg = 'bg', bg = self.mode_colors[m] or 'blue', bold = true }
      end,
      update = { 'ModeChanged', pattern = '*:*' },
    }

    local FileName = {
        provider = function()
            local name = vim.api.nvim_buf_get_name(0)
            if name == '' then return ' [No Name] ' end
            local rel = vim.fn.fnamemodify(name, ':~:.')
            return ' ' .. rel .. ' '
        end,
        hl = { fg = 'fg', bold = true },
}

    local FileBlock = { FileName }

    local Ruler = {
      provider = ' %l:%c ',
      hl       = { fg = 'cyan' },
    }

    local Diagnostics = {
        condition = conditions.has_diagnostics,
        update    = { 'DiagnosticChanged', 'BufEnter' },
        init = function(self)
            self.errors   = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
            self.warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
        end,
        {
            provider = function(self)
            return self.errors > 0 and ('  ' .. self.errors .. ' ') or ''
            end,
            hl = { fg = 'diag_err' },
        },
        {
            provider = function(self)
            return self.warnings > 0 and ('  ' .. self.warnings .. ' ') or ''
            end,
            hl = { fg = 'diag_warn' },
        },
        {
            provider = function(self)
            return self.info > 0 and ("  " .. self.info .. " ") or ""
            end,
            hl = { fg = "diag_info" },
        },
    }

    local Git = {
      condition = conditions.is_git_repo,
      update    = { 'User', pattern = 'GitSignsUpdate', callback = vim.schedule_wrap(function()
        vim.cmd('redrawstatus')
      end) },
      init = function(self)
        self.status_dict = vim.b.gitsigns_status_dict
        self.has_changes = self.status_dict.added   ~= 0
                        or self.status_dict.removed ~= 0
                        or self.status_dict.changed ~= 0
      end,
      {
        provider = function(self)
          return ' ' .. self.status_dict.head .. ' '
        end,
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
            local ext  = vim.fn.fnamemodify(name, ':e')
            self.icon, self.icon_color = devicons.get_icon_color(name, ext, { default = true })
        end,
        provider = function(self)
            local ft = vim.bo.filetype
            if ft == '' then return '' end
            return ' ' .. (self.icon or '') .. ' ' .. ft .. ' '
        end,
        hl = function(self)

        return { fg = self.icon_color, bold = true }
  end,
    }


    require('heirline').setup({
      statusline = {
        hl = { bg = 'bg_dim' },
        ViMode,
        Space, 
        FileBlock,
        Align,
        Git, Space, 
        Diagnostics,
        Space,
        Ruler,
        FileType
      },
    })

    vim.api.nvim_create_autocmd('ColorScheme', {
      group    = vim.api.nvim_create_augroup('Heirline', { clear = true }),
      callback = function()
        utils.on_colorscheme(require('kanagawa.colors').setup())
      end,
    })
  end,
}