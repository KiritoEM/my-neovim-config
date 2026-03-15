vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function() vim.hl.on_yank() end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "neo-tree",
  callback = function()
    -- Set the buffer to be unlisted
    vim.opt_local.buflisted = false
  end,
  desc = "Prevent neo-tree from appearing in the buffer list",
})

vim.api.nvim_create_autocmd('ColorScheme', {
  pattern = 'kanagawa*',
  callback = function()
    local ok, colors = pcall(require, 'kanagawa.colors')
    if not ok then return end
    local p = colors.setup().palette
    local t = colors.setup().theme

    vim.api.nvim_set_hl(0, 'Pmenu', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'PmenuSel', { bg = t.ui.bg_p1, bold = true })
    vim.api.nvim_set_hl(0, 'PmenuSbar', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'PmenuThumb', { bg = t.ui.bg_p2 })
    vim.api.nvim_set_hl(0, 'PmenuBorder', { fg = t.ui.shade0, bg = 'none' })
    vim.api.nvim_set_hl(0, 'CmpDocumentation', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'CmpDocumentationBorder', { fg = t.ui.shade0, bg = 'none' })
    vim.api.nvim_set_hl(0, 'CmpItemMenu', { fg = t.ui.shade0, italic = true })
    vim.api.nvim_set_hl(0, 'CmpItemAbbrMatch', { fg = p.springBlue, bold = true })
    vim.api.nvim_set_hl(0, 'CmpItemAbbrMatchFuzzy', { fg = p.springBlue, bold = true })
    vim.api.nvim_set_hl(0, 'CmpItemKindFunction', { fg = p.crystalBlue })
    vim.api.nvim_set_hl(0, 'CmpItemKindVariable', { fg = p.carpYellow })
    vim.api.nvim_set_hl(0, 'CmpItemKindKeyword', { fg = p.oniViolet })
    vim.api.nvim_set_hl(0, 'CmpItemKindSnippet', { fg = p.springGreen })
    vim.api.nvim_set_hl(0, 'CmpItemKindText', { fg = p.fujiWhite })
  end,
})
vim.cmd('doautocmd ColorScheme kanagawa')