return {
    'nvim-telescope/telescope.nvim',
    -- tag = '0.1.8',
    priority = 900,
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
	defaults = {
	    layout_strategy = 'center',
	    layout_config = {
		preview_cutoff = 10,
	    },
	    sorting_strategy = 'ascending',
	    border = false
	}
    }
}


