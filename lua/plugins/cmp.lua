return {
  'hrsh7th/nvim-cmp',
  dependencies = {
    'onsails/lspkind.nvim',
    'L3MON4D3/LuaSnip',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'brenoprata10/nvim-highlight-colors',
  },
  config = function()
    local cmp = require('cmp')
    local luasnip = require('luasnip')
    local lspkind = require('lspkind')

    -- Setup nvim-highlight-colors
    require('nvim-highlight-colors').setup {
      render = 'virtual',
      virtual_symbol = '■',
      virtual_symbol_suffix = ' ',
      virtual_symbol_prefix = '',
      virtual_symbol_position = 'inline',
      enable_hex            = true,  
      enable_short_hex      = true,  
      enable_rgb            = true,  
      enable_hsl            = true,  
      enable_hsl_without_function = true, 
      enable_var_usage      = true,   
      enable_named_colors   = false,  
      enable_tailwind       = false,  
    }

    cmp.setup {
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert {
        ['<C-b>']     = cmp.mapping.scroll_docs(-4),
        ['<C-f>']     = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>']     = cmp.mapping.abort(),
        ['<CR>']      = cmp.mapping.confirm { select = true },
        ['<Tab>']     = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { 'i', 's' }),
        ['<S-Tab>']   = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { 'i', 's' }),
      },
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
      }, {
        { name = 'buffer' },
      }),
      formatting = {
        format =  function(entry, item)
          local lspkind_format  = lspkind.cmp_format({
            mode             = 'symbol_text',
            maxwidth         = 50,
            ellipsis_char    = '...',
            show_labelDetails = true,
          })
          item = lspkind_format(entry, item)
          
          local color_item = require("nvim-highlight-colors").format(entry, {kind = item.kind})
          if color_item.abbr_hl_group then
            item.kind_hl_group = color_item.abbr_hl_group
            item.kind = color_item.abbr
          end
            
          return item
        end
      }
    }

    vim.keymap.set({'i', 'c'}, '<C-Space>', cmp.complete, { desc = 'Trigger completion (Same as Vscode Ctrl + Space)'})
  end,
}