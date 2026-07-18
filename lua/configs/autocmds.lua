vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function() vim.hl.on_yank() end,
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'neo-tree',
  callback = function()
    -- Set the buffer to be unlisted
    vim.opt_local.buflisted = false
  end,
  desc = 'Prevent neo-tree from appearing in the buffer list',
})

vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  pattern = '*.py',
  callback = function()
    vim.bo.filetype = 'python'
    pcall(vim.treesitter.start)
  end,
  group = vim.api.nvim_create_augroup('python-filetype-fix', { clear = true }),
  desc = 'Force filetype of python file',
})

vim.api.nvim_create_autocmd('User', {
  pattern = 'GitConflictDetected',
  callback = function()
    vim.notify('Conflict detected in ' .. vim.fn.expand '<afile>')
    vim.keymap.set('n', 'cww', function()
      engage.conflict_buster()
      create_buffer_local_mappings()
    end)
  end,
})
