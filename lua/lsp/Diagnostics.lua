local function Diagnostics(lsp)
vim.diagnostic.config({
  virtual_text=true,
})

lsp.set_sign_icons({
  error = '',
  warn = '',
  hint = '',
  info = ''
})

end

return Diagnostics
