return {
  'glepnir/dashboard-nvim',
  event = 'VimEnter',
  opts = {
    theme = 'hyper',
    config = {
      week_header = {
        enable = true,
      },
      shortcut = {
        { desc = ' Lazy ', group = '@property', action = 'Lazy', key = 'l' },
        {
          desc = ' Find Files ',
          group = 'Label',
          action = 'Telescope find_files',
          key = '<leader>f',
        },
        {
          desc = ' Mason ',
          group = '@property',
          action = 'Mason',
          key = 'm',
        },
      },
    },
  },
  dependencies = { { 'nvim-tree/nvim-web-devicons' } }
}
