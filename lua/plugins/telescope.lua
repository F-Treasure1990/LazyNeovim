return {
  'nvim-telescope/telescope.nvim',
  cmd = { "Telescope", "Tel" },
  branch = "0.1.x",
  dependencies = {
    { 'nvim-lua/plenary.nvim' },
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }
  },
  keys = {
    { "<leader>f","<cmd>Telescope find_files<cr>",desc ="Telescope Find Files" },
    { "<leader>lw", "<cmd>Telescope live_grep<cr>",desc ="Telescope Find Words" },
    { "<leader>lc", "<cmd>Telescope grep_string<cr>",desc ="Telescope Find Words" },
    { "<leader>lb","<cmd>Telescope buffers<cr>",desc = "Telescope Buffers" },
    { "<leader>lh", "<cmd>Telescope help_tags<cr>",desc ="Telescope Help Tags" },
    { "<leader>lo", "<cmd>Telescope oldfiles<cr>",desc ="Telescope Old Files" },
    { "<leader>d",  "<cmd>Telescope diagnostics<cr>",desc ="Telescope Global Diagnostics" },
  },
  config = true,
  opts = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        -- initial_mode = "normal", -- Mode to start in
        prompt_prefix = " ❯ ",
        selection_caret = "❯ ",
        scroll_strategy = "cycle",
        sorting_strategy = "ascending",
        layout_strategy = "vertical",
        shorten_path = true,
        file_sorter = require("telescope.sorters").get_fuzzy_file,
        file_ignore_patterns = { "node_modules", ".yaml" },
        generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
        path_display = function(_, path)
          local tail = require("telescope.utils").path_tail(path)
          return string.format("%s - [ %s ]", tail, path)
        end,
        results_title = "Results",
        prompt_title = "Prompt",
        layout_config = {
          -- Search bar
          bottom_pane = {
            height = 40,
            width = 0.6,
            -- preview_cutoff = 120,
            prompt_position = "bottom",
          },
          horizontal = {
            height = 0.6,
            preview_cutoff = 120,
            prompt_position = "top",
            width = 0.8,
          },
          vertical = {
            height = 0.7,
            preview_cutoff = 40,
            prompt_position = "top",
            width = 0.7,
          },
        },
        mappings = {
          i = {
            ["<esc>"] = actions.close,
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
            ["dd"] = actions.delete_buffer,
          },
        },
      },
      extensions = {
        fzf = {
          fuzzy = true,                   -- false will only do exact matching
          override_generic_sorter = true, -- override the generic sorter
          override_file_sorter = true,    -- override the file sorter
          case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
        },
      },
    })

    telescope.load_extension("fzf")
  end
}
