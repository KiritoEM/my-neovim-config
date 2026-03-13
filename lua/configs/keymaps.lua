local map = vim.keymap.set

-- Search
map('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'Clear search highlights' })

-- Diagnostics
map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic quickfix list' })

-- Terminal
map('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Window navigation
map('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
map('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
map('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
map('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Buffer Split
map('n', '<C-\\>', '<Cmd>vsplit<CR>', { desc = 'Split vertical' })

-- Todo comments
map('n', ']t', function() require('todo-comments').jump_next() end, { desc = 'Jump to next todo comment' })
map('n', '[t', function() require('todo-comments').jump_prev() end, { desc = 'Jump to previous todo comment' })

-- Barbar — tab navigation
map('n', '<A-,>', '<Cmd>BufferPrevious<CR>',          { desc = 'Go to previous tab' })
map('n', '<A-.>', '<Cmd>BufferNext<CR>',               { desc = 'Go to next tab' })
map('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>',       { desc = 'Move tab to the left' })
map('n', '<A->>', '<Cmd>BufferMoveNext<CR>',           { desc = 'Move tab to the right' })
map('n', '<A-1>', '<Cmd>BufferGoto 1<CR>',             { desc = 'Go to tab 1' })
map('n', '<A-2>', '<Cmd>BufferGoto 2<CR>',             { desc = 'Go to tab 2' })
map('n', '<A-3>', '<Cmd>BufferGoto 3<CR>',             { desc = 'Go to tab 3' })
map('n', '<A-4>', '<Cmd>BufferGoto 4<CR>',             { desc = 'Go to tab 4' })
map('n', '<A-5>', '<Cmd>BufferGoto 5<CR>',             { desc = 'Go to tab 5' })
map('n', '<A-6>', '<Cmd>BufferGoto 6<CR>',             { desc = 'Go to tab 6' })
map('n', '<A-7>', '<Cmd>BufferGoto 7<CR>',             { desc = 'Go to tab 7' })
map('n', '<A-8>', '<Cmd>BufferGoto 8<CR>',             { desc = 'Go to tab 8' })
map('n', '<A-9>', '<Cmd>BufferGoto 9<CR>',             { desc = 'Go to tab 9' })
map('n', '<A-0>', '<Cmd>BufferLast<CR>',               { desc = 'Go to last tab' })
map('n', '<A-p>', '<Cmd>BufferPin<CR>',                { desc = 'Pin/unpin current tab' })
map('n', '<A-c>', '<Cmd>BufferClose<CR>',              { desc = 'Close current tab' })
map('n', '<A-q>', '<Cmd>BufferCloseAllButCurrent<CR>', { desc = 'Close all tabs but current' })
map('n', '<C-p>', '<Cmd>BufferPick<CR>',               { desc = 'Pick a tab interactively' })

-- Barbar — sort
map('n', '<leader>bb', '<Cmd>BufferOrderByBufferNumber<CR>', { desc = 'Sort tabs by buffer number' })
map('n', '<leader>bn', '<Cmd>BufferOrderByName<CR>',         { desc = 'Sort tabs by name' })
map('n', '<leader>bd', '<Cmd>BufferOrderByDirectory<CR>',    { desc = 'Sort tabs by directory' })
map('n', '<leader>bl', '<Cmd>BufferOrderByLanguage<CR>',     { desc = 'Sort tabs by language' })

-- Lspsaga — hover
map('n', 'K',          '<cmd>Lspsaga hover_doc<CR>',        { desc = 'Hover doc' })
map('n', '<leader>K',  '<cmd>Lspsaga hover_doc ++keep<CR>', { desc = 'Hover doc (pin)' })

-- Lspsaga — finder
map('n', 'gh',         '<cmd>Lspsaga finder<CR>',             { desc = 'Finder: refs + impls' })
map('n', 'gH',         '<cmd>Lspsaga finder def+ref+imp<CR>', { desc = 'Finder: def + refs + impls' })

-- Lspsaga — definition
map('n', 'gd',         '<cmd>Lspsaga peek_definition<CR>',      { desc = 'Peek definition' })
map('n', 'gD',         '<cmd>Lspsaga goto_definition<CR>',      { desc = 'Go to definition' })
map('n', 'gt',         '<cmd>Lspsaga peek_type_definition<CR>', { desc = 'Peek type definition' })
map('n', 'gT',         '<cmd>Lspsaga goto_type_definition<CR>', { desc = 'Go to type definition' })

-- Lspsaga — diagnostic
map('n', ']e',         '<cmd>Lspsaga diagnostic_jump_next<CR>', { desc = 'Next diagnostic' })
map('n', '[e',         '<cmd>Lspsaga diagnostic_jump_prev<CR>', { desc = 'Prev diagnostic' })
map('n', ']E', function()
  require('lspsaga.diagnostic'):goto_next({ severity = vim.diagnostic.severity.ERROR })
end, { desc = 'Next error' })
map('n', '[E', function()
  require('lspsaga.diagnostic'):goto_prev({ severity = vim.diagnostic.severity.ERROR })
end, { desc = 'Prev error' })
map('n', '<leader>sl', '<cmd>Lspsaga show_line_diagnostics<CR>',      { desc = 'Show line diagnostics' })
map('n', '<leader>sb', '<cmd>Lspsaga show_buf_diagnostics<CR>',       { desc = 'Show buffer diagnostics' })
map('n', '<leader>sw', '<cmd>Lspsaga show_workspace_diagnostics<CR>', { desc = 'Show workspace diagnostics' })
map('n', '<leader>sc', '<cmd>Lspsaga show_cursor_diagnostics<CR>',    { desc = 'Show cursor diagnostics' })

-- Lspsaga — code action
map({ 'n', 'v' }, '<leader>ca', '<cmd>Lspsaga code_action<CR>', { desc = 'Code action' })

-- Lspsaga — rename
map('n', '<leader>rn', '<cmd>Lspsaga rename<CR>',           { desc = 'Rename symbol' })
map('n', '<leader>rN', '<cmd>Lspsaga rename ++project<CR>', { desc = 'Rename symbol (project-wide)' })

-- Lspsaga — call hierarchy
map('n', '<leader>ci', '<cmd>Lspsaga incoming_calls<CR>', { desc = 'Incoming calls' })
map('n', '<leader>co', '<cmd>Lspsaga outgoing_calls<CR>', { desc = 'Outgoing calls' })

-- Lspsaga — outline
map('n', '<leader>o',  '<cmd>Lspsaga outline<CR>', { desc = 'Toggle outline' })

-- Lspsaga — float terminal
map({ 'n', 't' }, '<A-d>', '<cmd>Lspsaga term_toggle<CR>', { desc = 'Toggle float terminal' })