-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set(
  "n",
  "<leader>sx",
  require("telescope.builtin").resume,
  { noremap = true, silent = true, desc = "Resume" }
)

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

-- Navbuddy
nmap("<C-p>", "<cmd>Navbuddy<CR>")
imap("<C-p>", "<Esc><cmd>Navbuddy<CR>")

-- Arrow keys more natural in normal mode
nmap("<C-Right>", "<S-Right>", {})
nmap("<C-Left>", "<S-Left>", {})

-- Mapping for CTRL + W (close the currently open tab)
imap("<C-w>", "<Esc><cmd>bd<CR>", {})
nmap("<C-w>", "<cmd>bd<CR>", {})

-- Mapping for CTRL + N (new buffer/tab)
imap("<C-n>", "<Esc><cmd>enew<CR>", {})
nmap("<C-n>", "<cmd>enew<CR>", {})

-- Fun fact: To open the terminal, it is CTRL + /
-- if I need a separate terminal tab, it would be :term

-- Moving lines (M == ALT)
--imap("<M-Up>", "<C-O>:m -2<CR>")
--imap("<M-Down>", "<C-Down>")

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
nmap("<C-Q>", "<cmd>bprev<CR>")

-- Fix CTRL + Backspace
imap("<C-H>", "<C-O>:call novim_mode#EnterSelectionMode('left')<CR><C-S-Left><Backspace>", {})
imap("<C-bs>", "<C-O>:call novim_mode#EnterSelectionMode('left')<CR><C-S-Left><Backspace>", {})

--TODO: fix getting to the last line
