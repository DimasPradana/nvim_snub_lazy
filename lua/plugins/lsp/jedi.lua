-- local c = require("lsp/utils")
local navic = require("nvim-navic")
local u = require("configs/util")

require("lspconfig").jedi_language_server.setup({
  on_attach = function(client, bufnr)
    -- require("notify")("LSP python aktif pak", "info")
    u.cetak("jedi aktif pak")
    navic.attach(client, bufnr)
    --[[ require("lsp_signature").on_attach({
      bind = true, -- This is mandatory, otherwise border config won't get registered.
      handler_opts = {
        border = "rounded",
      },
    }, bufnr) -- Note: add in lsp client on-attach ]]
  end,
})

-- vim:fileencoding=utf-8:ft=lua:foldmethod=marker
