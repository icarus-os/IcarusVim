--package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?/init.lua"
--package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?.lua"

-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Theme
local theme = require("globals.theme")
theme.apply()

-- Util functions
function print_lsp_clients()
    local clients = vim.lsp.get_active_clients({ bufnr = 0 })
    if #clients > 0 then
        print("Active LSP Clients:")
        for _, client in ipairs(clients) do
            print(string.format("Name: %s, ID: %d", client.name, client.id))
        end
    else
        print("No active LSP clients")
    end
end

-- Post-Init Keybindings
-- nothing in there rn so I commented it out
--require("setup.postkeybinds")

--require("plugins.molten").init()
