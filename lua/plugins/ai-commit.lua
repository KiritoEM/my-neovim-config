local constants = require('configs.constants')

return {
  "404pilo/aicommits.nvim",
  config = function()
    require("aicommits").setup({
      active_provider = "gemini-api",
      providers = {
        ["gemini-api"] = {
          enabled = true,
          api_key=constants.API_KEY,
          model = "gemini-2.5-flash",
          generate = 3,
          max_length = 72,
          temperature = 0.7, 
          max_tokens = 200,
          thinking_budget = 0,
        },
      },
    })
  end,
}
