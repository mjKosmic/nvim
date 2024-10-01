return {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
	"williamboman/mason.nvim",
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	"j-hui/fidget.nvim",
    },
    config = function()
	-- import Mason
	local mason = require('mason')

	-- import Mason LSPConfig
	local mason_lspconfig = require('mason-lspconfig')

	-- import Mason Tool Installer
	local mason_tool_installer = require('mason-tool-installer')


	-- Setup Fidget
	require('fidget').setup{}

	-- enable Mason and configure icons
	mason.setup({
	    ui = {
		icons = {
		    package_uninstalled = "🔴",
		    package_pending = "🔵",
		    package_installed = "🟢"
		}
	    }
	})

	-- enable Mason LSPConfig (note: must always be called after mason.setup)
	mason_lspconfig.setup({
	    -- A list of servers to automatically install if they're not already installed. Example: { "rust_analyzer@nightly", "lua_ls" }
	    ensure_installed = {
		"html",		    -- HTML
		"cssls",	    -- CSS
		"lua_ls",	    -- Lua  
		"biome",	    -- Javascript
		"marksman",	    -- Markdown
		"bashls",	    -- Bash
		--"asm_lsp",	    -- Assembly
		"clangd",	    -- C/C++
		"cmake",	    -- CMake
		--"gopls",	    -- Go
		--"ruby_lsp",	    -- Ruby
		"rust_analyzer",    -- Rest
		--"sqls",		    -- SQL
		"zls",		    -- ZIG
		"hydra_lsp"	    -- YAML
	    },

	    -- Whether servers that are set up (via lspconfig) should be automatically installed if they're not already installed.
	    -- This setting has no relation with the `ensure_installed` setting.
	    -- Can either be:
	    --   - false: Servers are not automatically installed.
	    --   - true: All servers set up via lspconfig are automatically installed.
	    --   - { exclude: string[] }: All servers set up via lspconfig, except the ones provided in the list, are automatically installed.
	    --       Example: automatic_installation = { exclude = { "rust_analyzer", "solargraph" } }
	    automatic_installation = true,
	})

	-- enable auto updating of linters, LSPs, and DAPs with Mason Tool Installer
	mason_tool_installer.setup({
	    auto_update = true,
	    run_on_start = true,
	    start_delay = 3000, -- 3 second delay
	})
    end,
}
