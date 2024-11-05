-- Don't make a habit of using this function in this file
-- Arbitrary mode key mapping function
-- modes: {"i", "n"} to do both insert and normal mode for example
local function keymap(modes, lhs, rhs, opts)
  local options = { noremap = true, silent = true }

  if opts then
    options = vim.tbl_extend("force", options, opts)
  end

  for index, value in ipairs(modes) do
    vim.api.nvim_set_keymap(value, lhs, rhs, options)
  end
end

--vim.api.nvim_del_keymap('n', "<c-w><space>")
