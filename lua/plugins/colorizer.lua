return {
  "norcalli/nvim-colorizer.lua",
  keys = {
    { "<leader>ca", "<CMD>ColorizerAttachToBuffer<CR>", desc = "Colorizer Attach to Buf" },
    { "<leader>cd", "<CMD>ColorizerDetachFromBuffer<CR>", desc = "Colorizer Detach from Buf" },
    { "<leader>cr", "<CMD>ColorizerReloadAllBuffer<CR>", desc = "Colorizer Reload Buf" },
  },
  config = function()
    require("colorizer").setup({
      -- "css",
      "javascript",
      "typescript",
      -- "javascriptreact",
      -- "typescriptreact",
      "go",
      html = {
        mode = "foreground",
      },
      svelte = {
        mode = "foreground",
      },
      css = {
        mode = "foreground",
        rgb_fn = true,
        hsl_fn = true,
      },
      javascriptreact = {
        mode = "background",
        rgb_fn = true,
        hsl_fn = true,
      },
      typescriptreact = {
        mode = "background",
        rgb_fn = true,
        hsl_fn = true,
      },
    }, { mode = "background" })
  end,
}
