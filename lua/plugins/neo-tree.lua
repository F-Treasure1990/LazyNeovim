return {
  "nvim-neo-tree/neo-tree.nvim",
  cmd = "NeoTree",
  branch = "v2.x",
  keys = {
    { "<leader>e", "<cmd>NeoTreeFocus<cr>", desc = "Open File Explorer" },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",   -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  opts = {
    --[[   source_selector = {
    winbar = true,
    statusline = false,
    tab_labels = { -- table
      filesystem = "  Files ", -- string | nil
      buffers = "  Buffers ", -- string | nil
      -- git_status = "  Git ", -- string | nil
      git_status = nil,
      -- diagnostics = " 裂Diagnostics ", -- string | nil
      diagnostics = nil, -- string | nil
    },
    highlight = "NeoTreeIndentMarker",
    padding = 1,
    content_layout = "center",
    tabs_layout = "equal",
    -- separator_active = true,
    separator = { left = "┃", right = "┃", override = "active" },
  }, ]]
    close_if_last_window = true, -- Close Neo-tree if it is the last window left in the tab
    popup_border_style = "rounded",
    filesystem = {
      filtered_items = {
        visible = false, -- when true, they will just be displayed differently than normal items
        hide_dotfiles = true,
        hide_gitignored = true,
        hide_by_name = {
          "node_modules",
        },
        always_show = { -- remains visible even if other settings would normally hide it
          --".gitignored",
        },
        never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
          ".DS_Store",
        },
      },
      follow_current_file = false,          -- This will find and focus the file in the active buffer every
      group_empty_dirs = false,             -- when true, empty folders will be grouped together
      hijack_netrw_behavior = "open_default", -- netrw disabled, opening a directory opens neo-tree
      use_libuv_file_watcher = false,       -- This will use the OS level file watchers to detect changes
      -- instead of relying on nvim autocmd events.
      window = {
        mappings = {
          ["<bs>"] = "navigate_up",
          ["."] = "set_root",
          ["H"] = "toggle_hidden",
          ["/"] = "fuzzy_finder",
          ["D"] = "fuzzy_finder_directory",
          ["f"] = "filter_on_submit",
          ["<c-x>"] = "clear_filter",
          [","] = function(state)
            local node = state.tree:get_node()
            if node.type == "directory" and node:is_expanded() then
              require("neo-tree.sources.filesystem").toggle_directory(state, node)
            else
              require("neo-tree.ui.renderer").focus_node(state, node:get_parent_id())
            end
          end,
        },
      },
    },
    enable_git_status = false,
    enable_diagnostics = false,
    default_component_configs = {
      container = {
        enable_character_fade = true,
      },
      indent = {
        indent_size = 2,
        padding = 2, -- extra padding on left hand side
        -- indent guides
        with_markers = true,
        indent_marker = "│",
        last_indent_marker = "└",
        highlight = "NeoTreeIndentMarker",
        -- expander config, needed for nesting files
        with_expanders = nil, -- if nil and file nesting is enabled, will enable expanders
      },
      icon = {
        folder_closed = "",
        folder_open = "",
        folder_empty = "",
        -- The next two settings are only a fallback, if you use nvim-web-devicons and configure default icons there
        -- then these will never be used.
        default = "*",
        highlight = "NeoTreeFileIcon",
      },
      modified = {
        symbol = "",
        highlight = "NeoTreeModified",
      },
      name = {
        trailing_slash = false,
        use_git_status_colors = true,
        highlight = "NeoTreeFileName",
      },
    },
    window = {
      position = "float",
      width = 50,
      mapping_options = {
        noremap = true,
        nowait = true,
      },
    },
    nesting_rules = {},
    buffers = {
      follow_current_file = false, -- This will find and focus the file in the active buffer every
      -- time the current file is changed while the tree is open.
      group_empty_dirs = false,  -- when true, empty folders will be grouped together
      show_unloaded = true,
      window = {
        mappings = {
          ["x"] = "buffer_delete",
          ["<bs>"] = "navigate_up",
          ["."] = "set_root",
        },
      },
    },
    git_status = {
      window = {
        position = "float",
        mappings = {
          ["A"] = "git_add_all",
          ["gu"] = "git_unstage_file",
          ["ga"] = "git_add_file",
          ["gr"] = "git_revert_file",
          ["gc"] = "git_commit",
          ["gp"] = "git_push",
          ["gg"] = "git_commit_and_push",
        },
      },
    },
  }
}
