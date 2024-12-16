local configureTokyoNight = function(style) 
    require("tokyonight").setup({
	-- your configuration comes here
	-- or leave it empty to use the default settings
	style = style, -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
	light_style = "day", -- The theme is used when the background is set to light
	transparent = false, -- Enable this to disable setting the background color
	terminal_colors = true, -- Configure the colors used when opening a `:terminal` in [Neovim](https://github.com/neovim/neovim)
	styles = {
	    -- Style to be applied to different syntax groups
	    -- Value is any valid attr-list value for `:help nvim_set_hl`
	    comments = { italic = true },
	    keywords = { italic = true },
	    functions = { bold = true },
	    variables = {},
	    -- Background styles. Can be "dark", "transparent" or "normal"
	    sidebars = "dark", -- style for sidebars, see below
	    floats = "dark", -- style for floating windows
	},
	sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
	day_brightness = 0.15, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
	hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
	dim_inactive = true, -- dims inactive windows
	lualine_bold = true, -- When `true`, section headers in the lualine theme will be bold

	--- You can override specific color groups to use other groups or a hex color
	--- function will be called with a ColorScheme table
	---@param colors ColorScheme
	on_colors = function(colors)
	    colors.bg = "#000000"
	    colors.bg_dark = "#000000"
	    colors.bg_highlight = "#12131a"
	    colors.fg = "#8389a3"
	end,

	--- You can override specific highlights to use other groups or a hex color
	--- function will be called with a Highlights and ColorScheme table
	---@param highlights Highlights
	---@param colors ColorScheme
	on_highlights = function(hl, c)
	    -- local prompt = "#2d3149"
	    local prompt = "#12131a"
	    hl.TelescopeNormal = {
		bg = c.bg_dark,
		-- fg = c.fg_dark,
	    }
	    hl.TelescopeBorder = {
		bg = c.bg_dark,
		-- fg = c.bg_dark,
	    }
	    hl.TelescopePromptNormal = {
		-- bg = prompt,
		bg = c.bg_dark
	    }
	    hl.TelescopePromptBorder = {
		bg = c.bg_dark,
		-- fg = prompt,
	    }
	    hl.TelescopePromptTitle = {
		bg = c.bg_dark,
		-- fg = prompt,
	    }
	    hl.TelescopePreviewTitle = {
		bg = c.bg_dark,
		-- fg = c.bg_dark,
	    }
	    hl.TelescopeResultsTitle = {
		bg = c.bg_dark,
		-- fg = c.bg_dark,
	    }
	    
	    hl.WhichKeyNormal = {
		bg = prompt,
	    }
	    hl.WhichKey = {
		bg = prompt,
	    }
	end,

	plugins = {
	    telescope = true,
	}
    })

    vim.cmd[[colorscheme tokyonight]]
end

-- return {
--     'folke/tokyonight.nvim',
--     priority = 1000,
--     config = function()
-- 	local styles = { "night", "storm", "moon", "day" }
-- 	local styleIndex = 2
-- 	local style = styles[styleIndex]
-- 	vim.keymap.set('n', '<leader>00', function()
-- 	    styleIndex = styleIndex + 1
-- 	    if styleIndex > 4 then
-- 		styleIndex = 1
-- 	    end
-- 	    style = styles[styleIndex]
-- 	    configureTokyoNight(style)
-- 	end, {desc = "Change colorscheme style"})
--
-- 	configureTokyoNight(style)
--     end
-- }

-- return {
--     "tiagovla/tokyodark.nvim",
--     opts = {
--         -- custom options here
--     },
--     config = function(_, opts)
--         require("tokyodark").setup(opts) -- calling setup is optional
--         vim.cmd [[colorscheme tokyodark]]
--     end,
-- }


-- return {
--   "Tsuzat/NeoSolarized.nvim",
--     lazy = false, -- make sure we load this during startup if it is your main colorscheme
--     priority = 1000, -- make sure to load this before all the other start plugins
--     config = function()
--       local neo = require('NeoSolarized')
--
--       neo.setup {
-- 	style = "Dark",
-- 	styles = {
-- 	  -- Style to be applied to different syntax groups
-- 	  comments = { italic = true },
-- 	  keywords = { italic = true },
-- 	  functions = { bold = true },
-- 	  variables = {},
-- 	  string = { italic = true },
-- 	  underline = true, -- true/false; for global underline
-- 	  undercurl = true, -- true/false; for global undercurl
-- 	},
--
--       }
--
--
--       vim.cmd [[ colorscheme NeoSolarized ]]
--     end
-- }


-- return {
--     "catppuccin/nvim",
--     name = "catppuccin",
--     priority = 1000,
--     config  = function()
-- 	require('catppuccin').setup {
-- 	    flavour = "mocha",
-- 	    no_italic = true,
-- 	    term_colors = true,
-- 	    transparent_background = false,
-- 	    styles = {
-- 		comments = {},
-- 		conditionals = {},
-- 		loops = {},
-- 		functions = {},
-- 		keywords = {},
-- 		strings = {},
-- 		variables = {},
-- 		numbers = {},
-- 		booleans = {},
-- 		properties = {},
-- 		types = {},
-- 	    },
-- 	    color_overrides = {
-- 		mocha = {
-- 		    base = "#000000",
-- 		    mantle = "#000000",
-- 		    crust = "#000000",
-- 		    text = "#ffffff",
-- 		},
-- 	    },
-- 	    dim_inactive = {
-- 		enabled = false, -- dims the background color of inactive window
-- 		shade = "dark",
-- 		percentage = 0.15, -- percentage of the shade to apply to the inactive window
-- 	    },
-- 	    integrations = {
-- 		cmp = true,
-- 		gitsigns = true,
-- 		nvimtree = true,
-- 		treesitter = true,
-- 		notify = false,
-- 		mini = {
-- 		    enabled = true,
-- 		    indentscope_color = "",
-- 		},
-- 	    }
-- 	}
--
-- 	vim.cmd.colorscheme "catppuccin"
--     end,
-- }


return {
  "zootedb0t/citruszest.nvim",
  priority = 1000,
  config = function()

      vim.cmd.colorscheme "citruszest"
  end
}










