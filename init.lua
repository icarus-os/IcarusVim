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

-- Configure telescope here since I'm lazy
-- require("telescope").setup({
--   defaults = {
--     file_ignore_patterns = {
--       "node_modules/.*", -- Ignore everything under node_modules
--       ".git/.*", -- Ignore everything under .git
--       ".pixi/.*", -- Ignore everything under .pixi
--       "__pycache__/.*", -- Ignore everything under __pycache__
--       ".ipynb_checkpoints/.*", -- Ignore everything under .ipynb_checkpoints
--       ".mypy_cache/.*", -- Ignore everything under .mypy_cache
--       "ruff_cache/.*", -- Ignore everything under ruff_cache
--       ".pytest_cache/.*", -- Ignore everything under .pytest_cache
--       ".venv/.*", -- Ignore everything under .venv
--     },
--   },
-- })

-- require("which-key").setup(
--   -- which-key helps you remember key bindings by showing a popup
--   -- with the active keybindings of the command you started typing.
--   {
--     event = "VeryLazy",
--     opts_extend = { "spec" },
--     opts = {
--       defaults = {},
--       spec = {
--         {
--           mode = { "n", "v" },
--           { "<leader><tab>", group = "tabs" },
--           { "<leader>c", group = "code" },
--           { "<leader>f", group = "file/find" },
--           { "<leader>g", group = "git" },
--           { "<leader>gh", group = "hunks" },
--           { "<leader>q", group = "quit/session" },
--           { "<leader>s", group = "search" },
--           { "<leader>u", group = "ui", icon = { icon = "󰙵 ", color = "cyan" } },
--           { "<leader>x", group = "diagnostics/quickfix", icon = { icon = "󱖫 ", color = "green" } },
--           { "[", group = "prev" },
--           { "]", group = "next" },
--           { "g", group = "goto" },
--           { "gs", group = "surround" },
--           { "z", group = "fold" },
--           {
--             "<leader>b",
--             group = "buffer",
--             expand = function()
--               return require("which-key.extras").expand.buf()
--             end,
--           },
--           {
--             "<leader>w",
--             group = "windows",
--             proxy = "<c-w>",
--             expand = function()
--               return require("which-key.extras").expand.win()
--             end,
--           },
--           -- better descriptions
--           { "gx", desc = "Open with system app" },
--         },
--       },
--     },
--     keys = {
--       {
--         "<leader>?",
--         function()
--           require("which-key").show({ global = false })
--         end,
--         desc = "Buffer Keymaps (which-key)",
--       },
--       -- {
--       --   "<c-w><space>",
--       --   function()
--       --     require("which-key").show({ keys = "<c-w>", loop = true })
--       --   end,
--       --   desc = "Window Hydra Mode (which-key)",
--       -- },
--     },
--     config = function(_, opts)
--       local wk = require("which-key")
--       wk.setup(opts)
--       if not vim.tbl_isempty(opts.defaults) then
--         LazyVim.warn("which-key: opts.defaults is deprecated. Please use opts.spec instead.")
--         wk.register(opts.defaults)
--       end
--     end,
--   }
-- )

--require("plugins.molten").init()
