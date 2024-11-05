return {
  "neovim/nvim-lspconfig",
  dependencies = {
    {
      "SmiteshP/nvim-navbuddy",
      dependencies = {
        "SmiteshP/nvim-navic",
        "MunifTanjim/nui.nvim",
      },
      opts = { lsp = { auto_attach = true } }
    },
  },
  -- your lsp config or other stuff
  opts = function ()
    local keys = require("lazyvim.plugins.lsp.keymaps").get()

    -- disable a keymap
    keys[#keys + 1] = { "<c-k>", false, mode = 'i' }
  end
}
