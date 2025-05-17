return {
    cmd = { 'sourcekit-lsp' },
    root_markers = { 'Package.swift', 'compile_commands.json' },
    filetypes = { 'swift' },
    settings = {
	capabilities = {
	    workspace = {
		didChangeWatchedFiles = {
		    dynamicRegistration = true,
		},
		symbol = {
		    dynamicRegistration = true
		}
	    },
	    textDocument = {
		rangeFormatting = {
		    dynamicRegistration = true
		},
		completion = {
		    completionItem ={
			snippetSupport = true
		    }
		}
	    }
	},
    }
}
