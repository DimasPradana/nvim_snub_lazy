return {
  { --{{{ lspconfig
    "neovim/nvim-lspconfig",
    event = "BufReadPre",
    dependencies = {
      {
        "williamboman/mason.nvim",
        config = function()
          require("mason").setup({
            ui = {
              icons = {
                package_installed = "✓",
                package_pending = "➜",
                package_uninstalled = "✗",
              },
            },
          })
        end,
      },
      {
        "williamboman/mason-lspconfig.nvim",
        config = function()
          require("mason-lspconfig").setup({
            ensure_installed = {
              -- "sumneko_lua",
              "lua_ls",
            },
            automatic_installation = true,
          })
          require("mason-lspconfig").setup_handlers({
            function(server_name)
              require("lspconfig")[server_name].setup({})
            end,
          })
        end,
      },
    },
    config = function()
      require("plugins/lsp/sumneko")
    end,
    --[[ opts = {
      -- options for vim.diagnostic.config()
      diagnostics = {
        underline = true,
        update_in_insert = false,
        virtual_text = {
          spacing = 4,
          source = "if_many",
          prefix = "●",
          -- this will set set the prefix to a function that returns the diagnostics icon based on the severity
          -- this only works on a recent 0.10.0 build. Will be set to "●" when not supported
          -- prefix = "icons",
        },
        severity_sort = true,
      },
      -- Enable this to enable the builtin LSP inlay hints on Neovim >= 0.10.0
      -- Be aware that you also will need to properly configure your LSP server to
      -- provide the inlay hints.
      inlay_hints = {
        enabled = false,
      },
    }, ]]
  }, --}}}

  { --{{{ formatter
    -- "jose-elias-alvarez/null-ls.nvim",
    "nvimtools/none-ls.nvim",
    event = "BufReadPost",
    config = function()
      -- require("configs.util").cetak("masuk mid")

      local null_ls = require("null-ls")

      null_ls.setup({
        debug = false,
        sources = {
          null_ls.builtins.formatting.blade_formatter.with({
            filetypes = { "blade" },
          }),
          -- null_ls.builtins.formatting.php,
          -- null_ls.builtins.formatting.flake8,
          null_ls.builtins.diagnostics.golangci_lint,
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.formatting.prettierd.with({
            filetypes = {
              "javascript",
              "javascriptreact",
              "typescript",
              "typescriptreact",
              "vue",
              "css",
              "scss",
              "less",
              "html",
              "json",
              "jsonc",
              "yaml",
              "markdown",
              "markdown.mdx",
              "graphql",
              "handlebars",
            },
          }),
          null_ls.builtins.formatting.gofmt,
          null_ls.builtins.formatting.gofumpt,
          null_ls.builtins.formatting.goimports,
          null_ls.builtins.formatting.isort,
          null_ls.builtins.formatting.black,
        },
        -- you can reuse a shared lspconfig on_attach callback here
        on_attach = function(client, bufnr)
          if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
              group = augroup,
              buffer = bufnr,
              callback = function()
                -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
                vim.lsp.buf.format()
              end,
            })
          end
        end,
      })
    end,
  }, --}}}
}

-- vim:fileencoding=utf-8:ft=lua:foldmethod=marker
