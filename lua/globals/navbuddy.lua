--  _   _    ___     ______  _   _ ____  ______   __
-- | \ | |  / \ \   / / __ )| | | |  _ \|  _ \ \ / /
-- |  \| | / _ \ \ / /|  _ \| | | | | | | | | \ V / 
-- | |\  |/ ___ \ V / | |_) | |_| | |_| | |_| || |  
-- |_| \_/_/   \_\_/  |____/ \___/|____/|____/ |_|  
-- 
-- See https://github.com/AmeerArsala/nvim-navbuddy/tree/master for a list of options

local NB_OPTIONS = {}

NB_OPTIONS.window = {
  border = "rounded", -- "rounded", "double", "solid", "none"
  -- or an array with eight chars building up the border in a clockwise fashion
  -- starting with the top-left corner. eg: { "╔", "═" ,"╗", "║", "╝", "═", "╚", "║" }.
  size = { height = "80%", width = "80%" }, -- Or table format example: { height = "40%", width = "100%"}
  position = "50%", -- Or table format example: { row = "100%", col = "0%"}
  scrolloff = nil, -- scrolloff value within navbuddy window
  sections = {
    left = {
      size = "20%",
      border = nil, -- You can set border style for each section individually as well.
    },
    mid = {
      size = "30%",
      border = nil,
    },
    right = {
      -- No size option for right most section. It fills to
      -- remaining area.
      border = nil,
      preview = "leaf", -- Right section can show previews too.
      -- Options: "leaf", "always" or "never"
    },
  },
}

return NB_OPTIONS
