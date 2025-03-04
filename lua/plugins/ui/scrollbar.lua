local theme = require("globals.theme")
local colors = theme.getColorsTheme()

return {
  {
    "petertriho/nvim-scrollbar",
    opts = {
      handle = {
        color = colors.bg_highlight,
      },
      marks = {
        Cursor = {
          text = "*",
          priority = 0,
          gui = nil,
          color = nil,
          cterm = nil,
          color_nr = nil, -- cterm
          highlight = "Normal",
        },
        Search = {
          color = colors.orange,
        },
        Error = {
          color = colors.error,
        },
        Warn = {
          color = colors.warning --[[colors.warning]],
        },
        Info = {
          color = colors.info --[[colors.info]],
        },
        Hint = {
          color = colors.hint --[[colors.hint]],
        },
        Misc = {
          color = colors.purple,
        },
      },
      handlers = {
        cursor = false,
        --diagnostic = false,
      },
    },
  },
  -- {
  --   "karb94/neoscroll.nvim",
  --   opts = {
  --     hide_cursor = true, -- Hide cursor while scrolling
  --     stop_eof = true, -- Stop at <EOF> when scrolling downwards
  --     respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
  --     cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
  --     duration_multiplier = 0.1, -- Global duration multiplier
  --     easing = "linear", -- Default easing function
  --     pre_hook = nil, -- Function to run before the scrolling animation starts
  --     post_hook = nil, -- Function to run after the scrolling animation ends
  --     performance_mode = true, -- Disable "Performance Mode" on all buffers.
  --     ignored_events = { -- Events ignored while scrolling
  --       "WinScrolled",
  --       "CursorMoved",
  --     },
  --   },
  -- },
}
