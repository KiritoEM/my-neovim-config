return {
    "nvimtools/none-ls.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim", 
      "nvimtools/none-ls-extras.nvim",
    config = function()
      local null_ls = require("null-ls")

      local group = vim.api.nvim_create_augroup("lsp_format_on_save", { clear = false })

      null_ls.setup({
        on_attach = function(client, bufnr)
          if client.supports_method("textDocument/formatting") then
            vim.keymap.set("n", "<Leader>f", function()
              vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
            end, { buffer = bufnr, desc = "[lsp] format" })

            -- format on save
            vim.api.nvim_clear_autocmds({ buffer = bufnr, group = group })
            vim.api.nvim_create_autocmd("BufWritePre", {
              buffer = bufnr,
              group = group,
              callback = function()
                vim.lsp.buf.format({ bufnr = bufnr, async = false })
              end,
              desc = "[lsp] format on save",
            })
          end

          if client.supports_method("textDocument/rangeFormatting") then
            vim.keymap.set("x", "<Leader>f", function()
              vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
            end, { buffer = bufnr, desc = "[lsp] format" })
          end
        end,
        sources = {
          null_ls.builtins.diagnostics.eslint.with({
            diagnostics_format = "[eslint] #{m}\n(#{c})",
          }),
          null_ls.builtins.diagnostics.fish,
        },
      })
    end,
  },
  {
    "MunifTanjim/prettier.nvim",
    dependencies = { "nvimtools/none-ls.nvim" },
    config = function()
      local prettier = require("prettier")

      prettier.setup({
        bin = "prettierd", 
        filetypes = {
            "css",
            "graphql",
            "html",
            "javascript", 
            "javascriptreact",
            "json",
            "less", 
            "markdown",
            "scss",
            "typescript",
            "typescriptreact",
            "yaml",
            "php",
            "dart"
        },
        ["null-ls"] = {
        -- prettier didn't run if no file configura tion in project or directory
          condition = function()
            return prettier.config_exists({ check_package_json = true })
          end,
          timeout = 7000,
        },
      })
    end,
  },
}