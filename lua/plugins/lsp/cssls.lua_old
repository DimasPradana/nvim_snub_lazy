local c = require("lsp/utils")
local u = require("configs/util")

require("lspconfig").cssls.setup({
  cmd = {
    "css-languageserver",
    "--stdio",
  },
  root_dir = c.custom_cwd,
  on_attach = function()
    -- require("notify")("LSP cssls aktif pak", "info")
    u.cetak("css aktif pak")
  end,
})

-- vim:fileencoding=utf-8:ft=lua:foldmethod=marker
