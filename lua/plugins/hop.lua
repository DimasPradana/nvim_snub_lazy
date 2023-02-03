return {
  "phaazon/hop.nvim",
  branch = "v2", -- optional but strongly recommended
  keys = {
    { "<leader>hw", "<CMD>lua require('hop').hint_words()<CR>", desc = "Hint Words" },
    { "<leader>hp", "<CMD>lua require('hop').hint_patterns()<CR>", desc = "Hint Patterns" },
    { "<leader>hl", "<CMD>lua require('hop').hint_lines()<CR>", desc = "Hint Lines" },
    { "<leader>hc", "<CMD>lua require('hop').hint_char2()<CR>", desc = "Hint Chars" },
    { "<leader>hs", "<CMD>HopLineStart<CR>", desc = "Line Start" },
    -- { "<leader>haw", "<CMD>HopAnywhere<CR>", desc = "Hop Anywhere" },
    -- { "<leader>hal", "<CMD>HopAnywhereCurrentLine<CR>", desc = "Current Line" },
  },
  config = function()
    -- you can configure Hop the way you like here; see :h hop-config
    require("hop").setup({ keys = "asdfghjkl" })
  end,
}
