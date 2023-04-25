return {
  -- Theme
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    lazy = true
  }, -- Theme
  {
    "christoomey/vim-tmux-navigator",
    keys = {
      "<C-l>",
      "<C-h>",
      "<C-j>",
      "<C-k>"
    }
  }, -- needed for tmux + neovim navigation
  {
    "mbbill/undotree",
    keys = {
      { "<leader>u", "<cmd>UndotreeToggle<cr>", desc = "toggle undo tree" },
    }
  },
  {
    "jose-elias-alvarez/typescript.nvim", -- minimal typescript server
    keys = {
      { "tf", ":TypescriptRenameFile<CR>",        desc = "toggle undo tree" },
      { "to", ":TypescriptOrganizeImports<CR>",   desc = "toggle undo tree" },
      { "tr", ":TypescriptRemoveUnused<CR>",      desc = "toggle undo tree" },
      { "ta", ":TypescriptAddMissingImports<CR>", desc = "toggle undo tree" },
    }
  },
  
  {
    "folke/noice.nvim",
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      require("noice").setup({
        lsp = {
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
          },
        },
        -- you can enable a preset for easier configuration
        presets = {
          bottom_search = false,         -- use a classic bottom cmdline for search
          command_palette = false,       -- position the cmdline and popupmenu together
          long_message_to_split = false, -- long messages will be sent to a split
          inc_rename = true,           -- enables an input dialog for inc-rename.nvim
          lsp_doc_border = true,       -- add a border to hover docs and signature help
        },
      })
    end,
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    }
  },
  {
    "HiPhish/nvim-ts-rainbow2",
    lazy = true
  },
  {
    'echasnovski/mini.indentscope',
    event = { 'BufRead', 'BufNewFile' },
    version = false,
    config = function()
      require('mini.indentscope').setup({
        draw = {
          delay = 50,
        }
      })
    end
  },
}
