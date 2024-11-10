return {
  { import = "lazyvim.plugins.extras.editor.telescope" }, -- use the lazyvim defaults and override them
  {
    "nvim-telescope/telescope.nvim",
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
    },
  },
}
