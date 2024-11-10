return {
  "folke/which-key.nvim",
  -- opts = function(_, opts)
  --   return {
  --     defaults = {},
  --     spec = {
  --       {
  --         mode = { "n", "v" },
  --         { "<leader><tab>", group = "tabs" },
  --         { "<leader>c", group = "code" },
  --         { "<leader>f", group = "file/find" },
  --         { "<leader>g", group = "git" },
  --         { "<leader>gh", group = "hunks" },
  --         { "<leader>q", group = "quit/session" },
  --         { "<leader>s", group = "search" },
  --         { "<leader>u", group = "ui", icon = { icon = "󰙵 ", color = "cyan" } },
  --         { "<leader>x", group = "diagnostics/quickfix", icon = { icon = "󱖫 ", color = "green" } },
  --         { "[", group = "prev" },
  --         { "]", group = "next" },
  --         { "g", group = "goto" },
  --         { "gs", group = "surround" },
  --         { "z", group = "fold" },
  --         {
  --           "<leader>b",
  --           group = "buffer",
  --           expand = function()
  --             return require("which-key.extras").expand.buf()
  --           end,
  --         },
  --         {
  --           "<leader>w",
  --           group = "windows",
  --           proxy = "<A-w>",
  --           expand = function()
  --             return require("which-key.extras").expand.win()
  --           end,
  --         },
  --         -- better descriptions
  --         { "gx", desc = "Open with system app" },
  --       },
  --     },
  --   }
  -- end,
  keys = function(_, opts)
    return {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Keymaps (which-key)",
      },
      -- {
      --   "<c-w><space>",
      --   function()
      --     require("which-key").show({ keys = "<c-w>", loop = true })
      --   end,
      --   desc = "Window Hydra Mode (which-key)",
      -- },
    }
  end,
}
