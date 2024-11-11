-- first, import the internal lib
require("globals.lib.icarus")

-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Theme
local theme = require("globals.theme")
theme.apply()

-- Add the global functions
require("globals.functions")

-- Post-Init Keybindings
-- nothing in there rn so I commented it out
--require("setup.postkeybinds")

--require("plugins.molten").init()
