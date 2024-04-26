-- Enable "Q" to be a valid quit command
vim.api.nvim_create_user_command('Q',function()
    vim.cmd[[q]]
end,{})
