-- local c = require("lsp/utils")
-- local navic = require("nvim-navic")
local u = require("configs/util")

require("lspconfig").svelte.setup({
  on_attach = function(client, bufnr)
    -- require("notify")("LSP svelte aktif pak", "info")
    u.cetak("svelte aktif pak")
    --[[ require("lsp_signature").on_attach({
      bind = true, -- This is mandatory, otherwise border config won't get registered.
      handler_opts = {
        border = "rounded",
      },
    }, bufnr) -- Note: add in lsp client on-attach ]]
    client.server_capabilities.completionProvider.triggerCharacters = {
      ".",
      '"',
      "'",
      "`",
      "/",
      "@",
      "*",
      "#",
      "$",
      "+",
      "^",
      "(",
      "[",
      "-",
      ":",
    }
    --[[ vim.api.nvim_buf_set_keymap(0, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { noremap = true })
		vim.api.nvim_buf_set_keymap(0, "n", "ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", { noremap = true })
		vim.api.nvim_buf_set_keymap(0, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true })
		vim.api.nvim_buf_set_keymap(0, "n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", { noremap = true })
		vim.api.nvim_buf_set_keymap(0, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", { noremap = true })
		vim.api.nvim_buf_set_keymap(0, "n", "dn", "<cmd>lua vim.diagnostic.goto_next()<CR>", { noremap = true })
		vim.api.nvim_buf_set_keymap(0, "n", "dp", "<cmd>lua vim.diagnostic.goto_prev()<CR>", { noremap = true }) ]]
    -- vim.api.nvim_buf_set_keymap(0, "n", "gr", "<cmd>lua vim.lsp.buf.rename()<CR>", { noremap = true })
    -- navic.attach(client, bufnr) -- Server "svelte" does not support documentSymbols, it responds with SymbolInformation format which has been deprecated in latest LSP specification.
  end,
  -- function()
  -- 	require("notify")("LSP svelte aktif pak", "info")
  -- end,
  filetypes = { "svelte" },
  settings = {
    svelte = {
      plugin = {
        html = { completions = { enable = true, emmet = false } },
        svelte = { completions = { enable = true, emmet = false } },
        css = { completions = { enable = true, emmet = false } },
      },
    },
  },
})

-- vim:fileencoding=utf-8:ft=lua:foldmethod=marker
