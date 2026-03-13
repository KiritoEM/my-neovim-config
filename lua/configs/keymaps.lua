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
map('n', '<C-\\>', '<Cmd>vsplit<CR>',  { desc = 'Split vertical' })

-- Todo comments
map('n', ']t', function() require('todo-comments').jump_next() end, { desc = 'Jump to next todo comment' })
map('n', '[t', function() require('todo-comments').jump_prev() end, { desc = 'Jump to previous todo comment' })

-- Barbar — tab navigation
map('n', '<A-,>', '<Cmd>BufferPrevious<CR>',           { desc = 'Go to previous tab' })
map('n', '<A-.>', '<Cmd>BufferNext<CR>',                { desc = 'Go to next tab' })
map('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>',        { desc = 'Move tab to the left' })
map('n', '<A->>', '<Cmd>BufferMoveNext<CR>',            { desc = 'Move tab to the right' })
map('n', '<A-1>', '<Cmd>BufferGoto 1<CR>',              { desc = 'Go to tab 1' })
map('n', '<A-2>', '<Cmd>BufferGoto 2<CR>',              { desc = 'Go to tab 2' })
map('n', '<A-3>', '<Cmd>BufferGoto 3<CR>',              { desc = 'Go to tab 3' })
map('n', '<A-4>', '<Cmd>BufferGoto 4<CR>',              { desc = 'Go to tab 4' })
map('n', '<A-5>', '<Cmd>BufferGoto 5<CR>',              { desc = 'Go to tab 5' })
map('n', '<A-6>', '<Cmd>BufferGoto 6<CR>',              { desc = 'Go to tab 6' })
map('n', '<A-7>', '<Cmd>BufferGoto 7<CR>',              { desc = 'Go to tab 7' })
map('n', '<A-8>', '<Cmd>BufferGoto 8<CR>',              { desc = 'Go to tab 8' })
map('n', '<A-9>', '<Cmd>BufferGoto 9<CR>',              { desc = 'Go to tab 9' })
map('n', '<A-0>', '<Cmd>BufferLast<CR>',                { desc = 'Go to last tab' })
map('n', '<A-p>', '<Cmd>BufferPin<CR>',                 { desc = 'Pin/unpin current tab' })
map('n', '<A-c>', '<Cmd>BufferClose<CR>',               { desc = 'Close current tab' })
map('n', '<A-q>', '<Cmd>BufferCloseAllButCurrent<CR>',  { desc = 'Close all tabs but current' })
map('n', '<C-p>', '<Cmd>BufferPick<CR>',                { desc = 'Pick a tab interactively' })

-- Barbar — sort
map('n', '<leader>bb', '<Cmd>BufferOrderByBufferNumber<CR>', { desc = 'Sort tabs by buffer number' })
map('n', '<leader>bn', '<Cmd>BufferOrderByName<CR>',         { desc = 'Sort tabs by name' })
map('n', '<leader>bd', '<Cmd>BufferOrderByDirectory<CR>',    { desc = 'Sort tabs by directory' })
map('n', '<leader>bl', '<Cmd>BufferOrderByLanguage<CR>',     { desc = 'Sort tabs by language' })