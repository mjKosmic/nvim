return {
  "zootedb0t/citruszest.nvim",
  lazy = false,
  priority = 1000,
  config = function (_, opts)
      local citrus = require("citruszest")
      citrus.setup(opts)
      vim.cmd("colorscheme citruszest")

      -- Overiding the highlight color settings for the popup menus and floating windows
      vim.cmd("hi PmenuSel guibg=#404040 guifg=#FFAA54 gui=bold")
      vim.cmd("hi Pmenu guibg=#232323 guifg=white")
      vim.cmd("hi NormalFloat guibg=#232323 guifg=white")
  end
}

