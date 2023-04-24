return {
  "windwp/nvim-autopairs",
  opts = function()
    local autopairs = require("nvim-autopairs")
    autopairs.setup {
      check_ts = true, -- enable treesitter
      disable_filetype = { "TelescopePrompt", "vim" },
      ts_config = {
        lua = { "string" },           -- don't add pairs in lua string treesitter nodes
        javascript = { "template_string" }, -- don't add pairs in javscript template_string treesitter nodes
        java = false,                 -- don't check treesitter on java
      }

    }
  end
}
