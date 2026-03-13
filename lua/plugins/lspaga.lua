return {
    'nvimdev/lspsaga.nvim',
    dependencies = {
        'nvim-treesitter/nvim-treesitter', 
        'nvim-tree/nvim-web-devicons',    
    },
    config = function()
        require('lspsaga').setup({
            ui = {
                border = "rounded",
                devicon = true,
                expand = "⊞",
                collapse = "⊟",
                code_action = "💡",
                lines = { "┗", "┣", "┃", "━", "┏" },
            },
            finder = {
                max_height = 0.5,
                left_width = 0.3,
                right_width = 0.3,
                default = "def+ref+imp",
                silent = false,
                keys = {
                    shuttle        = "[w",
                    toggle_or_open = "o",
                    vsplit         = "s",
                    split          = "i",
                    tabe           = "t",
                    tabnew         = "r",
                    quit           = "q",
                    close          = "<C-c>k",
            },
            },
            layout = "float",
            definition = {
                width  = 0.6,
                height = 0.5,
                keys = {
                    edit  = "<C-c>o",
                    vsplit = "<C-c>v",
                    split  = "<C-c>i",
                    tabe   = "<C-c>t",
                    quit   = "q",
                    close  = "<C-c>k",
            },
            },
            hover = {
                max_width  = 0.9,
                max_height = 0.8,
                open_link = "gx"
            },
            rename = {
                in_select = true,
                auto_save = true,
                project_max_width = 0.5,
                project_max_height = 0.5,
                keys = {
                    quit   = "<C-k>",
                    exec   = "<CR>",
                    select = "x",
                }
            },
            diagnostic = {
                show_code_action = true,
                jump_num_shortcut = true,
                max_width = 0.8,
                max_height = 0.6,
                text_hl_follow = true,
                border_follow = true,
                extend_relatedInformation = false,
                show_layout = "float",
                show_normal_height = 10,
                max_show_width = 0.8,
                diagnostic_only_current = false,
                keys = {
                    exec_action    = "o",
                    quit           = "q",
                    toggle_or_jump = "<CR>",
                    quit_in_show   = { "q", "<ESC>" },
                },
            },
            code_action = {
                num_shortcut = true,
                show_server_name = false,
                extend_gitsigns = false,
                keys = {
                    quit = "q",
                    exec = "<CR>",
                },
            },

            lightbulb = {
                enable = true,
                sign = true,        
                virtual_text = true,
                debounce = 10,
                sign_priority = 40,
             },
        })
    end,
}