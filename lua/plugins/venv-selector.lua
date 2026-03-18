return {
    "linux-cultist/venv-selector.nvim",
    cmd = "VenvSelect",
    opts = {
        options = {
        notify_user_on_venv_activation = true,
        override_notify = false,
        picker = 'telescope',
        picker_filter_type = 'substring',
        picker_columns = { 'marker', 'search_icon', 'search_name', 'search_result' },
        selected_venv_marker_color = '#76946A',
        selected_venv_marker_icon = '✔venv',
        },
    },
    ft = "python",  
    cmd = 'VenvSelect',
    keys = { { "<leader>cv", "<cmd>:VenvSelect<cr>", desc = "Select VirtualEnv", ft = "python" } },
}