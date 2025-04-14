vim.keymap.set('n', "<leader>ff", require('telescope.builtin').find_files, { desc = "Find Files" } )
vim.keymap.set('n', "<leader>fg", require('telescope.builtin').live_grep, { desc = "Live Grep" })
vim.keymap.set('n', "<leader>fb", require('telescope.builtin').buffers, { desc = "Search Buffers" })
vim.keymap.set('n', "<leader>fh", require('telescope.builtin').help_tags, { desc = "Search Help Tags" })
