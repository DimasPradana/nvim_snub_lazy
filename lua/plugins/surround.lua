return {
  "ur4ltz/surround.nvim",
  -- event = "BufRead",
  event = "InsertEnter",
  config = function()
    require("surround").setup({
      context_offset = 100,
      load_autogroups = false,
      mappings_style = "sandwich",
      map_insert_mode = true,
      quotes = { "'", '"' },
      brackets = { "(", "{", "[" },
      space_on_closing_char = false,
      space_on_alias = false,
      pairs = {
        --[[ nestable = { { "(", ")" }, { "[", "]" }, { "{", "}" } },
          linear = { { "'", "'" }, { "`", "`" }, { '"', '"' } }, ]]
        nestable = { b = { "(", ")" }, s = { "[", "]" }, B = { "{", "}" }, a = { "<", ">" } },
        linear = { q = { "'", "'" }, t = { "`", "`" }, d = { '"', '"' } },
      },
      prefix = "s",
    })
  end,
}
