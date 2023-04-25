return {
  'neovim/nvim-lspconfig',
  cmd = 'LspInfo',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = {
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'williamboman/mason-lspconfig.nvim' },
    {
      'williamboman/mason.nvim',
      build = function()
        pcall(vim.cmd, 'MasonUpdate')
      end,
    },
  },
  config = function()
    local lspconfig = require('lspconfig')
    local lsp = require("lsp-zero")

    lsp.ensure_installed = {
      "tsserver", "html", "cssls", "tailwindcss", "astro", "emmet_ls",
      "eslint", "jsonls", "prettierd"
    }

    lsp.on_attach(function(client, bufnr)
      -- keybind options
      local opts = { remap = false, buffer = bufnr }
      local keymap = vim.keymap
      -- set keybinds
      keymap.set("n", "gf", function() vim.lsp.buf.definition() end, opts)
      keymap.set("n", "gr", function() vim.lsp.buf.references() end, opts) -- shows all occurences of symbol
      keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
      keymap.set("n", "dl", function()
        vim.diagnostic.open_float()
      end, opts)
      keymap.set("n", "mm",
        function()
          vim.lsp.buf.format({ timeout_ms = 2000 })
        end, { desc = "Format code" })
      keymap.set("n", "grn", function() vim.lsp.buf.rename() end, opts)
      keymap.set("n", "ca", function()
        vim.lsp.buf.code_action()
      end, opts)
      keymap.set("n", "dn", function()
        vim.diagnostic.goto_next()
      end, opts)
      keymap.set("n", "dp", function()
        vim.diagnostic.goto_prev()
      end, opts)

      -- typescript specific keymaps (e.g. rename file and update imports)
      if client.name == "tsserver" then
        keymap.set("n", "tf", ":TypescriptRenameFile<CR>", opts)        -- rename file and update imports
        keymap.set("n", "to", ":TypescriptOrganizeImports<CR>", opts)   -- organize imports (not in youtube nvim video)
        keymap.set("n", "tr", ":TypescriptRemoveUnused<CR>", opts)      -- remove unused variables (not in youtube nvim video)
        keymap.set("n", "ta", ":TypescriptAddMissingImports<CR>", opts) -- remove unused variables (not in youtube nvim video)
      end
    end)

    -- DIAGNOSTICS
    lsp.set_sign_icons({
      error = '',
      warn = '',
      hint = '',
      info = ''
    })
    -- (Optional) Configure lua language server for neovim
    require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())

    lsp.setup()
    -- SERVERS
    lspconfig.emmet_ls.setup({ filetypes = { 'html', 'sass', 'scss', 'less' } })

    lspconfig.eslint.setup {
      -- set the command that the language server executable is located at
      cmd = {
        "eslint", "--stdin", "--stdin-filename", "%filepath",
        "--format", "json", "vscode-eslint-language-server", "--stdio"
      },
      -- define the filetypes the language server should handle
      filetypes = {
        "javascript", "javascriptreact", "javascript.jsx", "typescript",
        "typescriptreact", "typescript.tsx", "vue", "svelte", "astro"
      },
      -- set the path to the eslint configuration file

      -- set the root directory of the project
      root_dir = lspconfig.util.root_pattern(".eslintrc.json",
        ".eslintrc.js", ".eslintrc",
        "package.json"),
      on_attach = function(_, bufnr)
        vim.api.nvim_create_autocmd("bufwritepre", {
          buffer = bufnr,
          command = "eslintfixall"
        })
      end
    }
    require("typescript").setup({
      disable_commands = false, -- prevent the plugin from creating Vim commands
      debug = false,            -- enable debug logging for commands
      go_to_source_definition = {
        fallback = true         -- fall back to standard LSP definition on failure
      }
    })
  end
}
