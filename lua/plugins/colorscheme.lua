return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        style = "moon",
        on_highlights = function(hl, c)
          hl.LineNr = { fg = c.fg }
          hl.LineNrAbove = { fg = c.fg_gutter }
          hl.LineNrBelow = { fg = c.fg_gutter }
          hl.StatusLine = { fg = c.fg, bg = c.bg }
          -- hl.StatusLineNC = { fg = c.fg, bg = c.bg }
          hl.StatusLineNC = { fg = c.fg }
          -- hl.StatusLineNC = { fg = c.fg, bg = c.bg }
        end,
      })
    end,
  },
  {
    "SmiteshP/nvim-navic",
    event = "LspAttach",
    dependencies = {
      "neovim/nvim-lspconfig",
    },
    config = function()
      require("nvim-navic").setup({
        icons = {
          File = " ",
          Module = " ",
          Namespace = " ",
          Package = " ",
          Class = " ",
          Method = " ",
          Property = " ",
          Field = " ",
          Constructor = " ",
          Enum = "練",
          Interface = "練",
          Function = " ",
          Variable = " ",
          Constant = " ",
          String = " ",
          Number = " ",
          Boolean = "◩ ",
          Array = " ",
          Object = " ",
          Key = " ",
          Null = "ﳠ ",
          EnumMember = " ",
          Struct = " ",
          Event = " ",
          Operator = " ",
          TypeParameter = " ",
        },
        lsp = {
          --[[ auto_attach = false,
          preference = nil, ]]
          auto_attach = true,
          preference = nil,
        },
        highlight = false,
        separator = " > ",
        depth_limit = 0,
        depth_limit_indicator = "..",
        safe_output = true,
        click = false,
      })
    end,
    event = "BufReadPre",
  },
}
