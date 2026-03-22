local constants = require('configs.constants')

return {
    'vernette/ai-commit.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope.nvim',
    },
    config = function()
        require('ai-commit').setup({
        	openrouter_api_key = constants.API_KEY,
		model = 'nvidia/nemotron-3-super-120b-a12b:free',
		auto_push = false
	})
    end
}
