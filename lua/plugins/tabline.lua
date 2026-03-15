return {
    'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim', 
      'nvim-tree/nvim-web-devicons',
    },
    init = function() vim.g.barbar_auto_setup = false end,
    opts = {
        animation = true,
        auto_hide = 1,
        insert_at_start = false,
        tabpages = true,
        focus_on_close = 'right',
        highlight_visible = true,
        maximum_length = 32,
        clickable = true,
        exclude_ft = {'neo-tree'},
        sidebar_filetypes = {
            ['neo-tree'] = { event = 'BufWipeout', align = 'right' },
        },
        icons = {
            buffer_index = false,
            buffer_number = false,
            button = ' 󰅖',
            diagnostics = {
                [vim.diagnostic.severity.ERROR] = { enabled = true },
                [vim.diagnostic.severity.HINT]  = { enabled = true },
                [vim.diagnostic.severity.WARN]  = { enabled = true },
            },
            gitsigns = {
                -- added = {enabled = true, icon = '+'},
                changed = {enabled = true, icon = '~'},
                -- deleted = {enabled = true, icon = '-'},
            },
            separator = { left = '▎', right = '' },
           -- modified = { button = '●' },
            pinned = { button = '󰐃', filename = true },
            filetype = { enabled = true }
            },
        minimum_padding = 2,
        maximum_padding = 4,
    },
}
