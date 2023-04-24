local function on_attach(client, bufnr)
  -- keybind options
  local opts = { remap = false, buffer = bufnr }
  local keymap = vim.keymap
  -- set keybinds
  keymap.set("n", "gf", function() vim.lsp.buf.definition() end, opts)
  keymap.set("n", "gr", function() vim.lsp.buf.references() end, opts) -- shows all occurences of symbol
  keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  keymap.set("n", "dl", function() vim.diagnostic.open_float() end, opts)
  keymap.set("n", "mm", function()
    vim.lsp.buf.format({ timeout_ms = 2000 })
  end, { desc = "Format code" })
  keymap.set("n", "grn", function() vim.lsp.buf.rename() end, opts)
  keymap.set("n", "ca", function() vim.lsp.buf.code_action() end, opts)
  keymap.set("n", "dn", function() vim.diagnostic.goto_next() end, opts)
  keymap.set("n", "dp", function() vim.diagnostic.goto_prev() end, opts)

  -- typescript specific keymaps (e.g. rename file and update imports)
  if client.name == "tsserver" then
    keymap.set("n", "tf", ":TypescriptRenameFile<CR>", opts)      -- rename file and update imports
    keymap.set("n", "to", ":TypescriptOrganizeImports<CR>", opts) -- organize imports (not in youtube nvim video)
    keymap.set("n", "tr", ":TypescriptRemoveUnused<CR>", opts)   -- remove unused variables (not in youtube nvim video)
    keymap.set("n", "ta", ":TypescriptAddMissingImports<CR>", opts)   -- remove unused variables (not in youtube nvim video)
  end
end

return on_attach
