return {
  {
    "benlubas/harpoon", -- fork that caches the git branch key, and adds some highlights and stuff
    config = function()
      --local theme = require("benlubas.color")
      -- vim.api.nvim_set_hl(0, "HarpoonBorder", theme.fancy_float.border)
      -- vim.api.nvim_set_hl(0, "HarpoonWindow", theme.fancy_float.window)
      -- vim.api.nvim_set_hl(0, "HarpoonTitle", theme.fancy_float.title)
      -- vim.api.nvim_set_hl(0, "HarpoonCurrent", { fg = theme.harpoon_current })

      require("harpoon").setup({
        menu = {
          width = (function()
            local width = vim.api.nvim_win_get_width(0) - 4
            return math.floor(width - width * 0.55)
          end)(),
          borderchars = Border,
        },
        excluded_filetypes = { "harpoon", "starter", "oil", "molten_output" },
      })
    end,
    keys = {
      {
        mode = { "n", "v" },
        "<C-;>",
        function()
          require("harpoon.mark").add_file()
        end,
        desc = "add current file to harpoon menu",
      },
      {
        mode = { "n", "v" },
        "<C-'>",
        function()
          require("harpoon.ui").toggle_quick_menu(vim.api.nvim_buf_get_name(0))
        end,
        desc = "open harpoon menu",
      },

      {
        mode = { "n" },
        "<C-1>",
        function()
          require("harpoon.ui").nav_file(1)
        end,
      },
      {
        mode = { "n" },
        "<C-2>",
        function()
          require("harpoon.ui").nav_file(2)
        end,
      },
      {
        mode = { "n" },
        "<C-3>",
        function()
          require("harpoon.ui").nav_file(3)
        end,
      },
      {
        mode = { "n" },
        "<C-4>",
        function()
          require("harpoon.ui").nav_file(4)
        end,
      },
      {
        mode = { "n" },
        "<C-5>",
        function()
          require("harpoon.ui").nav_file(5)
        end,
      },
      {
        mode = { "n" },
        "<C-6>",
        function()
          require("harpoon.ui").nav_file(6)
        end,
      },
      {
        mode = { "n" },
        "<C-7>",
        function()
          require("harpoon.ui").nav_file(7)
        end,
      },
      {
        mode = { "n" },
        "<C-8>",
        function()
          require("harpoon.ui").nav_file(8)
        end,
      },
      {
        mode = { "n" },
        "<C-9>",
        function()
          require("harpoon.ui").nav_file(9)
        end,
      },
    },
  },
}
