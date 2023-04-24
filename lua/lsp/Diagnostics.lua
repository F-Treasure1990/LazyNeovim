local function Diagnostics(lsp)
  vim.diagnostic.config({
    enabled = true,
    virtual_text = {
      format = function(diagnostic)
        if diagnostic.severity == vim.diagnostic.severity.INFO then
          return string.format(" %s", diagnostic.message)
        end
        if diagnostic.severity == vim.diagnostic.severity.HINT then
          return string.format(" %s", diagnostic.message)
        end

        return string.format(" %s", diagnostic.message)
      end,
    },
    underline = true,
    signs = true,
  })

  lsp.set_sign_icons({
    error = '',
    warn = '',
    hint = '',
    info = ''
  })
end
return Diagnostics

--[[ format = function(diagnostic)
  if diagnostic.severity == vim.diagnostic.severity.ERROR then
    return string.format("E: %s", diagnostic.message)
  end
  return diagnostic.message
end ]]
