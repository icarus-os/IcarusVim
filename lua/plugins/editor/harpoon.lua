return {
  { import = "lazyvim.plugins.extras.editor.harpoon2" },
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    opts = {
      menu = {
        width = (function()
          local width = vim.api.nvim_win_get_width(0) - 4
          return math.floor(width - (width * 0.55))
        end)(),
      },
      excluded_filetypes = { "harpoon", "starter", "oil", "molten_output" },
      settings = {
        save_on_toggle = true,
      },
    },
    keys = function()
      local function toggle_telescope(harpoon_files)
        local conf = require("telescope.config").values
        local file_paths = {}
        for _, item in ipairs(harpoon_files.items) do
          table.insert(file_paths, item.value)
        end

        require("telescope.pickers")
          .new({}, {
            prompt_title = "Harpoon",
            finder = require("telescope.finders").new_table({
              results = file_paths,
            }),
            previewer = conf.file_previewer({}),
            sorter = conf.generic_sorter({}),
          })
          :find()
      end

      local keys = {
        {
          "<leader>h",
          function()
            local harpoon = require("harpoon")
            harpoon.ui:toggle_quick_menu(harpoon:list(), { title = "HARPOON", height_in_lines = 10 })
          end,
          desc = "Harpoon: Quick Menu",
        },
        {
          "<leader>H",
          function()
            local harpoon = require("harpoon")
            toggle_telescope(harpoon:list())
          end,
          desc = "Harpoon: Toggle Telescope Menu",
        },
        {
          "<C-;>",
          function()
            local harpoon = require("harpoon")
            harpoon:list():add()
          end,
          desc = "Harpoon: Mark File",
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

      -- HARPOONING to specific entries
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

      -- MARKING specific entries
      -- For 1-9 and then 0 for 10
      for i = 1, 9 do
        table.insert(keys, {
          "<C-" .. i .. ">",
          function()
            require("harpoon"):list():replace_at(i)
          end,
          desc = "Harpoon: Mark file as File " .. i,
        })
      end

      -- Also do 0 for 10
      table.insert(keys, {
        "<C-0>",
        function()
          require("harpoon"):list():replace_at(10)
        end,
        desc = "Harpoon: Mark file as File 10",
      })
      return keys
    end,
  },
}
