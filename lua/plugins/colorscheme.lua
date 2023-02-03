return {
  "DimasPradana/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = { style = "moon" },
  config = function()
    --load colorscheme
    vim.cmd([[colorscheme tokyonight]])
  end,
}
