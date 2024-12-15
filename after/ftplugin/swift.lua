-- xcodebuild-specific keymappings for swift projects
vim.keymap.set("n", "<leader>X", '<cmd>XcodebuildPicker<cr>', { desc = 'Show Xcodebuild Actions', buffer = true })
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
