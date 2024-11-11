--  _____ _
-- |_   _| |__   ___ _ __ ___   ___
--   | | | '_ \ / _ \ '_ ` _ \ / _ \
--   | | | | | |  __/ | | | | |  __/
--   |_| |_| |_|\___|_| |_| |_|\___|
--

local M = {}

-- EDIT THESE VARIABLES TO CHANGE THEME ON STARTUP
M.colorscheme = "tokyonight-night" -- color scheme name
M.colorsThemeModule = "tokyonight.colors"

M.colorsTheme = nil
M.getColorsTheme = function()
  if M.colorsTheme ~= nil then
    return M.colorsTheme
  end

  -- Otherwise, set the thing up
  M.colorsTheme = require(M.colorsThemeModule).setup()
  return M.colorsTheme
end
M.apply = function()
  -- Execute the command
  vim.cmd("colorscheme " .. M.colorscheme)
end

return M
