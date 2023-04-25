return {
  "windwp/nvim-autopairs",
  event = { "BufRead" },
  opts = function()
    local autopairs = require("nvim-autopairs")
    autopairs.setup {
      check_ts = true, -- enable treesitter
      disable_filetype = { "TelescopePrompt", "vim" }
    }
  end
}
