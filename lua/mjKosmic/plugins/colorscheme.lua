local theme = {
    -- Bluloco Theme
    {
    "uloco/bluloco.nvim",
    lazy = false,
    priority = 1000,
    dependencies = { 'rktjmp/lush.nvim' },
    config = function()
	-- Make sure the termguicolors is enabled (required for lush)
	vim.opt.termguicolors = true

	-- Set the color scheme 
	vim.cmd([[colorscheme bluloco-dark]])
    end
    }
}

return theme
