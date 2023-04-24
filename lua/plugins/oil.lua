return {
  'stevearc/oil.nvim',
  keys = {
    { "<leader>e", "<cmd>Oil./ --float <cr>", desc = "return to previous file" } -- oil navigator float
  },
  config = function()
    require('oil').setup({
      win_options = {
        wrap = false,
        signcolumn = "yes",
        cursorcolumn = true,
        foldcolumn = "0",
        spell = false,
        list = false,
        conceallevel = 3,
        concealcursor = "n",
      },
      keymaps = {
        ["?"] = "actions.show_help",
        ["<CR>"] = "actions.select",
        ["sv"] = "actions.select_vsplit",
        ["sh"] = "actions.select_split",
        ["P"] = "actions.preview",
        ["q"] = "actions.close",
        ["R"] = "actions.refresh",
        ["-"] = "actions.parent",
        ["_"] = "actions.open_cwd",
        ["`"] = "actions.cd",
        ["~"] = "actions.tcd",
        ["H"] = "actions.toggle_hidden",
      },
      use_default_keymaps = false,
      float = {
        -- Padding around the floating window
        padding = 2,
        max_width = 70,
        max_height = 70,
        border = "rounded",
        win_options = {
          winblend = 10,
        },
      },
      view_options = {
        -- Show files and directories that start with "."
        show_hidden = false,
        -- This function defines what is considered a "hidden" file
        is_hidden_file = function(name, _)
          return vim.startswith(name, ".") or vim.startswith(name, "node_modules")
        end,
        -- This function defines what will never be shown, even when `show_hidden` is set
        is_always_hidden = function(_, _)
          return false
        end,
      },
    })
  end
}
