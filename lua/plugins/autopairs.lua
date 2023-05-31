return {
  "windwp/nvim-autopairs",
  -- event = "BufRead",
  event = "InsertEnter",
  config = function()
    require("nvim-autopairs").setup({
      map_cr = true, --  map <CR> on insert mode
      map_complete = true, -- it will auto insert `(` after select function or method item
      auto_select = true, -- automatically select the first item
    })

    local cmp_autopairs = require("nvim-autopairs.completion.cmp")
    -- local cmp = require("cmp")
    -- cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))
    require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))
  end,
}
