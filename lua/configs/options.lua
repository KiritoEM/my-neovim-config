-- line numbers
vim.o.number = true

-- highlight current line
vim.o.cursorline = true

-- mode shown in statusline instead
vim.o.showmode   = false

-- always show sign column
vim.o.signcolumn = 'yes'

-- lines to keep above/below cursor
vim.o.scrolloff  = 10

-- enable mouse mode
vim.o.mouse = 'a'

-- wrapped lines keep indentation
vim.o.breakindent = true

-- persistent undo history
vim.o.undofile    = true

-- ask to save instead of failing
vim.o.confirm     = true

-- case-insensitive by default
vim.o.ignorecase = true

-- case-sensitive if uppercase used
vim.o.smartcase  = true

-- faster diagnostics
vim.o.updatetime = 250

-- faster key sequence timeout
vim.o.timeoutlen = 300

-- new splits open to the right
vim.o.splitright = true

-- show whitespace characters
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- live preview for substitutions
vim.o.inccommand = 'split'

-- sync clipboard with OS
vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

-- disable virtual_text in diagnostic
vim.diagnostic.config({ virtual_text = false })

-- Enable termguicolors
vim.opt.termguicolors = true