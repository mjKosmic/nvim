return {
    "David-Kunz/gen.nvim",
    event = "BufEnter",
    opts = {
	model = "deepseek-r1",
	host = "localhost",
	port = "11434"
    },
    config = function()
	local gen = require('gen')
	gen.setup({})
	gen.init()
	vim.keymap.set('n', '<leader>as', gen.select_model)
	vim.keymap.set('n', '<leader>aa', ':Gen<CR>', { desc = "AI Menu" })
	vim.keymap.set('n', '<leader>ac', ':Gen Chat<CR>', { desc = "AI Chat" })
	vim.keymap.set('n', '<leader>au', ':Gen Summarize<CR>', { desc = "AI Summarize" })
	vim.keymap.set('n', '<leader>ae', ':Gen Enhance<CR>', { desc = "AI Enhance" })

	vim.api.nvim_create_autocmd('VimLeave', {
	    group = vim.api.nvim_create_augroup('ai-close', { clear = true }),
	    callback = function(event)
		os.execute('pkill ollama')
	    end
	})
    end
}
