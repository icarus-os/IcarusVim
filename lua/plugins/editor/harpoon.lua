return {
  { import = "lazyvim.plugins.extras.editor.harpoon2" },
  {
    --"benlubas/harpoon", -- fork that caches the git branch key, and adds some highlights and stuff
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    -- config = function()
    --   --   --local theme = require("benlubas.color")
    --   --   -- vim.api.nvim_set_hl(0, "HarpoonBorder", theme.fancy_float.border)
    --   --   -- vim.api.nvim_set_hl(0, "HarpoonWindow", theme.fancy_float.window)
    --   --   -- vim.api.nvim_set_hl(0, "HarpoonTitle", theme.fancy_float.title)
    --   --   -- vim.api.nvim_set_hl(0, "HarpoonCurrent", { fg = theme.harpoon_current })
    --   --
    --   local harpoon = require("harpoon")
    --   harpoon:setup()
    -- end,
    opts = {
      menu = {
        width = (function()
          local width = vim.api.nvim_win_get_width(0) - 4
          return math.floor(width - width * 0.55)
        end)(),
      },
      excluded_filetypes = { "harpoon", "starter", "oil", "molten_output" },
      settings = {
        save_on_toggle = true,
      },
    },
    keys = function()
      local keys = {
        {
          "<leader>H",
          function()
            require("harpoon"):list():add()
          end,
          desc = "Harpoon: Mark File",
        },
        {
          "<C-;>",
          function()
            require("harpoon"):list():add()
          end,
          desc = "Harpoon: Mark File",
        },
        {
          "<leader>h",
          function()
            local harpoon = require("harpoon")
            harpoon.ui:toggle_quick_menu(harpoon:list())
          end,
          desc = "Harpoon: Quick Menu",
        },
        {
          "<leader><Right>",
          function()
            local harpoon = require("harpoon")
            harpoon:list():next()
          end,
          desc = "Harpoon to Next File",
        },
        {
          "<leader><Left>",
          function()
            local harpoon = require("harpoon")
            harpoon:list():prev()
          end,
          desc = "Harpoon to Previous File",
        },
      }

      -- For 1-9 and then 0 for 10

      for i = 1, 9 do
        table.insert(keys, {
          "<leader>" .. i,
          function()
            require("harpoon"):list():select(i)
          end,
          desc = "Harpoon to File " .. i,
        })
      end

      -- Also do 0 for 10
      table.insert(keys, {
        "<leader>0",
        function()
          require("harpoon"):list():select(10)
        end,
        desc = "Harpoon to File 10",
      })
      return keys
    end,
  },
}
