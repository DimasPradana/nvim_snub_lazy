-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- load colorscheme
require("tokyonight").load()

-- Visual
vim.o.conceallevel = 0 -- Make `` Visible in Markdown
vim.o.cmdheight = 1 -- Better Error Messages
vim.o.showtabline = 2 -- Always Show Tabline
vim.o.pumheight = 5 -- Pop up Menu Height
vim.wo.number = true -- Display Line Number
vim.wo.relativenumber = true -- Make relative line numbers default
vim.o.termguicolors = true -- Set Terminal Colors
-- vim.o.title           = true    -- Display File Info on Title
vim.o.showmode = false -- Show MODES
vim.wo.signcolumn = "yes" -- Sign Column
vim.o.iminsert = 1 -- set iminsert
vim.o.imsearch = 1 -- set imsearch
-- folding
-- vim.wo.foldenable     = true	-- Enable Folding
-- vim.wo.foldmethod     = 'expr'	-- Folding Method
-- vim.wo.foldexpr       = 'nvim_treesitter#foldexpr()'	-- Folding Expression
-- vim.wo.foldmethod='expr'
-- vim.wo.foldexpr       = 'nvim_treesitter#foldexpr()'
-- vim.wo.foldtext       = 'MyFoldText()'
-- vim.wo.foldtext=[[substitute(getline(v:foldstart),'\\t',repeat('\ ',&tabstop),'g').'...'.trim(getline(v:foldend)) ]]
-- vim.wo.fillchars = "fold:\\"
vim.wo.foldnestmax = 3
vim.wo.foldminlines = 1
vim.opt.laststatus = 3

-- Vim specific
vim.o.hidden = true -- Do not save when switching buffers
vim.o.breakindent = true -- Enable break indent
vim.o.backup = false -- Disable Backup
vim.o.swapfile = false -- Don't create Swap Files
vim.o.spell = false
vim.o.undofile = true -- Save undo history
vim.o.updatetime = 250 -- Decrease update time
vim.o.timeoutlen = 250 -- Time for mapped sequence to complete (in ms)
vim.o.inccommand = "nosplit" -- Incremental live completion
vim.o.fileencoding = "utf-8" -- Set File Encoding
vim.o.spelllang = "en"
vim.o.completeopt = "menu,menuone,noselect,noinsert,preview" -- Autocompletion
vim.o.wrap = false -- set no wrap
vim.opt.shortmess:append({ W = true, a = true })
vim.o.undodir = vim.fn.stdpath("cache") .. "/undo"

-- Behavior
vim.o.hlsearch = false -- Set highlight on search
vim.o.ignorecase = true -- Case insensitive searching
vim.o.smartcase = true -- If Upper Case Char > case sensitive search
vim.o.smarttab = true -- Smart Tabs
vim.o.smartindent = true -- Smart Indenting
vim.o.splitbelow = true -- Force Split Below
vim.o.splitright = true -- Force Split Right
vim.o.expandtab = true
vim.o.tabstop = 2 -- Tabstop
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
-- vim.o.scrolloff     = 99 -- Vertical Scroll Offset
-- vim.o.scrolloff       = 21  	    -- Vertical Scroll Offset
vim.o.sidescrolloff = 8 -- Horizontal Scroll Offset
vim.o.mouse = "a" -- Enable mouse mode

-- Disable some default plugins
vim.g.loaded_2html_plugin = false

vim.g.getscript = false
vim.g.getscriptPlugin = false
vim.g.logipath = false
vim.g.netrw = false
vim.g.netrwPlugin = false
vim.g.netrwSettings = false
vim.g.netrwFileHandlers = false
vim.g.tar = false
vim.g.rrhelper = false
vim.g.spellfile_plugin = false
vim.g.vimball = false
vim.g.vimballPlugin = false
vim.g.zip = false

vim.g.loaded_gzip = false
vim.g.loaded_matchit = false
vim.g.loaded_netrwPlugin = false
vim.g.loaded_tarPlugin = false
vim.g.loaded_zipPlugin = false
vim.g.loaded_man = false
vim.g.loaded_remote_plugins = false
vim.g.did_load_filetypes = false

-- winbar
-- vim.o.winbar = "%{%v:lua.require('utils').eval()%}"

-- navic
-- vim.o.statusline = "%{%v:lua.require'nvim-navic'.get_location()%}"

-- formatter on save
-- vim.api.nvim_exec(
-- -- [[
-- -- augroup FormatAutogroup
-- --   autocmd!
-- --   " autocmd BufWritePost,TextChanged,InsertLeave * undojoin | Neoformat
-- --   autocmd BufWritePost,TextChanged * undojoin | Neoformat
-- -- augroup END
-- -- ]],
--   [[
-- 	augroup FormatAutogroup
-- 	  autocmd!
-- 	  " autocmd BufWritePost,TextChanged * undojoin | lua vim.lsp.buf.formatting_sync()
-- 	  " autocmd BufWritePost,TextChanged * undojoin | lua vim.lsp.buf.format()
-- 	  autocmd BufWritePost * undojoin | lua vim.lsp.buf.format()
-- 	augroup END
-- 	]],
--   true
-- )

-- Highlight on yank
vim.api.nvim_exec(
  [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup END
]],
  false
)

-- NOTE: cabbrev from W to w
vim.cmd([[
	cnoreabbrev W! w!
	cnoreabbrev Q! q!
	cnoreabbrev Qall! qall!
	cnoreabbrev Wq wq
	cnoreabbrev Wa wa
	cnoreabbrev WA wa
	cnoreabbrev wQ wq
	cnoreabbrev WQ wq
	cnoreabbrev W w
	cnoreabbrev Q q
	cnoreabbrev Qa qa
	cnoreabbrev Qall qall
]])

-- NOTE: ketika *.blade.php set filetype ke laravel
vim.cmd([[
  autocmd BufRead,BufNewFile *.blade.php set filetype=laravel
]])

-- NOTE: ketika *.sql set filetype ke sql
vim.cmd([[
  autocmd BufRead,BufNewFile *.sql set filetype=sql
]])

-- NOTE: code_action
-- vim.cmd([[
--  autocmd CursorHold,CursorHoldI * lua require('code_action_utils').code_action_listener()
-- ]])

-- vim:fileencoding=utf-8:ft=lua:foldmethod=marker
