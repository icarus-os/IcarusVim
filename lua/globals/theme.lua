local M = {}

-- EDIT THESE VARIABLES TO CHANGE THEME ON STARTUP
M.colorscheme = "tokyonight-moon" -- color scheme name
M.colorsThemeModule = "tokyonight.colors"

M.colorsTheme = nil
M.getColorsTheme = function ()
  if M.colorsTheme ~= nil then
    return M.colorsTheme
  end

  -- Otherwise, set the thing up
  M.colorsTheme = require(M.colorsThemeModule).setup()
  return M.colorsTheme
end
M.apply = function ()
  -- Execute the command
  vim.cmd("colorscheme " .. M.colorscheme)
end

return M
