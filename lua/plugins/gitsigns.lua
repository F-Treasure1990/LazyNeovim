return {
  "lewis6991/gitsigns.nvim",
  init = function()
    -- load gitsigns only when a git file is opened
    vim.api.nvim_create_autocmd({ "BufRead" }, {
      group = vim.api.nvim_create_augroup("GitSignsLazyLoad", { clear = true }),
      callback = function()
        vim.fn.system("git -C " .. '"' .. vim.fn.expand "%:p:h" .. '"' .. " rev-parse")
        if vim.v.shell_error == 0 then
          vim.api.nvim_del_augroup_by_name "GitSignsLazyLoad"
          vim.schedule(function()
            require("lazy").load { plugins = { "gitsigns.nvim" } }
          end)
        end
      end,
    })
  end,
  opts = {
    signs = {
      add          = { hl = 'GitSignsAdd', text = '│', numhl = 'GitSignsAddNr', linehl = 'GitSignsAddLn' },
      change       = { hl = 'GitSignsChange', text = '│', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
      delete       = { hl = 'GitSignsDelete', text = '│', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
      topdelete    = { hl = 'GitSignsDelete', text = '│', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
      changedelete = { hl = 'GitSignsChange', text = '│', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
    },
  }
}
