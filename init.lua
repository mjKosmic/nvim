-- set the leader
vim.g.mapleader = ' '

require('plugins')
require('commands')
require('options')
require('keybinds')
require('completion')
require('diagnostic')

vim.lsp.enable(
  {
    'luals',
    'rust-analyzer',
    'clangd',
    'sourcekit'
  }
)

vim.diagnostic.config({
    virtual_lines = { current_line = true }
})

