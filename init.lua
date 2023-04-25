-- Lazy Package Manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.highlighturl_enabled = true -- highlight URLs by default
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

require("core")
require("lazy").setup('plugins')
require("core.Theme")
