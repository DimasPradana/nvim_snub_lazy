local c = require("lsp/utils")
local navic = require("nvim-navic")
local u = require("configs/util")

require("lspconfig").intelephense.setup({
  cmd = { "intelephense", "--stdio" },
  filetypes = { "php" },
  root_dir = c.custom_cwd,
  -- root_dir = require("lspconfig").util.root_pattern("composer.json", ".git"),
  on_attach = function(client, bufnr)
    -- require("notify")("LSP intelephense aktif pak", "info")
    u.cetak("intelephense aktif pak")
    --[[ vim.api.nvim_buf_set_keymap(0, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { noremap = true })
		vim.api.nvim_buf_set_keymap(0, "n", "ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", { noremap = true })
		vim.api.nvim_buf_set_keymap(0, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true })
		vim.api.nvim_buf_set_keymap(0, "n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", { noremap = true })
		vim.api.nvim_buf_set_keymap(0, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", { noremap = true })
		vim.api.nvim_buf_set_keymap(0, "n", "dn", "<cmd>lua vim.diagnostic.goto_next()<CR>", { noremap = true })
		vim.api.nvim_buf_set_keymap(0, "n", "dp", "<cmd>lua vim.diagnostic.goto_prev()<CR>", { noremap = true })
		vim.api.nvim_buf_set_keymap(0, "n", "gr", "<cmd>lua vim.lsp.buf.rename()<CR>", { noremap = true }) ]]
    navic.attach(client, bufnr)
    --[[ require("lsp_signature").on_attach({
      bind = true, -- This is mandatory, otherwise border config won't get registered.
      handler_opts = {
        border = "rounded",
      },
    }, bufnr) -- Note: add in lsp client on-attach ]]
  end,
  init_options = {
    -- storagePath = Optional absolute path to storage dir. Defaults to os.tmpdir().
    -- globalStoragePath = Optional absolute path to a global storage dir. Defaults to os.homedir().
    -- licenceKey = Optional licence key or absolute path to a text file containing the licence key.
    -- clearCache = Optional flag to clear server state. State can also be cleared by deleting {storagePath}/intelephense
    -- See https://github.com/bmewburn/intelephense-docs/blob/master/installation.md#initialisation-options
  },
  settings = {
    intelephense = {
      files = {
        maxSize = 1000000,
      },
    },
    -- See https://github.com/bmewburn/intelephense-docs
  },
})

-- vim:fileencoding=utf-8:ft=lua:foldmethod=marker
