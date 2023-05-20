-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- load colorscheme
require("tokyonight").load()
-- vim.cmd("colorscheme murphy")

-- Visual
vim.o.conceallevel = 0 -- Make `` Visible in Markdown
-- vim.o.cmdheight = 1 -- Better Error Messages
vim.o.cmdheight = 0 -- disable command-line when not being used
vim.o.showtabline = 1 -- Always Show Tabline
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
vim.opt.pastetoggle = "<F2>"
vim.opt.pumblend = 10 -- pseudo-transparency for the popup-menu, value : 0 - 100
vim.opt.clipboard = "unnamedplus" -- access system clipboard
vim.opt.cursorline = true -- highlight current line
vim.opt.colorcolumn = { "+1" } -- draw a vertical ruler at (textwidth + 1 )th column
vim.opt.fillchars = {
  foldopen = "",
  foldclose = "",
  diff = "/",
  eob = " ", -- use 'space' for lines after the last buffer line in a window
}
vim.opt.complete:remove({
  "u", -- unload buffers
  "t", -- tag completion
})
vim.opt.shortmess = { -- shorten message in prompt window
  a = true, -- enable 'filmnrwx' flag
  o = true, -- overwrite message for writing a file with subsequent message for reading a file
  t = true, -- truncate file message at the start
  s = true, -- don't give "search hit/continuing *" message
  T = true, -- truncate other messages in the middle
  W = true, -- don't give "written" or "[w]" when writing a file
  I = true, -- don't give the intro message when starting Vim
  c = true, -- don't give ins-completion-menu messages
  C = true, -- don't give messages while scanning for ins-completion items
  F = true, -- don't give the file info when editing a file
  S = true, -- don't show search count message when searching
}
vim.opt.wildignore = { -- list of file patterns to ignore when expanding wildcards
  "*.o",
  "*.obj",
  "*.a",
  "*.so",
  "*.out",
  "*.class",
  "*.pyc",
  "*.jpg",
  "*.jpeg",
  "*.png",
  "*.gif",
  "*.tiff",
  "*.webp",
  "*.pdf",
  "*.odt",
  "*.odp",
  "*.doc",
  "*.docx",
  "*.ppt",
  "*.csv",
  "__pycache__",
  "*pycache*",
  "**/tmp/**",
  "**/node_modules/**",
  ".git",
}
vim.opt.wildmode = { "longest", "full" }
vim.opt.wildoptions:remove({ "tagfile" })

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
-- vim.opt.shortmess:append({ W = true, a = true })

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
vim.o.scrolloff = 99 -- Vertical Scroll Offset
-- vim.o.scrolloff       = 21  	    -- Vertical Scroll Offset
vim.o.sidescrolloff = 8 -- Horizontal Scroll Offset
-- vim.o.mouse = "a" -- Enable mouse mode

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

-- kitty
-- " Mouse support
-- vim.o.mouse = a
-- vim.o.ttymouse = sgr
-- vim.o.balloonevalterm = true
-- " Styled and colored underline support
--[[ let &t_AU = "\e[58:5:%dm"
let &t_8u = "\e[58:2:%lu:%lu:%lum"
let &t_Us = "\e[4:2m"
let &t_Cs = "\e[4:3m"
let &t_ds = "\e[4:4m"
let &t_Ds = "\e[4:5m"
let &t_Ce = "\e[4:0m"
" Strikethrough
let &t_Ts = "\e[9m"
let &t_Te = "\e[29m"
" Truecolor support
let &t_8f = "\e[38:2:%lu:%lu:%lum"
let &t_8b = "\e[48:2:%lu:%lu:%lum"
let &t_RF = "\e]10;?\e\\"
let &t_RB = "\e]11;?\e\\"
" Bracketed paste
let &t_BE = "\e[?2004h"
let &t_BD = "\e[?2004l"
let &t_PS = "\e[200~"
let &t_PE = "\e[201~"
" Cursor control
let &t_RC = "\e[?12$p"
let &t_SH = "\e[%d q"
let &t_RS = "\eP$q q\e\\"
let &t_SI = "\e[5 q"
let &t_SR = "\e[3 q"
let &t_EI = "\e[1 q"
let &t_VS = "\e[?12l"
" Focus tracking
let &t_fe = "\e[?1004h"
let &t_fd = "\e[?1004l"
execute "set <FocusGained>=\<Esc>[I"
execute "set <FocusLost>=\<Esc>[O"
" Window title
let &t_ST = "\e[22;2t"
let &t_RT = "\e[23;2t"

" vim hardcodes background color erase even if the terminfo file does
" not contain bce. This causes incorrect background rendering when
" using a color theme with a background color in terminals such as
" kitty that do not support background color erase.
let &t_ut='' ]]

-- winbar
-- vim.o.winbar = "%{%v:lua.require('configs/util').eval()%}"

-- navic
-- vim.o.statusline = "%{%v:lua.require'nvim-navic'.get_location()%}"
vim.opt.statusline = " %(%r %)%{%&bt==''?&ft==''?'%f':'%f %LL %m%=%l,%-2c':''%} "

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

vim.diagnostic.config({
  virtual_text = false,
})
-- vim:fileencoding=utf-8:ft=lua:foldmethod=marker
