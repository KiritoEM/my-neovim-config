return {
  "NeogitOrg/neogit",
  lazy = true,
  dependencies = {
    "nvim-lua/plenary.nvim",     
    "sindrets/diffview.nvim",       
    "nvim-telescope/telescope.nvim"
  },
  cmd = "Neogit",
   opts = {
    kind = 'vsplit',             
    popup = {
      kind = 'vsplit',          
    },
    integrations = {
      diffview  = true,           
      telescope = true,         
    },
  },
  keys = {
      {
        '<leader>gg',
        function() require('neogit').open() end,
        desc = 'Open Neogit',
      },
      {
        '<leader>gb',
        function() require('neogit').open({ 'branch' }) end,
        desc = 'Neogit branch',
      },
      {
        '<leader>gc',
        function() require('neogit').open({ 'commit' }) end,
        desc = 'Neogit commit',
      },
      {
        '<leader>gl',
        function() require('neogit').open({ 'log' }) end,
        desc = 'Neogit log',
      },
      {
        '<leader>gp',
        function() require('neogit').open({ 'push' }) end,
        desc = 'Neogit push',
      },
      {
        '<leader>gL',
        function() require('neogit').open({ 'pull' }) end,
        desc = 'Neogit pull',
      },
      {
        '<leader>gw',
        function() require('neogit').open({ 'worktree' }) end,
        desc = 'Neogit worktree',
      },
      {
        '<leader>gR',
        function() require('neogit').open({ 'remote' }) end,
        desc = 'Neogit remote',
      },
  },
}