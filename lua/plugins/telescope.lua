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
    "nvim-telescope/telescope-frecency.nvim",
    -- "nvim-telescope/telescope-media-files.nvim",
    "nvim-telescope/telescope-fzy-native.nvim",
    "nvim-telescope/telescope-symbols.nvim",
    "gbrlsnchs/telescope-lsp-handlers.nvim",
    "nvim-telescope/telescope-ui-select.nvim",
    {
      "nvim-telescope/telescope-file-browser.nvim",
      dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    },
  },
  keys = {
    { "<leader>ff", "<CMD>lua require('telescope.builtin').find_files()<CR>",  desc = "Find Files" },
    -- { "<leader><leader>", "<CMD>lua require('telescope.builtin').buffers()<CR>", desc = "Find Buffers" },
    { "<leader>fg", "<CMD>lua require('telescope.builtin').grep_string()<CR>", desc = "Grep String" },
    { "<leader>fw", "<CMD>lua require('telescope.builtin').live_grep()<CR>",   desc = "Live Grep" },
    { "<leader>fc", "<CMD>lua require('telescope.builtin').commands()<CR>",    desc = "Commands" },
    { "<leader>fk", "<CMD>lua require('telescope.builtin').keymaps()<CR>",     desc = "Keymaps" },
    { "<leader>fr", "<CMD>lua require('telescope.builtin').registers()<CR>",   desc = "Registers" },
    { "<leader>fh", "<CMD>lua require('telescope.builtin').highlights()<CR>",  desc = "Highlights" },
    { "<leader>fo", "<CMD>TodoTelescope<CR>",                                  desc = "Todo Telescope" },
    {
      "<leader>fe",
      "<CMD>lua require('telescope.builtin').symbols{sources = {'emoji','kaomoji','gitmoji'}}<CR>",
      desc = "Emoji",
    },
    -- LSP
    {
      "<leader>fi",
      "<CMD>lua require('telescope.builtin').lsp_implementations()<CR>",
      desc = "Implementations",
    },
    { "<leader>fde", "<CMD>lua require('telescope.builtin').lsp_definitions()<CR>", desc = "Definitions" },
    {
      "<leader>ft",
      "<CMD>lua require('telescope.builtin').lsp_type_definitions()<CR>",
      desc = "Type Definitions",
    },
    { "<leader>fdi", "<CMD>lua require('telescope.builtin').diagnostics()<CR>",     desc = "Diagnostics" },
    --
    { "<leader>fp",  "<CMD>lua require('telescope.builtin').pickers()<CR>",         desc = "Pickers" },
    { "<leader>fm",  "<CMD>lua require('telescope.builtin').marks()<CR>",           desc = "Marks" },
    { "<leader>fl",  "<CMD>lua require('telescope.builtin').loclist()<CR>",         desc = "Location List" },
    {
      "<leader>fdw",
      "<CMD>lua require('telescope.builtin').lsp_dynamic_workspace_symbols()<CR>",
      desc = "Dynamically Lists LSP for all workspace symbols",
    },
    { "<leader>fa",       "<CMD>lua vim.lsp.buf.code_action()<CR>", desc = "Code Actions" },
    { "<leader>fb",       "<CMD>Telescope file_browser<CR>",        desc = "File Explorer" },
    { "<leader><leader>", "<CMD>Telescope buffers<CR>",             desc = "Buffers" },
  },
  config = function()
    local fb_actions = require "telescope._extensions.file_browser.actions"
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
          "^.next/",
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
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
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
          theme = "dropdown",
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
        file_browser = {
          theme = "ivy",
          path = vim.loop.cwd(),
          cwd = vim.loop.cwd(),
          cwd_to_path = false,
          grouped = false,
          files = true,
          add_dirs = true,
          depth = 1,
          auto_depth = false,
          select_buffer = false,
          hidden = { file_browser = true, folder_browser = true },
          respect_gitignore = vim.fn.executable "fd" == 1,
          no_ignore = false,
          follow_symlinks = false,
          browse_files = require("telescope._extensions.file_browser.finders").browse_files,
          browse_folders = require("telescope._extensions.file_browser.finders").browse_folders,
          hide_parent_dir = false,
          collapse_dirs = false,
          prompt_path = false,
          quiet = false,
          dir_icon = "",
          dir_icon_hl = "Default",
          display_stat = { date = true, size = true, mode = true },
          hijack_netrw = false,
          use_fd = true,
          git_status = true,
          mappings = {
            ["i"] = {
              ["<A-c>"] = fb_actions.create,
              ["<S-CR>"] = fb_actions.create_from_prompt,
              ["<A-r>"] = fb_actions.rename,
              ["<A-m>"] = fb_actions.move,
              ["<A-y>"] = fb_actions.copy,
              ["<A-d>"] = fb_actions.remove,
              ["<C-o>"] = fb_actions.open,
              ["<C-g>"] = fb_actions.goto_parent_dir,
              ["<C-e>"] = fb_actions.goto_home_dir,
              ["<C-w>"] = fb_actions.goto_cwd,
              ["<C-t>"] = fb_actions.change_cwd,
              ["<C-f>"] = fb_actions.toggle_browser,
              ["<A-h>"] = fb_actions.toggle_hidden,
              ["<C-s>"] = fb_actions.toggle_all,
              ["<bs>"] = fb_actions.backspace,
            },
            ["n"] = {
              ["c"] = fb_actions.create,
              ["r"] = fb_actions.rename,
              ["m"] = fb_actions.move,
              ["y"] = fb_actions.copy,
              ["d"] = fb_actions.remove,
              ["o"] = fb_actions.open,
              ["g"] = fb_actions.goto_parent_dir,
              ["e"] = fb_actions.goto_home_dir,
              ["w"] = fb_actions.goto_cwd,
              ["t"] = fb_actions.change_cwd,
              ["f"] = fb_actions.toggle_browser,
              ["h"] = fb_actions.toggle_hidden,
              ["s"] = fb_actions.toggle_all,
            },
          },
        },
        fzy_native = {
          override_generic_sorter = false,
          override_file_sorter = true,
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
    require("telescope").load_extension("file_browser")
    -- require("telescope").load_extension("frecency")
    require("telescope").load_extension("fzy_native")
  end,
}

-- vim:fileencoding=utf-8:ft=lua:foldmethod=marker
