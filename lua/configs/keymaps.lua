-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local Utils = require("configs.util")
local M = {}

local exprnnoremap = Utils.exprnnoremap
local nnoremap = Utils.nnoremap
-- local vnoremap = Utils.vnoremap
-- local xnoremap = Utils.xnoremap
local inoremap = Utils.inoremap
local tnoremap = Utils.tnoremap
local cnoremap = Utils.cnoremap
-- local nmap = Utils.tnoremap

-- {{{ custom key
function M.snubCustomKey(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

-- center next, prev and line concatenate
nnoremap("n", "nzzzv")
nnoremap("N", "Nzzzv")

-- word wraps
exprnnoremap("k", "v:count == 0 ? 'gk':'k'")
exprnnoremap("j", "v:count == 0 ? 'gj':'j'")

-- tambah baris kosong diatas
vim.keymap.set("n", "<A-O>", function()
  M.snubCustomKey("O", "n")
  M.snubCustomKey("<esc>", "n")
  M.snubCustomKey("gj", "n")
  -- snubCustomKey("zz", "n")
end)

-- tambah baris kosong dibawah
vim.keymap.set("n", "<A-o>", function()
  M.snubCustomKey("o", "n")
  M.snubCustomKey("<esc>", "n")
  M.snubCustomKey("gk", "n")
  -- snubCustomKey("zz", "n")
end)

-- }}}

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
-- vim.keymap.set("n", "<leader>s", "<cmd>source %<cr>")

-- close buffer
vim.keymap.set("n", "<A-j>", "<CMD>bd!<CR>")

-- open terminal
vim.keymap.set("n", "<F12>", "<CMD>vsplit | terminal<CR>")
vim.keymap.set("x", "<F12>", "<CMD>vsplit | terminal<CR>")
vim.keymap.set("i", "<F12>", "<CMD>vsplit | terminal<CR>")

-- pindah ke split
vim.keymap.set("n", "<A-L>", "<CMD>wincmd l<CR>")
vim.keymap.set("n", "<A-K>", "<CMD>wincmd k<CR>")
vim.keymap.set("n", "<A-J>", "<CMD>wincmd j<CR>")
vim.keymap.set("n", "<A-H>", "<CMD>wincmd h<CR>")

-- open copilot panel
vim.keymap.set("i", "<F11>", "<CMD>Copilot panel<CR>")

-- vim:fileencoding=utf-8:ft=lua:foldmethod=marker
