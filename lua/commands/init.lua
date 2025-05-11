-- Enable "Q" to be a valid quit command
vim.api.nvim_create_user_command('Q',function()
    vim.cmd[[q]]
end,{})

-- LSP Capabilities
vim.api.nvim_create_user_command("LspCapabilities", function()
    local capabilities = vim.lsp.get_clients()[1].server_capabilities
    vim.print(capabilities)
end, {})

vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'Enable inlay hints',
  callback = function(event)
    local id = vim.tbl_get(event, 'data', 'client_id')
    local client = id and vim.lsp.get_client_by_id(id)
    if client == nil or not client.supports_method('textDocument/inlayHint') then
      return
    end

    vim.lsp.inlay_hint.enable(true, {bufnr = event.buf})
  end,
})

vim.api.nvim_create_augroup('lsp_command_group', { clear = true })
