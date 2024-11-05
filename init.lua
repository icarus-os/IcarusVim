package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?/init.lua"
package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?.lua"

-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Theme
local theme = require("globals.theme")
theme.apply()

-- Post-Init Keybindings
-- nothing in there rn so I commented it out
--require("setup.postkeybinds")

--require("plugins.molten").init()
