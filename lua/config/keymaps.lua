-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- vim.keymap.set(
--   "n",
--   "<leader>sx",
--   require("telescope.builtin").resume,
--   { noremap = true, silent = true, desc = "Resume" }
-- )

-- Function to map keys in insert mode ('i')
local function imap(lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap("i", lhs, rhs, options)
end

-- Function to map keys in normal mode ('n')
local function nmap(lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap("n", lhs, rhs, options)
end

-- Function to map keys in visual mode ('v')
local function vmap(lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap("v", lhs, rhs, options)
end

-- Function to map keys in selection mode ('s')
local function smap(lhs, rhs, opts)
  local options = { noremap = true, silent = true }

  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap("s", lhs, rhs, options)
end

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

-- Navbuddy
nmap("<C-,>", "<cmd>Navbuddy<CR>")
imap("<C-,>", "<Esc><cmd>Navbuddy<CR>")

-- Arrow keys more natural in normal mode
nmap("<C-Right>", "<S-Right>", {})
nmap("<C-Left>", "<S-Left>", {})

-- Mapping for CTRL + N (new buffer/tab)
imap("<C-n>", "<Esc><cmd>enew<CR>", {})
nmap("<C-n>", "<cmd>enew<CR>", {})

-- Fun fact: To open the terminal, it is CTRL + /
-- if I need a separate terminal tab, it would be :term

-- Scrolling
nmap("<C-Up>", "<C-Y>")
nmap("<C-Down>", "<C-E>")
imap("<C-Up>", "<C-O><C-Y>")
imap("<C-Down>", "<C-O><C-E>")

-- Switch tabs
-- next
imap("<C-E>", "<C-O>:bnext<CR>", {})
nmap("<C-E>", "<cmd>bnext<CR>", {})
-- prev
imap("<C-Q>", "<C-O>:bprev<CR>", {})
nmap("<C-Q>", "<cmd>bprev<CR>", {})
-- Alternatively, you could do Shift+H and Shift+L for left and right switches respectively

-- Switching windows
imap("<C-k>", "<C-O><C-W><Up>") -- up
-- imap("<C-j>", ) -- down
-- imap("<C-h>", ) -- left
imap("<C-l>", "<C-O><C-W><Right>") -- right

-- Fix CTRL + Backspace
--imap("<C-H>", "<C-O>:call novim_mode#EnterSelectionMode('left')<CR><C-S-Left><Backspace>", {})
imap("<C-bs>", "<C-O>:call novim_mode#EnterSelectionMode('left')<CR><C-S-Left><Backspace>", {})

-- Mass Commenting with ALT+x
local comment_api = require("Comment.api")
vim.keymap.set("s", "<A-x>", comment_api.call("toggle.linewise", "g@"), { expr = true })
vim.keymap.set("v", "<A-x>", comment_api.call("toggle.linewise", "g@"), { expr = true })
--smap("<A-x>", "<C-O>:call novim_mode#EnterSelectionMode('comment')<CR>")

-- Fix keys like CTRL+C, CTRL+Z, even CTRL+V

-- The `i` version is done automatically by vimcest
nmap("<C-z>", "u")
vmap("<C-z>", "u")
nmap("<C-y>", "<cmd>redo<CR>") -- redo
vmap("<C-c>", '"+y')
nmap("<C-v>", '"+pi')

-- TODO: fix the bug where backspace/delete on selection copies it

-- Low-effort esc (ALT + Q). This is only useful on laptops where you use the built-in keyboard. otherwise, split keyboard ftw
--imap("<A-q>", "<Esc>")

-- Increment/Decrement values
vim.keymap.set("n", "<C-PageUp>", function()
  require("dial.map").manipulate("increment", "normal")
end)

vim.keymap.set("n", "<C-PageDown>", function()
  require("dial.map").manipulate("decrement", "normal")
end)

-- Rename all
vim.keymap.set("n", "<leader>rn", function()
  return ":IncRename " .. vim.fn.expand("<cword>")
end, { expr = true })

-- Overseer (Task Runner)
nmap("<leader>;", "<cmd>OverseerRun<CR>")

-- NOTE: the functions below MUST be global (no local indicator) in order to run in the string commands

-- Will move to the previous line if at the start of a line
function Attempt_Move_Left()
  if vim.fn.col(".") ~= 1 then
    -- Base case: do nothing
    vim.cmd("normal! h") -- literally just move left
  else
    -- Move to end of previous line
    vim.cmd("normal! k$")
  end
end

-- Will move to the next line if at the end of a line
function Attempt_Move_Right()
  if vim.fn.col(".") ~= vim.fn.col("$") then
    -- Base Case
    vim.cmd("normal! l") -- literally just move right
  else
    -- Move to start of next line
    vim.cmd("normal! j0")
  end
end

-- Will move to the start of the line if on the first line
function Attempt_Move_Up()
  if vim.fn.line(".") ~= 1 then
    -- Base Case
    vim.cmd("normal! k") -- literally just move up
  else
    -- Move to the start of the line
    vim.cmd("normal! 0")
  end
end

-- Will move to the end of the line if on the last line
function Attempt_Move_Down()
  if vim.fn.line(".") ~= vim.fn.line("$") then
    -- Base Case
    vim.cmd("normal! j") -- literally just move down
  else
    -- Move to end of the line
    vim.cmd("normal! $")
  end
end

-- NOTE: if all these arrow hax start acting up, comment them out. They are a bit sus

-- Left
nmap("<Left>", "<cmd>lua Attempt_Move_Left()<CR>")
imap("<Left>", "<C-O><cmd>lua Attempt_Move_Left()<CR>")

-- Right
nmap("<Right>", "<cmd>lua Attempt_Move_Right()<CR>")
imap("<Right>", "<C-O><cmd>lua Attempt_Move_Right()<CR>")

-- Up
nmap("<Up>", "<cmd>lua Attempt_Move_Up()<CR>")
imap("<Up>", "<C-O><cmd>lua Attempt_Move_Up()<CR>")

-- Down
--keymap({ "i", "n" }, "<Down>", "<Down>")
nmap("<Down>", "<cmd>lua Attempt_Move_Down()<CR>")
imap("<Down>", "<C-O><cmd>lua Attempt_Move_Down()<CR>")

-- THE ANNOYING ONES

local function startsWithAsLowercase(text, prefix)
  return string.lower(text):find(prefix, 1, true) == 1
end

-- List all mappings starting with C-w
local cw_mappings = vim.api.nvim_get_keymap("n")
--vim.notify(dump(cw_mappings))

-- UNMAP EVERYTHING RELATED TO <C-w> SO IT CAN BE SET AGAIN. FUCK THESE PLUGINS
for _, mapping in pairs(cw_mappings) do
  -- Skip the C-w mapping itself
  if startsWithAsLowercase(mapping.lhs, "<c-w>") then
    vim.cmd("nunmap " .. mapping.lhs)
    --vim.notify(string.format("Unmapped: %s", mapping.lhs))
  end
end

--vim.notify("Mappings starting with C-w have been unmapped.")

-- Fuck off
--vim.cmd("nunmap <C-w>d")
--vim.cmd("nunmap <C-w><C-D>")

-- Mapping for CTRL + W (close the currently open tab)
imap("<C-w>", "<Esc><cmd>bd<CR>", {})
nmap("<C-w>", "<cmd>bd<CR>", {})
