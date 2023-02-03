return {
  -- snippets
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "rafamadriz/friendly-snippets",
      config = function()
        require("luasnip.loaders.from_vscode").lazy_load()
      end,
    },
    opts = {
      history = true,
      delete_check_events = "TextChanged",
    },
    -- stylua: ignore
    keys = {
      {
        "<tab>",
        function()
          return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next" or "<tab>"
        end,
        expr = true, silent = true, mode = "i",
      },
      { "<tab>", function() require("luasnip").jump(1) end, mode = "s" },
      { "<s-tab>", function() require("luasnip").jump(-1) end, mode = { "i", "s" } },
    },
  },

  -- completions
  {
    "hrsh7th/nvim-cmp",
    version = false,
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "saadparwaiz1/cmp_luasnip",
      "onsails/lspkind-nvim",
    },
    config = function()
      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      local cmp = require("cmp")
      local lspkind = require("lspkind")
      local buffer = require("cmp_buffer")
      local luasnip = require("luasnip")

      cmp.setup({
        snippet = {
          expand = function(args)
            -- vim.fn["vsnip#anonymous"](args.body)
            -- vim.fn["vsnip#anonymous"](args.body)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        window = {
          completion = cmp.config.window.bordered({
            border = { "⚈", "─", "⚈", "│", "⚈", "─", "⚈", "│" },
            winhighlight = "Normal:Pmenu,FloatBorder:Error,Cursorline:IncSearch,Search:None",
            side_padding = 0,
            col_offset = 0,
          }),
          documentation = cmp.config.window.bordered({
            border = { "⚈", "─", "⚈", "│", "⚈", "─", "⚈", "│" },
            winhighlight = "Normal:Pmenu,FloatBorder:Character,Cursorline:IncSearch,Search:None",
            side_padding = 0,
            col_offset = 0,
          }),
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-p>"] = cmp.mapping.select_prev_item(),
          ["<C-n>"] = cmp.mapping.select_next_item(),
          ["<C-d>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-e>"] = cmp.mapping.close(),
          -- ["<C-Space>"] = cmp.mapping.complete(), -- ndak bisa dipake
          -- ["<CR>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true }),
          ["<CR>"] = function(fallback)
            if cmp.visible() then
              cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true })(fallback)
            else
              fallback()
            end
          end,

          -- luasnip
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            elseif has_words_before() then
              cmp.complete()
            else
              fallback()
            end
          end, { "i", "s" }),

          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp", group_index = 1 },
          -- { name = "vsnip" },
          { name = "luasnip", option = { show_autosnippets = true } },
          {
            name = "buffer",
            keyword_length = 6,
            option = {
              get_bufnrs = function()
                return { vim.api.nvim_get_current_buf() }
              end,
            },
          },
          { name = "path", keyword_length = 2 },
          { name = "nvim_lua" },
          { name = "nvim_lsp_signature_help" },
          -- { name = "cmp_tabnine" },
        }),
        preselect = cmp.PreselectMode.None,
        view = {
          entries = {
            --[[ name = "wildmenu",
            separator = " | ", ]]
            name = "custom",
            selection_order = "near_cursor",
            -- name = "native",
          },
        },
        formatting = {
          format = lspkind.cmp_format({
            -- mode = "symbol_text",
            mode = "text_symbol",
            menu = {
              buffer = "[Buffer]",
              nvim_lsp = "[LSP]",
              -- vsnip = "[VSNIP]",
              luasnip = "[SNIP]",
              nvim_lua = "[Lua]",
              path = "[Path]",
              file = "[FILE]",
            },
          }),
        },
        sorting = {
          comparators = {
            function(...)
              return buffer:compare_locality(...)
            end,
            -- The rest of your comparators...
          },
        },
      })
      cmp.setup.cmdline("/", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          -- { name = "copilot" },
          { name = "nvim_lsp_document_symbol" },
        }, {
          { name = "buffer" },
        }),
        view = {
          entries = {
            name = "wildmenu",
            separator = " | ",
            -- name = "custom",
            selection_order = "near_cursor",
            -- name = "native",
          },
        },
      })

      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "cmdline" },
          { name = "path" },
        },
        view = {
          entries = {
            name = "wildmenu",
            separator = " | ",
            -- name = "custom",
            selection_order = "near_cursor",
            -- name = "native",
          },
        },
      })
    end,
  },
}

-- vim:fileencoding=utf-8:ft=lua:foldmethod=marker
