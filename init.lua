-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Theme
local theme = require("globals.theme")
theme.apply()

-- Util functions
function Print_LSP_Clients()
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

--local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
--vim.notify(lazypath)

-- Post-Init Keybindings
-- nothing in there rn so I commented it out
--require("setup.postkeybinds")

--require("plugins.molten").init()
