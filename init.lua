-- set the leader
vim.g.mapleader = ' '

require('plugins')
require('commands')
require('options')
require('keybinds')

vim.lsp.enable(
  {
	'luals',
	'rust-analyzer',
	'clangd',
	'sourcekit'
  }
)
