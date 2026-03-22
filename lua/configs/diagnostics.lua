vim.diagnostic.config {
  update_in_insert = true,
  severity_sort    = true,
  float            = { border = 'rounded', source = 'if_many' },
  underline        = { severity = { min = vim.diagnostic.severity.WARN } },
  virtual_text     = {
    spacing = 4,
    prefix = '●'
  },
  virtual_lines    = false,
  jump             = { float = true },
}
