local lspconfig = require('lspconfig')

-- Configure ESLint language server
lspconfig.eslint.setup {
  -- Set the command that the language server executable is located at
  cmd = { "eslint", "--stdin", "--stdin-filename", "%filepath", "--format", "json", "vscode-eslint-language-server",
    "--stdio" },
  -- Define the filetypes the language server should handle
  filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx",
    "vue", "svelte", "astro" },
  -- Set the path to the ESLint configuration file
  settings = {
    codeAction = {
      disableRuleComment = {
        enable = true,
        location = "separateLine"
      },
      showDocumentation = {
        enable = true
      }
    },
    codeActionOnSave = {
      enable = false,
      mode = "all"
    },
    experimental = {
      useFlatConfig = false
    },
    format = true,
    nodePath = "",
    onIgnoredFiles = "off",
    packageManager = { "npm", "pnpm", "yarn" },
    problems = {
      shortenToSingleLine = false
    },
    quiet = false,
    rulesCustomizations = {},
    run = "onType",
    useESLintClass = false,
    validate = "on",
    workingDirectory = {
      mode = "location"
    }
  },
  -- Set the root directory of the project
  root_dir = lspconfig.util.root_pattern(".eslintrc.json", ".eslintrc.js", ".eslintrc", "package.json"),
  on_attach = function(_, bufnr)
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      command = "EslintFixAll",
    })
  end,
}
