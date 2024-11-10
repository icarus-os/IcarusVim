return {
  "LunarVim/bigfile.nvim",
  opts = {
    filesize = 2, -- MiB (2 MiB is just over 2MB)
    features = {
      "indent_blankline",
      "lsp",
      "treesitter",
      "syntax",
      "vimopts",
      "filetype",
      {
        name = "neoscroll",
        disable = function()
          vim.api.nvim_buf_set_var(0, "disable_neoscroll", true)
        end,
      },
    },
  },
}
