return {
  {
    'Exafunction/codeium.vim',
    event = 'InsertEnter',
    config = function()
      vim.g.codeium_disable_bindings = 1
      vim.keymap.set('i', '<Tab>', function() return vim.fn['codeium#Accept']() end, { expr = true })
      vim.keymap.set('i', '<C-]>', function() return vim.fn['codeium#Clear']() end, { expr = true })
    end,
    build = ':Codeium Auth',
  },
}
