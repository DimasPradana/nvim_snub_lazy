return {
  "norcalli/nvim-colorizer.lua",
  keys = {
    { "<leader>ca", "<CMD>ColorizerAttachToBuffer<CR>", desc = "Colorizer Attach to Buf" },
    { "<leader>cd", "<CMD>ColorizerDetachFromBuffer<CR>", desc = "Colorizer Detach from Buf" },
    { "<leader>cr", "<CMD>ColorizerReloadAllBuffer<CR>", desc = "Colorizer Reload Buf" },
  },
  config = function()
    require("colorizer").setup({
      "css",
      "javascript",
      "go",
      html = {
        mode = "foreground",
      },
      svelte = {
        mode = "foreground",
      },
    }, { mode = "background" })
  end,
}
