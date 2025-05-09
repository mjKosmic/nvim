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
        -- return { abbr = item.label:gsub('%b()', '') }
	local info = ""
	if item.documentation then
	    info = item.documentation.value or ""
	end
        return {
	    word = item.label,
	    abbr = item.label .. "\t\t\t\t\t",
	    menu = "",
	    info = info,
	    abbr_hlgroup = fgHighlightGroupForKind(item.kind),
	    kind_hlgroup = fgHighlightGroupForKind(item.kind)
	}
      end,
    })
  end
})

function fgHighlightGroupForKind(kind)
    if kind == 1 then --Plain Text
	return "CmpItemKindText"
    elseif kind == 2 then -- Method
	return "CmpItemKindMethod"
    elseif kind == 3 then -- Function
	return "CmpItemKindFunction"
    elseif kind == 4 then -- Constructor
	return "CmpItemKindConstructor"
    elseif kind == 5 then -- Field
	return "CmpItemKindField"
    elseif kind == 6 then -- Variable
	return "CmpItemKindVariable"
    elseif kind == 7 then -- Class
	return "CmpItemKindClass"
    elseif kind == 8 then -- Interface
	return "CmpItemKindInterface"
    elseif kind == 9 then -- Module
	return "CmpItemKindModule"
    elseif kind == 10 then -- Property
	return "CmpItemKindProperty"
    elseif kind == 11 then -- Unit
	return "CmpItemKindUnit"
    elseif kind == 12 then -- Value
	return "CmpItemKindValue"
    elseif kind == 13 then -- Enum
	return "CmpItemKindEnum"
    elseif kind == 14 then -- Keyword
	return "CmpItemKindKeyword"
    elseif kind == 15 then -- Snippet
	return "CmpItemKindSnippet"
    elseif kind == 16 then -- Color
	return "CmpItemKindColor"
    elseif kind == 17 then -- File
	return "CmpItemKindFile"
    elseif kind == 18 then -- Reference
	return "CmpItemKindReference"
    elseif kind == 19 then -- Folder
	return "CmpItemKindFolder"
    elseif kind == 20 then -- Enum Member
	return "CmpItemKindEnumMember"
    elseif kind == 21 then -- Constant
	return "CmpItemKindConstant"
    elseif kind == 22 then -- Struct
	return "CmpItemKindStruct"
    elseif kind == 23 then -- Event
	return "CmpItemKindEvent"
    elseif kind == 24 then -- Operator
	return "CmpItemKindOperator"
    elseif kind == 25 then -- Type Parameter
	return "CmpItemKindTypeParameter"
    else
	return "CmpItemKindText"
    end
end


