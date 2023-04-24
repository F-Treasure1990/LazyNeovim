vim.api.nvim_create_augroup("bufcheck", { clear = true })
-- highlight yanks
vim.api.nvim_create_autocmd("TextYankPost", {
  group = "bufcheck",
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({ timeout = 500 })
  end,
})

-- Enable spell checking for certain file types
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, { pattern = { "*.md", "*.tex" }, command = "setlocal spell" })


-- allows line number colour change, depending on mode.
vim.api.nvim_create_autocmd('ModeChanged', {
  callback = function()
    local modes = {
      ['i'] = '#A6E3A1',
      ['n'] = '#74C7EC',
      ['v'] = '#CBA6F7',
      ['V'] = '#CBA6F7',
      [''] = '#CBA6F7',
      ['r'] = '#F38BA8',
      ['R'] = '#F38BA8',
      ['c'] = '#F2CDCD'
    }
    vim.api.nvim_set_hl(0, 'CursorLineNr', {
      foreground = modes[vim.api.nvim_get_mode().mode] or '#737aa2'
    })
  end,
})
