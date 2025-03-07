-- MarkdownMode = function()
--   return vim.g.started_by_firenvim or vim.env["MD_MODE"] == "1"
-- end

return {
  "3rd/image.nvim",
  -- "benlubas/image.nvim",
  --dev = true,
  -- enabled = false,
  --cond = not MarkdownMode(),
  dependencies = { "https://github.com/leafo/magick" },
  --ft = { "markdown", "norg" },
  opts = {
    backend = "kitty",
    integrations = {
      markdown = {
        enabled = true,
        clear_in_insert_mode = false,
        download_remote_images = false,
        only_render_image_at_cursor = false,
        filetypes = { "markdown", "quarto" }, -- markdown extensions (ie. quarto) can go here
      },
      neorg = {
        enabled = true,
        clear_in_insert_mode = false,
        download_remote_images = false,
        only_render_image_at_cursor = false,
        filetypes = { "norg" },
      },
    },
    max_width = 100,
    max_height = 8,
    max_height_window_percentage = math.huge,
    max_width_window_percentage = math.huge,
    window_overlap_clear_enabled = true, -- toggles images when windows are overlapped
    editor_only_render_when_focused = true, -- auto show/hide images when the editor gains/looses focus
    tmux_show_only_in_active_window = true, -- auto show/hide images in the correct Tmux window (needs visual-activity off)
    window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "fidget", "" },
  },
}
