return {
  'voldikss/vim-floaterm',
   keys = {
    { '<c-t>', ':FloatermToggle<CR>', desc = 'Toggle floaterm' },
    { '<c-t>', '<C-\\><C-n>:FloatermToggle<CR>', mode = 't', desc = 'Toggle floaterm' },
    { '<c-n>', ':FloatermNew<CR>', desc = 'New floaterm' },
    { '<A->>  ', ':FloatermNext<CR>', mode = 't', desc = 'Next floaterm' },
    { '<A-<>', ':FloatermPrev<CR>', mode = 't', desc = 'Previous floaterm' },
  },
  config = function()
    vim.g.floaterm_width = 0.5
    vim.g.floaterm_height = 0.5
      vim.g.floaterm_wintype = 'float'
    vim.g.floaterm_position = 'bottomright'
    vim.g.floaterm_borderchars = '─│─│┌┐┘└'
      vim.g.floaterm_title = 'Terminal: $1/$2'
    vim.g.floaterm_titleposition = 'center'
    vim.g.floaterm_shell = 'powershell'
    vim.g.floaterm_opener = 'split'
    vim.g.floaterm_giteditor = true
    vim.g.floaterm_rootmarkers = { '.project', '.git', '.hg', '.svn', '.root' }
    vim.g.floaterm_winblend = 15
  end,
}