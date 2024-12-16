return {
  "wojciech-kulik/xcodebuild.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-tree.lua", -- (optional) to manage project files
    "stevearc/oil.nvim", -- (optional) to manage project files
    "nvim-treesitter/nvim-treesitter", -- (optional) for Quick tests support (required Swift parser)
  },
  integrations = {
    pymobiledevice = {
      enabled = true
    }
  },
  config = function()
    local xcb = require("xcodebuild")
    xcb.setup({
        -- put some options here or leave it empty to use default settings
        logs = {
          notify = function(message, severity)
          local fidget = require("fidget")
          if progress_handle then
            progress_handle.message = message
            if not message:find("Loading") then
              progress_handle:finish()
              progress_handle = nil
              if vim.trim(message) ~= "" then
                fidget.notify(message, severity)
              end
            end
          else
            fidget.notify(message, severity)
          end
        end,
        notify_progress = function(message)
          local progress = require("fidget.progress")

          if progress_handle then
            progress_handle.title = ""
            progress_handle.message = message
          else
            progress_handle = progress.handle.create({
              message = message,
              lsp_client = { name = "xcodebuild.nvim" },
            })
          end
        end
        }
    })

    -- This function gets called from places where an Xcode project has been identified
    xcb.setKeymaps = function(buf)
      vim.keymap.set("n", "<leader>xu", '<cmd>XcodebuildPicker<cr>', { desc = 'Show Xcodebuild Actions', buffer = true })
      vim.keymap.set("n", "<leader>xf", '<cmd>XcodebuildProjectManager<cr>', { desc = 'Show Project Manager Actions', buffer = true })

      vim.keymap.set("n", "<leader>xb", "<cmd>XcodebuildBuild<cr>", { desc = "Build Project", buffer = true })
      vim.keymap.set("n", "<leader>xB", "<cmd>XcodebuildBuildForTesting<cr>", { desc = "Build For Testing", buffer = true })
      vim.keymap.set("n", "<leader>xr", "<cmd>XcodebuildBuildRun<cr>", { desc = "Build & Run Project", buffer = true })

      vim.keymap.set("n", "<leader>xt", "<cmd>XcodebuildTest<cr>", { desc = "Run Tests", buffer = true })
      vim.keymap.set("v", "<leader>xt", "<cmd>XcodebuildTestSelected<cr>", { desc = "Run Selected Tests", buffer = true })
      vim.keymap.set("n", "<leader>xT", "<cmd>XcodebuildTestClass<cr>", { desc = "Run Current Test Class", buffer = true })
      vim.keymap.set("n", "<leader>x.", "<cmd>XcodebuildTestRepeat<cr>", { desc = "Repeat Last Test Run", buffer = true })

      vim.keymap.set("n", "<leader>xl", "<cmd>XcodebuildToggleLogs<cr>", { desc = "Toggle Xcodebuild Logs", buffer = true })
      vim.keymap.set("n", "<leader>xc", "<cmd>XcodebuildToggleCodeCoverage<cr>", { desc = "Toggle Code Coverage", buffer = true })
      vim.keymap.set("n", "<leader>xC", "<cmd>XcodebuildShowCodeCoverageReport<cr>", { desc = "Show Code Coverage Report", buffer = true })
      vim.keymap.set("n", "<leader>xe", "<cmd>XcodebuildTestExplorerToggle<cr>", { desc = "Toggle Test Explorer", buffer = true })
      vim.keymap.set("n", "<leader>xs", "<cmd>XcodebuildFailingSnapshots<cr>", { desc = "Show Failing Snapshots", buffer = true })

      vim.keymap.set("n", "<leader>xd", "<cmd>XcodebuildSelectDevice<cr>", { desc = "Select Device", buffer = true })
      vim.keymap.set("n", "<leader>xp", "<cmd>XcodebuildSelectTestPlan<cr>", { desc = "Select Test Plan", buffer = true })
      vim.keymap.set("n", "<leader>xq", "<cmd>Telescope quickfix<cr>", { desc = "Show QuickFix List", buffer = true })

      vim.keymap.set("n", "<leader>xx", "<cmd>XcodebuildQuickfixLine<cr>", { desc = "Quickfix Line", buffer = true })
      vim.keymap.set("n", "<leader>xa", "<cmd>XcodebuildCodeActions<cr>", { desc = "Show Code Actions", buffer = true })
    end

    if require("xcodebuild.project.config").is_project_configured() then
      xcb.setKeymaps()
    end
    vim.keymap.set("n", "<leader>X", "<cmd>XcodebuildSetup<cr>", { desc = "Show XcodeBuild Setup" })


  end
}
