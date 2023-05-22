-- colors
local TelescopePrompt = {
  TelescopeBorder = {
    fg = "#9ece6a",
    bg = "NONE",
  },
  TelescopeResultsTitle = {
    fg = "#ff9e64",
    bg = "NONE",
  },
  TelescopePromptTitle = {
    fg = "#ff9e64",
    bg = "NONE",
  },
  TelescopePreviewTitle = {
    fg = "#ff9e64",
    bg = "NONE",
  },
  --[[ TelescopeSelection = {
    fg = "#24283b",
    bg = "#e0af68",
  }, ]]
}

for hl, col in pairs(TelescopePrompt) do
  vim.api.nvim_set_hl(0, hl, col)
end

return {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  version = false, -- telescope did onlue one release, so use HEAD for now
  dependencies = {
    { "nvim-lua/popup.nvim" },
    { "nvim-lua/plenary.nvim" },
    -- "nvim-telescope/telescope-frecency.nvim",
    -- "nvim-telescope/telescope-media-files.nvim",
    -- "nvim-telescope/telescope-fzy-native.nvim",
    "nvim-telescope/telescope-symbols.nvim",
    "gbrlsnchs/telescope-lsp-handlers.nvim",
    "nvim-telescope/telescope-ui-select.nvim",
  },
  keys = {
    { "<leader>ff", "<CMD>lua require('telescope.builtin').find_files()<CR>", desc = "Find Files" },
    { "<leader>fb", "<CMD>lua require('telescope.builtin').buffers()<CR>", desc = "Find Buffers" },
    { "<leader>fg", "<CMD>lua require('telescope.builtin').grep_string()<CR>", desc = "Grep String" },
    { "<leader>fw", "<CMD>lua require('telescope.builtin').live_grep()<CR>", desc = "Live Grep" },
    { "<leader>fc", "<CMD>lua require('telescope.builtin').commands()<CR>", desc = "Todo Telescope" },
    { "<leader>fk", "<CMD>lua require('telescope.builtin').keymaps()<CR>", desc = "Keymaps" },
    { "<leader>fr", "<CMD>lua require('telescope.builtin').registers()<CR>", desc = "Registers" },
    { "<leader>fh", "<CMD>lua require('telescope.builtin').highlights()<CR>", desc = "Highlights" },
    { "<leader>fo", "<CMD>TodoTelescope<CR>", desc = "Todo Telescope" },
    {
      "<leader>fe",
      "<CMD>lua require('telescope.builtin').symbols{sources = {'emoji','kaomoji','gitmoji'}}<CR>",
      desc = "Emoji",
    },
    -- LSP
    { "<leader>fi", "<CMD>lua require('telescope.builtin').lsp_implementations()<CR>", desc = "Implementations" },
    { "<leader>fde", "<CMD>lua require('telescope.builtin').lsp_definitions()<CR>", desc = "Definitions" },
    { "<leader>ft", "<CMD>lua require('telescope.builtin').lsp_type_definitions()<CR>", desc = "Type Definitions" },
    { "<leader>fdi", "<CMD>lua require('telescope.builtin').diagnostics()<CR>", desc = "Diagnostics" },
    --
    { "<leader>fp", "<CMD>lua require('telescope.builtin').pickers()<CR>", desc = "Pickers" },
    { "<leader>fm", "<CMD>lua require('telescope.builtin').marks()<CR>", desc = "Marks" },
    { "<leader>fl", "<CMD>lua require('telescope.builtin').loclist()<CR>", desc = "Location List" },
    {
      "<leader>fdw",
      "<CMD>lua require('telescope.builtin').lsp_dynamic_workspace_symbols()<CR>",
      desc = "Dynamically Lists LSP for all workspace symbols",
    },
    { "<leader>fa", "<CMD>lua vim.lsp.buf.code_action()<CR>", desc = "Code Actions" },
  },
  config = function()
    require("telescope").setup({
      defaults = {
        layout_strategy = "flex",

        -- Default configuration for telescope goes here:
        -- config_key = value,
        mappings = {
          i = {
            -- map actions.which_key to <C-h> (default: <C-/>)
            -- actions.which_key shows the mappings for your picker,
            -- e.g. git_{create, delete, ...}_branch for the git_branches picker
            -- ["<C-h>"] = "which_key",
            ["<Esc>"] = "close",
            ["<C-[>"] = "close",
          },
          n = {
            -- map actions.which_key to <C-h> (default: <C-/>)
            -- actions.which_key shows the mappings for your picker,
            -- e.g. git_{create, delete, ...}_branch for the git_branches picker
            -- ["<C-h>"] = "which_key"
          },
        },
        file_ignore_patterns = {
          "%.class$",
          "%.dmg$",
          "%.gif$",
          "%.gz$",
          "%.iso$",
          "%.jar$",
          "%.jpg$",
          "%.jpeg$",
          "%.JPEG$",
          "%.mkv$",
          "%.mp4$",
          "%.o$",
          "%.otf$",
          "%.out$",
          "%.pdf$",
          "%.png$",
          "%.PNG$",
          "%.pyc$",
          "%.pyi$",
          "%.tar",
          "%.torrent$",
          "%.ttf$",
          "%.webm$",
          "%.webp$",
          "%.zip$",
          "^.dart_tool/",
          "^.git/",
          "^.github/",
          "^.gradle/",
          "^.idea/",
          "^.settings/",
          "^.vscode/",
          "^.env/",
          "^__pycache__/",
          "^bin/",
          "^build/",
          "^env/",
          "^gradle/",
          "^node_modules/",
          "^obj/",
          "^target/",
          "^vendor/",
          "^zig%-cache/",
          "^zig%-out/",
        },
      },
      pickers = {
        -- Default configuration for builtin pickers goes here:
        -- picker_name = {
        --   picker_config_key = value,
        --   ...
        -- }
        -- Now the picker_config_key will be applied every time you call this
        -- builtin picker
        find_files = {
          theme = "dropdown",
          prompt_prefix = "🔍",
          find_command = {
            "rg",
            "--ignore",
            "--hidden",
            "--files",
          },
        },
        --[[ grep_string = {
				theme = "cursor",
				find_command = {
				"ag",
				},
				}, ]]
        live_grep = {
          theme = "dropdown",
          find_command = {
            "ag",
          },
        },
        buffers = {
          theme = "ivy",
          prompt_prefix = "   ",
          path_display = { "smart" },
        },
      },
      extensions = {
        -- Your extension configuration goes here:
        -- extension_name = {
        --   extension_config_key = value,
        -- }
        -- please take a look at the readme of the extension you want to configure
        lsp_handlers = {
          disable = {},
          location = {
            telescope = {},
            no_results_message = "No references found",
          },
          symbol = {
            telescope = {},
            no_results_message = "No symbols found",
          },
          call_hierarchy = {
            telescope = {},
            no_results_message = "No calls found",
          },
          code_action = {
            telescope = {
              require("telescope.themes").get_cursor({}),
            },
            no_results_message = "No code actions available",
            prefix = "",
          },
        },
        ["ui-select"] = {
          require("telescope.themes").get_cursor({
            -- even more opts
          }),
        },
      },
      layout_config = {
        horizontal = {
          prompt_position = "top",
          preview_width = 0.55,
          results_width = 0.8,
        },
        vertical = {
          mirror = false,
        },
        width = 0.87,
        height = 0.80,
        preview_cutoff = 120,
      },
    })

    -- To get ui-select loaded and working with telescope, you need to call
    -- load_extension, somewhere after setup function:
    require("telescope").load_extension("ui-select")
    require("telescope").load_extension("lsp_handlers")
  end,
}

-- vim:fileencoding=utf-8:ft=lua:foldmethod=marker
