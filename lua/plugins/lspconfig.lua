local NB_OPTIONS = require("globals.navbuddy")

return {
  "neovim/nvim-lspconfig",
  dependencies = {
    {
      "AmeerArsala/nvim-navbuddy",
      dependencies = {
        "SmiteshP/nvim-navic",
        "MunifTanjim/nui.nvim",
      },
      opts = {
        lsp = { auto_attach = true },
        window = NB_OPTIONS.window
      }
    },
  },
  -- your lsp config or other stuff
  opts = function ()
    local keys = require("lazyvim.plugins.lsp.keymaps").get()

    -- disable a keymap
    keys[#keys + 1] = { "<c-k>", false, mode = 'i' }
  end
}
