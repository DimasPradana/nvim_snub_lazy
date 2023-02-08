local c = require("lsp/utils")
local u = require("configs/util")

require("lspconfig").html.setup({
  cmd = {
    "html-languageserver",
    "--stdio",
  },
  root_dir = c.custom_cwd,
  on_attach = function()
    -- require("notify")("LSP html aktif pak", "info")
    u.cetak("html aktif pak")
  end,
})

-- vim:fileencoding=utf-8:ft=lua:foldmethod=marker
