return {
  "mikavilpas/yazi.nvim",
  event = "VeryLazy",
  keys = {
    -- 👇 in this section, choose your own keymappings!
    {
      "<leader>yy",
      "<cmd>Yazi<cr>",
      --"<cmd>yy<cr>",
      desc = "Open yazi at the current file",
    },
    {
      -- Open in the current working directory
      "<leader>YY",
      "<cmd>Yazi cwd<cr>",
      --"<cmd>yy cwd<cr>",
      desc = "Open the file manager in nvim's working directory",
    },
    {
      -- NOTE: this requires a version of yazi that includes
      -- https://github.com/sxyazi/yazi/pull/1305 from 2024-07-18
      "yy",
      "<cmd>Yazi toggle<cr>",
      --"<cmd>yy toggle<cr>",
      desc = "Resume the last yazi session",
    },
  },
  ---@type YaziConfig
  opts = {
    -- if you want to open yazi instead of netrw, see below for more info
    open_for_directories = false,
    keymaps = {
      show_help = "<f1>",
      open_file_in_vertical_split = "|",
      open_file_in_horizontal_split = "-",
      open_file_in_tab = "<c-t>",
      grep_in_directory = "<c-/>",
      replace_in_directory = "<c-g>",
      cycle_open_buffers = "<tab>",
      copy_relative_path_to_selected_files = "<c-y>",
      send_to_quickfix_list = "<c-q>",
      change_working_directory = "<c-\\>",
    },

    -- what Neovim should do a when a file was opened (selected) in yazi.
    -- Defaults to simply opening the file.
    --open_file_function = function(chosen_file, config, state) end,

    -- the type of border to use for the floating window. Can be many values,
    -- including 'none', 'rounded', 'single', 'double', 'shadow', etc. For
    -- more information, see :h nvim_open_win
    yazi_floating_window_border = "rounded",

    -- some yazi.nvim commands copy text to the clipboard. This is the register
    -- yazi.nvim should use for copying. Defaults to "*", the system clipboard
    clipboard_register = "*",

    hooks = {
      -- if you want to execute a custom action when yazi has been opened,
      -- you can define it here.
      yazi_opened = function(preselected_path, yazi_buffer_id, config)
        -- you can optionally modify the config for this specific yazi
        -- invocation if you want to customize the behaviour
      end,

      -- when yazi was successfully closed
      yazi_closed_successfully = function(chosen_file, config, state) end,

      -- when yazi opened multiple files. The default is to send them to the
      -- quickfix list, but if you want to change that, you can define it here
      --yazi_opened_multiple_files = function(chosen_files, config, state) end,
    },

    -- highlight buffers in the same directory as the hovered buffer
    highlight_hovered_buffers_in_same_directory = true,

    -- integrations = {
    --   --- What should be done when the user wants to grep in a directory
    --   -- grep_in_directory = function(directory)
    --   --   -- the default implementation uses telescope if available, otherwise nothing
    --   -- end,
    --   -- grep_in_selected_files = function(selected_files)
    --   --   -- similar to grep_in_directory, but for selected files
    --   -- end,
    --   -- --- Similarly, search and replace in the files in the directory
    --   -- replace_in_directory = function(directory)
    --   --   -- default: grug-far.nvim
    --   -- end,
    --   -- replace_in_selected_files = function(selected_files)
    --   --   -- default: grug-far.nvim
    --   -- end,
    --   -- -- `grealpath` on OSX, (GNU) `realpath` otherwise
    --   -- resolve_relative_path_application = ""
    -- },
  },
}
