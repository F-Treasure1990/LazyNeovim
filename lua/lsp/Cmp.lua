local cmp = require("cmp")
local luasnip = require("luasnip")
local cmp_action = require('lsp-zero').cmp_action()
local icons = require("core.icons")
-- fjdkdjfkfj
require('luasnip.loaders.from_vscode').lazy_load()
cmp.setup({
  enabled = function()
    -- disable completion in comments
    local context = require 'cmp.config.context'
    -- prevents in telescope
    if vim.bo.buftype == 'prompt' then
      return false
    end
    -- keep command mode completion enabled when cursor is in a comment
    if vim.api.nvim_get_mode().mode == 'c' then
      return true
    else
      return not context.in_treesitter_capture("comment")
          and not context.in_syntax_group("Comment")
    end
  end,
  -- ent sure what this does
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  formatting = {
    format = require("lspkind").cmp_format({
      ellipsis_char = "...",
      before = function(entry, vim_item)
        if entry.source.name == "luasnip" then
          vim_item.kind = string.format("%s %s", icons.cmp["luasnip"], "LuaSnip")
          return vim_item
        end
        if vim_item.kind == "Color" then
          vim_item.kind = string.format("%s %s", icons.cmp[vim_item.kind], vim_item.kind)
          require("tailwindcss-colorizer-cmp").formatter(entry, vim_item)
          return vim_item
        end
        if vim_item.menu then
          vim_item.kind = string.format("%s", vim_item.menu)
          return vim_item
        end
        vim_item.kind = string.format("%s %s", icons.cmp[vim_item.kind], vim_item.kind)
        return vim_item
      end,
    }),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-n>'] = cmp_action.luasnip_jump_forward(),
    ['<C-p>'] = cmp_action.luasnip_jump_backward(),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false }), -- selects first option
    ["<C-l>"] = cmp.mapping.complete({                                                          -- filters luasnip keymaps
      config = {
        sources = {
          { name = "luasnip" },
        },
      },
    }),
    ["<Tab>"] = cmp_action.luasnip_supertab(),
    ["<S-Tab>"] = cmp_action.luasnip_shift_supertab(),
  }),
  sources = {
    { name = 'buffer',   max_item_count = 5 },
    { name = 'path',     max_item_count = 5 },
    { name = "nvim_lsp", max_item_count = 6 }, -- lsp
    { name = 'luasnip',  max_item_count = 4 },
  },
  --window = {
  --   completion = cmp.config.window.bordered(),
  --  documentation = cmp.config.window.bordered(),
  -- },
  window = {
    completion = cmp.config.window.bordered({
      border = { "", "", "", "", "", "", "", "" },
      maxwidth = 72,                             -- Set the maximum width of the documentation window
      minwidth = 40,                             -- Set the minimum width of the documentation window
      maxheight = math.floor(vim.o.lines * 0.3), -- Set the maximum height of the documentation window
      minheight = 1,
      side_padding = 1,
    }),
    documentation = cmp.config.window.bordered(),
  },
})

-- If you want insert `(` after select function or method item
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)
