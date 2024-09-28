return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
	"hrsh7th/cmp-nvim-lsp"
    },
    config = function() 
	-- import LSP Config
	local lspconfig = require('lspconfig')
	
	-- import CMP NVIM LSP
	local cmp_nvim_lsp = require('cmp_nvim_lsp')

	vim.api.nvim_create_autocmd('LspAttach', {
	    group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
	    callback = function(event)

		local map = function(keys, func, desc)
		    vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
		end

		-- Jump to the definition of the word under your cursor.
		--  This is where a variable was first declared, or where a function is defined, etc.
		--  To jump back, press <C-t>.
		map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')

		-- Find references for the word under your cursor.
		map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')

		-- Jump to the implementation of the word under your cursor.
		--  Useful when your language has ways of declaring types without an actual implementation.
		map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')

		-- Jump to the type of the word under your cursor.
		--  Useful when you're not sure what type a variable is and you want to see
		--  the definition of its *type*, not where it was *defined*.
		map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')

		-- Fuzzy find all the symbols in your current document.
		--  Symbols are things like variables, functions, types, etc.
		map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')

		-- Fuzzy find all the symbols in your current workspace.
		--  Similar to document symbols, except searches over your entire project.
		map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

		-- Rename the variable under your cursor.
		--  Most Language Servers support renaming across files, etc.
		map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')

		-- Execute a code action, usually your cursor needs to be on top of an error
		-- or a suggestion from your LSP for this to activate.
		map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

		-- Opens a popup that displays documentation about the word under your cursor
		--  See `:help K` for why this keymap.
		map('K', vim.lsp.buf.hover, 'Hover Documentation')

		-- WARN: This is not Goto Definition, this is Goto Declaration.
		--  For example, in C this would take you to the header.
		map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

		-- The following two autocommands are used to highlight references of the
		-- word under your cursor when your cursor rests there for a little while.
		--    See `:help CursorHold` for information about when this is executed
		--
		-- When you move your cursor, the highlights will be cleared (the second autocommand).
		local client = vim.lsp.get_client_by_id(event.data.client_id)
		if client and client.server_capabilities.documentHighlightProvider then
		    local highlight_augroup = vim.api.nvim_create_augroup('lsp-highlight', { clear = false })
		    vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
			buffer = event.buf,
			group = highlight_augroup,
			callback = vim.lsp.buf.document_highlight,
		    })

		    vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
			buffer = event.buf,
			group = highlight_augroup,
			callback = vim.lsp.buf.clear_references,
		    })
		end
	    end,
	})

	-- used to enable auto completion (assign to every LSP server config)
	local capabilities = cmp_nvim_lsp.default_capabilities()

	lspconfig["sourcekit"].setup({
	    capabilities = capabilities,
	    cmd = {
		"/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/sourcekit-lsp"
	    }
	})
    end
}