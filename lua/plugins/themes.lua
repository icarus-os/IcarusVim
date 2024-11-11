return {
  {
    "rmehri01/onenord.nvim",
    opts = {
      borders = true,
      fade_nc = false,
      styles = {
        comments = "italic",
        strings = "NONE",
        keywords = "NONE",
        functions = "italic",
        variables = "bold",
        diagnostics = "underline",
      },
      disable = {
        background = false,
        cursorline = false,
        eob_lines = true,
      },
      colors = {},
    },
  },
  {
    "folke/tokyonight.nvim",
    opts = {
      -- style = 'night',
      -- on_colors = function(colors)
      --     colors.bg_dark = '#000000'
      --     colors.bg = '#11121D'
      --     -- colors.bg_visual = M.colors.grey12
      -- end
    },
  },
  {
    "navarasu/onedark.nvim",
    opts = {
      style = "deep",
      transparent = false, -- Show/hide background
      code_style = {
        comments = "italic",
        keywords = "none",
        functions = "none",
        strings = "none",
        variables = "none",
      },
      lualine = {
        transparent = true, -- lualine center bar transparency
      },
    },
  },
  {
    "JoosepAlviste/palenightfall.nvim",
  },
  {
    "AlexvZyl/nordic.nvim",
  },
  {
    "olimorris/onedarkpro.nvim",
    config = function()
      vim.o.background = "dark"
      require("onedarkpro").load()
    end,
  },
  {
    "tiagovla/tokyodark.nvim",
    config = function()
      vim.g.tokyodark_transparent_background = false
      vim.g.tokyodark_enable_italic_comment = true
      vim.g.tokyodark_enable_italic = true
      vim.g.tokyodark_color_gamma = "0.0"
    end,
  },
  {
    "bluz71/vim-moonfly-colors",
  },
  {
    "Mofiqul/dracula.nvim",
  },
  {
    "magidc/draculanight",
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function()
      vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha
      local theme = require("catppuccin")
      theme.setup({})
      theme.load()
    end,
  },
  {
    "AmeerArsala/flow.nvim",
    name = "flow",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true,
      fluo_color = "pink",
      mode = "normal",
      aggressive_spell = false,
    },
    -- config = function()
    --   local theme = require("flow")
    --   theme.setup()
    --   theme.load()
    -- end,
  },
  {
    "EdenEast/nightfox.nvim",
    name = "nightfox",
  },
  {
    "Everblush/nvim",
    name = "everblush",
  },
}
