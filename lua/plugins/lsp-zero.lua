return {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v2.x',
  lazy = true,
  config = function()
    require('lsp-zero').preset({
      name = 'recommended',   -- minimal , recommended, lsp-only, manual-setup, system-lsp
      set_lsp_keymaps = true, -- determins if lsp.zero keymaps should be added or not
      manage_nvim_cmp = true,
      suggest_lsp_servers = true,
      setup_servers_on_start = true,
      configure_diagnostics = true, -- if true diagnostics adds boardsers to floating window
      float_border = "rounded"      -- 'none', 'single', 'double', 'rounded', 'solid' ,'shadow'
    })

    require('mason').setup({ ui = { border = 'rounded' } })
  end
}
