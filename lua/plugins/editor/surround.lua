return {
  { import = "lazyvim.plugins.extras.coding.mini-surround" },
  {
    "echasnovski/mini.surround",
    recommended = true,
    keys = function(_, keys)
      -- Populate the keys based on the user's options
      local opts = LazyVim.opts("mini.surround")
      local mappings = {
        { opts.mappings.add, desc = "Add Surrounding", mode = { "n", "v" } },
        { opts.mappings.delete, desc = "Delete Surrounding" },
        { opts.mappings.find, desc = "Find Right Surrounding" },
        { opts.mappings.find_left, desc = "Find Left Surrounding" },
        { opts.mappings.highlight, desc = "Highlight Surrounding" },
        { opts.mappings.replace, desc = "Replace Surrounding" },
        { opts.mappings.update_n_lines, desc = "Update `MiniSurround.config.n_lines`" },
      }
      mappings = vim.tbl_filter(function(m)
        return m[1] and #m[1] > 0
      end, mappings)
      return vim.list_extend(mappings, keys)
    end,
    opts = {
      mappings = {
        add = "gsa", -- Add surrounding in Normal and Visual modes
        delete = "gsd", -- Delete surrounding
        find = "gsf", -- Find surrounding (to the right)
        find_left = "gsF", -- Find surrounding (to the left)
        highlight = "gsh", -- Highlight surrounding
        replace = "gsr", -- Replace surrounding
        update_n_lines = "gsn", -- Update `n_lines`
      },
    },
  },

  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    opts = {
      surrounds = {
        ["l"] = {
          add = function()
            local ft = vim.api.nvim_get_option_value("filetype", { buf = 0 })
            local clipboard = vim.fn.getreg("+")
            if ft == "norg" then
              return { { ("{%s}["):format(clipboard) }, { "]" } }
            end
            -- default to markdown-style link
            return { { "[" }, { "](" .. clipboard .. ")" } }
          end,
          find = function()
            local config = require("nvim-surround.config")
            local ft = vim.api.nvim_get_option_value("filetype", { buf = 0 })
            if ft == "norg" then
              return config.get_selection({ node = "link" })
            end
            return config.get_selection({ node = "inline_link" })
          end,
          -- TODO: add support for norg links
          delete = "(%[)().-(%]%(.-%))()",
        },
      },
    },
  },
}
