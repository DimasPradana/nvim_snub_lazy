return {
  "nvim-treesitter/nvim-treesitter",
  version = false, -- last release is way too old and doesn't work on Windows
  build = ":TSUpdate",
  event = "BufReadPost",
  keys = {
    { "<c-space>", desc = "Increment selection" },
    { "<bs>", desc = "Shrink selection", mode = "x" },
  },
  dependencies = {
    -- debug stuff
    {
      "nvim-treesitter/playground",
      cmd = { "TSHighlightCapturesUnderCursor", "TSPlaygroundToggle" },
    },

    -- moar textobjects
    {
      "nvim-treesitter/nvim-treesitter-textobjects",
      event = "BufRead",
      dependencies = "nvim-treesitter",
    },

    -- context aware commentstring
    {
      "JoosepAlviste/nvim-ts-context-commentstring",
      "nvim-treesitter/nvim-treesitter-context",
    },

    -- refactor
    {
      "nvim-treesitter/nvim-treesitter-refactor",
    },

    -- autotag
    {
      "windwp/nvim-ts-autotag",
      config = function()
        --[[ require("nvim-ts-autotag").setup({
          enable = true,
          filetypes = { "html", "xml", "javascriptreact", "typescriptreact", "svelte", "javascript", "typescript" },
        }) ]]
        require("nvim-ts-autotag").setup()
      end,
    },

    -- docs
    {
      "nvim-treesitter/nvim-tree-docs",
    },

    -- query
    {
      "nvim-treesitter/tree-sitter-query",
    },

    -- pairs
    {
      "theHamsta/nvim-treesitter-pairs",
    },

    -- treehopper
    -- {
    --   "mfussenegger/nvim-treehopper",
    -- },
  },
  ---@type TSConfig
  opts = {
    highlight = { enable = true },
    indent = { enable = true },
    --[[ autotag = {
      enable = true,
      filetypes = { "html", "xml", "javascriptreact", "typescriptreact", "svelte", "javascript", "typescript" },
    }, ]]
    context_commentstring = { enable = true, enable_autocmd = false },
    refactor = {
      highlight_definitions = { enable = true },
      smart_rename = {
        enable = true,
        keymaps = {
          smart_rename = "grr",
        },
      },
      navigation = {
        enable = true,
        keymaps = {
          goto_definition = "gnd",
          list_definitions = "gnD",
          list_definitions_toc = "gO",
          goto_next_usage = "<a-*>",
          goto_previous_usage = "<a-#>",
        },
      },
    },

    ensure_installed = {
      "bash",
      "css",
      "dockerfile",
      "dot",
      "fish",
      "go",
      "html",
      "java",
      "javascript",
      "json",
      "kotlin",
      "lua",
      "markdown",
      "markdown_inline",
      "php",
      "proto",
      "python",
      "query",
      "regex",
      "sql",
      "svelte",
      "tsx",
      "typescript",
      "vim",
      "vimdoc",
      "yaml",
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<C-space>",
        node_incremental = "<C-space>",
        scope_incremental = "<nop>",
        node_decremental = "<bs>",
      },
    },
    textobjects = {
      select = {
        enable = true,
        lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
        keymaps = {
          -- You can use the capture groups defined in textobjects.scm
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["ac"] = "@class.outer",
          ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
          ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
        },
        selection_modes = {
          ["@parameter.outer"] = "v", -- charwise
          ["@function.outer"] = "V", -- linewise
          ["@class.outer"] = "<c-v>", -- blockwise
        },
        include_surrounding_whitespace = false,
      },
      move = {
        enable = true,
        set_jumps = true, -- whether to set jumps in the jumplist
        goto_next_start = {
          ["]m"] = "@function.outer",
          ["]]"] = { query = "@class.outer", desc = "Next class start" },
          --
          -- You can use regex matching (i.e. lua pattern) and/or pass a list in a "query" key to group multiple queires.
          ["]o"] = "@loop.*",
          -- ["]o"] = { query = { "@loop.inner", "@loop.outer" } }
          --
          -- You can pass a query group to use query from `queries/<lang>/<query_group>.scm file in your runtime path.
          -- Below example nvim-treesitter's `locals.scm` and `folds.scm`. They also provide highlights.scm and indent.scm.
          ["]s"] = { query = "@scope", query_group = "locals", desc = "Next scope" },
          ["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
        },
        goto_next_end = {
          ["]M"] = "@function.outer",
          ["]["] = "@class.outer",
        },
        goto_previous_start = {
          ["[m"] = "@function.outer",
          ["[["] = "@class.outer",
        },
        goto_previous_end = {
          ["[M"] = "@function.outer",
          ["[]"] = "@class.outer",
        },
        -- Below will go to either the start or the end, whichever is closer.
        -- Use if you want more granular movements
        -- Make it even more gradual by adding multiple queries and regex.
        goto_next = {
          ["]d"] = "@conditional.outer",
        },
        goto_previous = {
          ["[d"] = "@conditional.outer",
        },
      },
      swap = {
        enable = true,
        swap_next = {
          ["<leader>a"] = "@parameter.inner",
        },
        swap_previous = {
          ["<leader>A"] = "@parameter.inner",
        },
      },
      lsp_interop = {
        enable = true,
        border = "none",
        floating_preview_opts = {},
        peek_definition_code = {
          ["<leader>df"] = "@function.outer",
          ["<leader>dF"] = "@class.outer",
        },
      },
      --[[ builtn-in :
        @block.inner
        @block.outer
        @call.inner
        @call.outer
        @class.inner
        @class.outer
        @comment.outer
        @conditional.inner
        @conditional.outer
        @frame.inner
        @frame.outer
        @function.inner
        @function.outer
        @loop.inner
        @loop.outer
        @parameter.inner
        @parameter.outer
        @scopename.inner
        @statement.outer ]]
    },
    playground = {
      enable = true,
      disable = {},
      updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
      persist_queries = false, -- Whether the query persists across vim sessions
      keybindings = {
        toggle_query_editor = "o",
        toggle_hl_groups = "i",
        toggle_injected_languages = "t",
        toggle_anonymous_nodes = "a",
        toggle_language_display = "I",
        focus_language = "f",
        unfocus_language = "F",
        update = "R",
        goto_node = "<cr>",
        show_help = "?",
      },
    },
    tree_docs = {
      enable = true,
      spec_config = {
        svelte = {
          slots = {
            class = { author = true },
          },
          processors = {
            author = function()
              return " * @author SNUB"
            end,
          },
        },
        jsdoc = {
          slots = {
            class = { author = true },
          },
          processors = {
            author = function()
              return " * @author SNUB"
            end,
          },
        },
        lua = {
          slots = {
            class = { author = true },
          },
          processors = {
            author = function()
              return " * @author SNUB"
            end,
          },
        },
      },
    },
    pairs = {
      enable = true,
      disable = {},
      highlight_pair_events = {}, -- e.g. {"CursorMoved"}, -- when to highlight the pairs, use {} to deactivate highlighting
      highlight_self = false, -- whether to highlight also the part of the pair under cursor (or only the partner)
      goto_right_end = false, -- whether to go to the end of the right partner or the beginning
      fallback_cmd_normal = "call matchit#Match_wrapper('',1,'n')", -- What command to issue when we can't find a pair (e.g. "normal! %")
      keymaps = {
        goto_partner = "<leader>%",
        delete_balanced = "X",
      },
      delete_balanced = {
        only_on_first_char = false, -- whether to trigger balanced delete when on first character of a pair
        fallback_cmd_normal = nil, -- fallback command when no pair found, can be nil
        longest_partner = false, -- whether to delete the longest or the shortest pair when multiple found.
        -- E.g. whether to delete the angle bracket or whole tag in  <pair> </pair>
      },
    },
  },
  ---@param opts TSConfig
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
    -- require("nvim-ts-autotag").setup({})
    require("treesitter-context").setup({
      enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
      max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
      min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
      line_numbers = true,
      multiline_threshold = 20, -- Maximum number of lines to collapse for a single context line
      trim_scope = "outer", -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
      mode = "cursor", -- Line used to calculate context. Choices: 'cursor', 'topline'
      -- Separator between context and content. Should be a single character string, like '-'.
      -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
      separator = nil,
      zindex = 20, -- The Z-index of the context window
      on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
    })
  end,
}

-- vim:fileencoding=utf-8:ft=lua:foldmethod=marker
