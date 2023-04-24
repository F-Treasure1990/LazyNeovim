--vim.opt.fillchars:append({ eob = " " }) -- remove ~
--https://www.youtube.com/watch?v=vdn_pKJUda8

local Options = {
  backspace = "indent,eol,start",
  autoindent= true,
  backup = false, -- creates a backup file
  -- clipboard = "unnamedplus", -- allows neovim to access the system clipboard
  cmdheight = 1, -- more space in the neovim command line for displaying messages
  completeopt = {"menu", "menuone", "noselect" }, -- mostly just for cmp
  conceallevel = 0, -- so that `` is visible in markdown files
  cursorline = true, -- highlight the current line
  copyindent = true, -- Copy the previous indentation on autoindenting
  expandtab = true, -- convert tabs to spaces
  fileencoding = "utf-8", -- the encoding written to a file
  spelllang = 'en_us',
  spell = false,
  -- guifont = "monospace:h17",               -- the font used in graphical neovim applications
  textwidth = 160, --text width
  hlsearch = true, -- highlight all matches on previous search pattern
  incsearch = true,
  history = 100,
  ignorecase = true, -- ignore case in search patterns
  laststatus = 2,
  mouse = "a", -- allow the mouse to be used in neovim
  number = true, -- set numbered lines
  numberwidth = 4, -- set number column width to 2 {default 4}
  pumheight = 10, -- pop up menu height
  preserveindent = true, -- Preserve indent structure as much as possible
  relativenumber = true, -- set relative numbered lines
  showtabline = 0, -- always show tabs
  smartcase = true, -- smart case
  smartindent = true, -- make indenting smarter again
  splitbelow = true, -- force all horizontal splits to go below current window
  scrolloff = 8, -- is one of my fav
  splitright = true, -- force all vertical splits to go to the right of current window
  shiftwidth = 2, -- the number of spaces inserted for each indentation
   --signcolumn = "auto:4", -- where gutter signs will appear auto / "no" / "yes" / "number
  -- signcolumn = "auto:3", -- where gutter signs will appear auto / "no" / "yes" / "number
  signcolumn = "yes", -- where gutter signs will appear auto / "no" / "yes" / "number
  showmode = false, -- Disable showing modes in command line
  swapfile = false, -- creates a swapfile
  sidescrolloff = 8,
  termguicolors = true, -- set term gui colors (most terminals support this)
  timeoutlen = 300, -- time to wait for a mapped sequence to complete (in milliseconds)
  tabstop = 2, -- insert 2 spaces for a tab
  undofile = true, -- enable persistent undo
  updatetime = 300, -- faster completion (4000ms default)
  writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  wrap = true, -- display lines as one long line
  background = "dark",
}
-- appends comp clip board to neovim
vim.opt.clipboard:append("unnamedplus")
--links "-" to whole words so when dw the whole thing is deleted
vim.opt.iskeyword:append("-")

vim.cmd[[ autocmd BufRead,BufEnter *.astro set filetype=astro]]

for k, v in pairs(Options) do
  vim.opt[k] = v
end
