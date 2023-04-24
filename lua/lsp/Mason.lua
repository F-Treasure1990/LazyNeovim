function Mason(lsp)
  require('mason').setup({
    ui = {
      border = 'rounded'
    }
  })

   lsp.ensure_installed = {
    "tsserver",
    "html",
    "cssls",
    "tailwindcss",
    "astro",
    "emmet_ls",
    "eslint",
    "jsonls",
    "prettierd",
  }
end

return Mason
