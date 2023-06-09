return {
  "kylechui/nvim-surround",
  version = "*", -- Use for stability; omit to use `main` branch for the latest features
  lazy=true,
  config = function()
    require("nvim-surround").setup({
      -- Configuration here, or leave empty to use defaults
      keymaps = {
        insert = "<C-g>s",
        insert_line = "<C-g>S",
        normal = "s",
        normal_cur = "ss",
        normal_line = "S",
        normal_cur_line = "SS",
        visual = "s",
        visual_line = "gS",
        delete = "ds",
        change = "cs",
      },
      aliases = {
        ["a"] = ">",
        ["b"] = ")",
        ["c"] = "}",
        ["r"] = "]",
        ["s"] = "'",
        ["d"] = '"',
        ["l"] = '`',
        -- ["s"] = { "}", "]", ")", ">", '"', "'", "`" },
      },
    })
  end
}

