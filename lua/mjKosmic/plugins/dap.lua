return {
    "mfussenegger/nvim-dap",
    dependencies = {
	"rcarriga/nvim-dap-ui",
	"theHamsta/nvim-dap-virtual-text",
	"williamboman/mason.nvim",
	"nvim-neotest/nvim-nio",
	"julianolf/nvim-dap-lldb",
	"wojciech-kulik/xcodebuild.nvim"
    },
    event = "VeryLazy",
    config = function ()
	local dap = require('dap')
	local ui = require('dapui')

	ui.setup()

	vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint)
	vim.keymap.set("n", "<leader>gb", dap.run_to_cursor)

	--Eval var under cursor
	vim.keymap.set("n", "<leader>?", function ()
	    require('dapui').eval(nil, { enter = true })
	end)

	vim.keymap.set("n", "<C-1>", dap.continue)
	vim.keymap.set("n", "<C-2>", dap.step_into)
	vim.keymap.set("n", "<C-3>", dap.step_over)
	vim.keymap.set("n", "<C-4>", dap.step_out)
	vim.keymap.set("n", "<C-5>", dap.step_back)
	vim.keymap.set("n", "<C-0>", dap.restart)

	dap.listeners.before.attach.dapui_config = function() 
	    ui.open()
	end

	dap.listeners.before.launch.dapui_config = function() 
	    ui.open()
	end

	dap.listeners.before.event_terminated.dapui_config = function()
	    ui.close()
	end

	dap.listeners.before.event_exited.dapui_config = function() 
	    ui.close()
	end

	local xcodebuild = require('xcodebuild.integrations.dap')
	local codelldbPath = os.getenv("HOME") .. "/tools/dap/codelldb/extension/adapter/codelldb"
	xcodebuild.setup(codelldbPath)

	vim.keymap.set("n", "<leader>dd", xcodebuild.build_and_debug, { desc = "Build & Debug" })
	vim.keymap.set("n", "<leader>dr", xcodebuild.debug_without_build, { desc = "Debug Without Building" })
	vim.keymap.set("n", "<leader>dt", xcodebuild.debug_tests, { desc = "Debug Tests" })
	vim.keymap.set("n", "<leader>dT", xcodebuild.debug_class_tests, { desc = "Debug Class Tests" })
	vim.keymap.set("n", "<leader>b", xcodebuild.toggle_breakpoint, { desc = "Toggle Breakpoint" })
	vim.keymap.set("n", "<leader>B", xcodebuild.toggle_message_breakpoint, { desc = "Toggle Message Breakpoint" })
	vim.keymap.set("n", "<leader>dx", xcodebuild.terminate_session, { desc = "Terminate Debugger" })

    end
}
