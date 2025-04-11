-- Enable "Q" to be a valid quit command
vim.api.nvim_create_user_command('Q',function()
    vim.cmd[[q]]
end,{})

-- LSP Capabilities
vim.api.nvim_create_user_command("LspCapabilities", function()
    local capabilities = vim.lsp.get_clients()[1].server_capabilities
    vim.print(capabilities)
end, {})

vim.api.nvim_create_augroup('lsp_command_group', { clear = true })
