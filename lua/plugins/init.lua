return {
  -- Theme
  {
    "catppuccin/nvim",
    name = "catppuccin",
    build = function() vim.cmd.colorscheme "catppuccin" end
  }, -- Theme
  { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
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
    "roobert/tailwindcss-colorizer-cmp.nvim",
    -- optionally, override the default options:
    config = function()
      require("tailwindcss-colorizer-cmp").setup({
        color_square_width = 2,
      })
    end
  },
  -- Packer
  {
    "folke/noice.nvim",
    config       = function()
      require("noice").setup({
        -- add any options here
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
    config = function()
      require("nvim-treesitter.configs").setup({
        rainbow = {
          enable = true,
          -- list of languages you want to disable the plugin for
          disable = { 'cpp' },
          -- Which query to use for finding delimiters
          query = 'rainbow-parens',
          -- Highlight the entire buffer all at once
          strategy = require('ts-rainbow').strategy.global,
        }
      })
    end
  },
  {
    'echasnovski/mini.indentscope',
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
