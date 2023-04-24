-- Example for neo-tree.nvim
return {
  "nvim-treesitter/nvim-treesitter",
  event = 'VimEnter',
  build = ':TSUpdate',
  config = function()
    require("nvim-treesitter.configs").setup({
      -- enable syntax highlighting
      highlight = {
        enable = true,
      },
      -- enable indentation
      indent = { enable = true },
      -- enable autotagging (w/ nvim-ts-autotag plugin)
      autotag = { enable = true },
      -- ensure these language parsers are installed
      ensure_installed = {
        "json",
        "json5",
        "astro",
        "javascript",
        "typescript",
        "tsx",
        "yaml",
        "html",
        "css",
        "scss",
        "sql",
        "markdown",
        "graphql",
        "bash",
        "lua",
        "vim",
        "dockerfile",
        "gitignore",
        "vimdoc"
      },
      rainbow = {
        enable = true,
        extended_mode = false,
      },
      -- auto install above language parsers
      auto_install = true,
    })
  end,
}
