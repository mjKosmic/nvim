
-- Core
vim.keymap.set('n', '<ESC>', '<ESC><CMD>nohl<CR>')

-- Lazy
vim.keymap.set('n', '<leader>L', ':Lazy<CR>')

-- Oil
vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = "Open parent directory" })

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
