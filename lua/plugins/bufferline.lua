return {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    local bufferline = require('bufferline')
    bufferline.setup({
      options = {
        modified_icon = " ",
        themable = true,          -- allows highlight groups to be overriden i.e. sets highlights as default
        buffer_close_icon = ' ',
        name_formatter = "name",  -- the basename of the active file
        color_icons = true,       -- whether or not to add the filetype icon highlights
        separator_style = "thin", -- "slant" | "slope" | "thick" | "thin" | { 'any', 'any' },
        diagnostics = "nvim_lsp",
        show_buffer_close_icons = false,
      },
      highlights = {
        buffer_selected = {
          fg = "#94E2D5",
          bold = true,
          italic = true,
        },
        buffer_visible = {
          fg = "#94E2D5",
          bold = true,
          italic = true,
        },
        background = {
          fg = '#585B70',
          bg = '#1E1E2E',
        },
        modified = {
          fg = '#A6E3A1',
        },
        modified_visible = {
          fg = '#A6E3A1',
        },
        modified_selected = {
          fg = '#A6E3A1',
        },
        separator_selected = {
          fg = '#74C7EC',
          bg = '#74C7EC',
        },
        indicator_selected = {
          fg = '#1E1E2E',
        },
        separator = {
          fg = '#1E1E2E',
        },
      }
    })
  end,
}
