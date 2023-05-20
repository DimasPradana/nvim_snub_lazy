return {
  "phaazon/hop.nvim",
  branch = "v2", -- optional but strongly recommended
  keys = {
    { "<leader>hw", "<CMD>lua require('hop').hint_words()<CR>", desc = "Hint Words" },
    { "<leader>hp", "<CMD>lua require('hop').hint_patterns()<CR>", desc = "Hint Patterns" },
    { "<leader>hl", "<CMD>lua require('hop').hint_lines()<CR>", desc = "Hint Lines" },
    { "<leader>hc", "<CMD>lua require('hop').hint_char2()<CR>", desc = "Hint Chars" },
    { "<leader>hs", "<CMD>HopLineStart<CR>", desc = "Line Start" },
    { "<leader>ha", "<CMD>HopAnywhere<CR>", desc = "Hop Anywhere" },
    { "<leader>hn", "<CMD>HopAnywhereCurrentLine<CR>", desc = "Current Line" },
  },
  config = function()
    local hop = require("hop")
    -- you can configure Hop the way you like here; see :h hop-config
    hop.setup({
      keys = "asdfghjkl",
      quit_key = "q",
      jump_on_sole_occurrence = false,
      uppercase_labels = true,
    })
  end,
}
