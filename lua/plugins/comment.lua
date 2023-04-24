return {
  "numTostr/Comment.nvim",
  keys = {
    "gc", "gb", "gk", "gj", "ge"
  },
  config = function()
    local ft = require("Comment.ft")
    ft.set("astro", { "<!-- %s -->" })
    ft.set("typescriptreact", { "{/* %s */}" })
    require("Comment").setup({
      toggler = {
        ---Line-comment toggle keymap
        line = "gc",
        ---Block-comment toggle keymap
        block = "gb",
      },
      opleader = {
        ---Line-comment keymap
        line = "gc",
        ---Block-comment keymap
        block = "gb",
      },
      ---LHS of extra mappings
      extra = {
        ---Add comment on the line above
        above = "gk",
        ---Add comment on the line below
        below = "gj",
        ---Add comment at the end of line
        eol = "ge",
      },
    })
  end,
}
