
-- Core
vim.keymap.set('n', '<ESC>', '<ESC><CMD>nohl<CR>')

-- Lazy
vim.keymap.set('n', '<leader>L', ':Lazy<CR>')

-- Oil
vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = "Open parent directory" })
