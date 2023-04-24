return {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v2.x',
  dependencies = {
    -- LSP Support
    { 'neovim/nvim-lspconfig' }, -- Required
    {
      -- Optional
      'williamboman/mason.nvim',
      cmd = {"Mason"},
      build = function()
        pcall(vim.cmd, 'MasonUpdate')
      end,
    },
    { 'williamboman/mason-lspconfig.nvim' }, -- Optional

    -- Autocompletion
    {
      'hrsh7th/nvim-cmp',
      dependencies = {
        { "saadparwaiz1/cmp_luasnip" },
      }
    },                          -- Required

    { "onsails/lspkind.nvim" }, -- icons for cmp
    {
      'hrsh7th/cmp-nvim-lsp',
      dependencies = {
        {
          "L3MON4D3/LuaSnip",
          -- follow latest release.
          -- install jsregexp (optional!).
          build = "make install_jsregexp",
          dependencies = {
            'rafamadriz/friendly-snippets',
          },
        }
      },
      -- the rest of your configuration
    },
  },
  opts = function()
    local lsp = require('lsp-zero').preset({
      name = 'recommended',   -- minimal , recommended, lsp-only, manual-setup, system-lsp
      set_lsp_keymaps = true, -- determins if lsp.zero keymaps should be added or not
      manage_nvim_cmp = true,
      suggest_lsp_servers = true,
      setup_servers_on_start = true,
      configure_diagnostics = true, -- if true diagnostics adds boardsers to floating window
      float_border = "rounded",     -- 'none', 'single', 'double', 'rounded', 'solid' ,'shadow'
    })

    local Mason = require("lsp.Mason")
    Mason(lsp)

    local on_attach = require("lsp.LspConfig")
    lsp.on_attach(on_attach)

    local Diagnostics = require("lsp.Diagnostics")
    Diagnostics(lsp)

    -- Custom emmet_ls config
    require('lsp.Servers')
    -- (Optional) Configure lua language server for neovim
    require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

    lsp.setup()

    require("lsp.Cmp")
  end
}
