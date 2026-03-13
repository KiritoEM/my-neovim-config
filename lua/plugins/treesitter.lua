return {
  'nvim-treesitter/nvim-treesitter',
  lazy   = false,
  build  = ':TSUpdate',
  branch = 'master',
  ---@diagnostic disable-next-line: missing-fields
  opts = {
    ensure_installed = {
      'bash', 'c', 'diff', 'html', 'lua', 'luadoc',
      'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc',
    },
    auto_install = true,
    highlight    = { enable = true, additional_vim_regex_highlighting = false },
    indent       = { enable = true },
  },
  config = function(_, opts)
    vim.env.CC = 'gcc'
    require('nvim-treesitter').setup(opts)
  end,
}