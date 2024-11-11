return {
  { import = "lazyvim.plugins.extras.editor.telescope" }, -- use the lazyvim defaults and override them
  { "nvim-telescope/telescope-live-grep-args.nvim" },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      PlugHook({
        "telescope.nvim",
        on_load = function()
          --vim.notify("Loaded telescope!")
          require("telescope").load_extension("live_grep_args")
        end,
        from_dependency = "nvim-telescope/telescope-live-grep-args.nvim",
        additional_dependency_data = {},
      }),
    },
    opts = {
      defaults = {
        file_ignore_patterns = {
          "node_modules/.*", -- Ignore everything under node_modules
          ".git/.*", -- Ignore everything under .git
          ".pixi/.*", -- Ignore everything under .pixi
          "__pycache__/.*", -- Ignore everything under __pycache__
          ".ipynb_checkpoints/.*", -- Ignore everything under .ipynb_checkpoints
          ".mypy_cache/.*", -- Ignore everything under .mypy_cache
          "ruff_cache/.*", -- Ignore everything under ruff_cache
          ".pytest_cache/.*", -- Ignore everything under .pytest_cache
          ".venv/.*", -- Ignore everything under .venv
        },
      },
      extensions = {
        live_grep_args = {
          mappings = {
            i = {
              ["<C-k>"] = function(picker)
                require("telescope-live-grep-args.actions").quote_prompt()(picker)
              end,
            },
          },
        },
      },
    },
    keys = {
      {
        "<leader>/",
        function()
          require("telescope").extensions.live_grep_args.live_grep_args()
        end,
        desc = "Grep with Args (root dir)",
      },
    },
  },
}
