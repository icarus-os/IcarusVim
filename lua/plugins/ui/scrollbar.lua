local theme = require("globals.theme")
local colors = theme.getColorsTheme()

return {
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
}
