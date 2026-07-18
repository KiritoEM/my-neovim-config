return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',
  ---@diagnostic disable-next-line: missing-fields
  opts = {
    ensure_installed = {
      'bash',
      'c',
      'diff',
      'html',
      'lua',
      'luadoc',
      'markdown',
      'markdown_inline',
      'query',
      'vim',
      'vimdoc',
      'typescript',
      'tsx',
      'javascript',
      'jsdoc',
      'python',
      'rust',
      'toml',
      'dart',
      'css',
      'json',
      'jsonc',
      'yaml',
      'php',
      'c_sharp',
      'java',
    },
    auto_install = true,
    highlight = { enable = true, additional_vim_regex_highlighting = false },
    indent = { enable = true },
  },
  config = function(_, opts)
    vim.env.CC = 'gcc'
    vim.env.PATH = 'C:\\msys64\\mingw64\\bin;' .. vim.env.PATH
    require('nvim-treesitter.install').compilers = { 'gcc' }
    require('nvim-treesitter.install').prefer_git = false
    require('nvim-treesitter').setup(opts)
  end,
}
