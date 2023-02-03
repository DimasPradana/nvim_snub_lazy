-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- escape keymap
vim.keymap.set("i", "jk", "<esc>")
vim.keymap.set("t", "jk", "<C-\\><C-n>")
vim.keymap.set("c", "jk", "<esc>")

-- move cursor on insert mode
vim.keymap.set("i", "<A-l>", "<right>")
vim.keymap.set("i", "<A-h>", "<left>")
vim.keymap.set("i", "<A-k>", "<up>")
vim.keymap.set("i", "<A-j>", "<down>")

-- source
vim.keymap.set("n", "<leader>s", "<cmd>source %<cr>")
