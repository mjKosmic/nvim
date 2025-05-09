-- Works best with completeopt=noselect.
-- Use CTRL-Y to select an item. |complete_CTRL-Y|
vim.cmd[[set completeopt+=menuone,noselect,preview,fuzzy]]

vim.keymap.set("i", "<C-Space>", "<C-X><C-O>", { desc = "Trigger Auto-complete" })

vim.api.nvim_create_autocmd('LspAttach', {
  group = 'lsp_command_group',
  callback = function(args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
    vim.lsp.completion.enable(true, client.id, args.buf, {
      autotrigger = true,
      convert = function(item)
        return { abbr = item.label:gsub('%b()', '') }
      end,
    })
  end
})


