return {
  {
    "numToStr/Comment.nvim",
    opts = {
      -- add any options here
    },
    lazy = false,
    --  config = function()
    -- 	require("Comment").setup({
    -- 		toggler = {
    -- 			---Line-comment toggle keymap
    -- 			line = "", -- It traslates to ALT /
    -- 		},
    -- 	})
    -- end
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  }
}
