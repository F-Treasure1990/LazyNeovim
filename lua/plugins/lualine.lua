local mode = {
  "mode",
  color = { gui = "bold" },
  icons_enabled = true,
  icon = nil,
  separator = { right = "" },
  cond = nil,
  type = nil,
  padding = 1,
}

local buffers = {
  "buffers",
  show_filename_only = true,       -- Shows shortened relative path when set to false.
  hide_filename_extension = false, -- Hide filename extension when set to true.
  show_modified_status = true,     -- Shows indicator when the buffer is modified.
  mode = 0,
  -- 0: Shows buffer name
  -- 1: Shows buffer index
  -- 2: Shows buffer name + buffer index
  -- 3: Shows buffer number
  -- 4: Shows buffer name + buffer number
  max_length = vim.o.columns * 2 / 3, -- Maximum width of buffers component,
  -- it can also be a function that returns
  -- the value of `max_length` dynamically.
  filetype_names = {
    TelescopePrompt = "Telescope",
    dashboard = "Dashboard",
    packer = "Packer",
    fzf = "FZF",
    alpha = "Alpha",
  }, -- Shows specific buffer name for that filetype ( { `filetype` = `buffer_name`, ... } )
  -- Automatically updates active buffer color to match color of other components (will be overidden if buffers_color is set)
  use_mode_colors = false,
  symbols = {
    modified = " ",    -- Text to show when the buffer is modified
    alternate_file = " ", -- Text to show to identify the alternate file
    directory = "",    -- Text to show when the buffer is a directory
  },
}

local filename = {
  'filename',
  file_status = true,     -- Displays file status (readonly status, modified status)
  newfile_status = false, -- Display new file status (new file means no write after created)
  path = 0,               -- 0: Just the filename
  -- 1: Relative path
  -- 2: Absolute path
  -- 3: Absolute path, with tilde as the home directory
  -- 4: Filename and parent dir, with tilde as the home directory

  shorting_target = 40, -- Shortens path to leave 40 spaces in the window
  -- for other components. (terrible name, any suggestions?)
  symbols = {
    modified = '  ',    -- Text to show when the file is modified.
    readonly = ' ',     -- Text to show when the file is non-modifiable or readonly.
    unnamed = '[No Name]', -- Text to show for unnamed buffers.
    newfile = '[New]',     -- Text to show for newly created file before first write
  }
}

local branch = {
  "branch",
  icons_enabled = true,
  icon = "",
  separator = { right = "" },
  cond = nil,
  type = nil,
  padding = 2,
}

local filesize = {
  "filesize",
  separator = { left = "" },
}


return {
  'nvim-lualine/lualine.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  opts = {
    options = {
      icons_enabled = true,
      theme = "catppuccin",
      -- component_separators = { left = "", right = "" },
      component_separators = { left = " ", right = " " },
      -- component_separators = { left = " | ", right = " | " },
      section_separators = { left = "", right = "" },
      disabled_filetypes = { "nvim-tree" },
      -- icons_enabled = true,
      -- component_separators = { left = "", right = "" },
      -- section_separators = { left = "", right = "" },
      ignore_focus = {},
      always_divide_middle = true,
      globalstatus = false,
      refresh = {
        statusline = 1000,
        tabline = 1000,
        winbar = 1000,
      },
    },
    sections = {
      lualine_a = { mode },
      lualine_b = { branch },
      lualine_c = { buffers },
      lualine_x = { "diagnostics" },
      lualine_y = { "diagnostics", "progress" },
      lualine_z = { filesize },
    },
    inactive_sections = {
      lualine_a = { mode },
      lualine_c = { filename },
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {},
  }
}
