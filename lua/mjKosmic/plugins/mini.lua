local M = {
    'echasnovski/mini.nvim',
    version = false,
    config = function()
	--Mini Complete autocompletion
	require('mini.completion').setup()
    end
}

return M
