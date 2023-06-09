local map = vim.keymap.set
--  General and move
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move highlight down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move highlight down" })
map("x", "<leader>p", "\"_dp", { desc = "Move highlight down" })
-- General
-- map("i", "jj", "<Esc>", { desc = "Escape with jj", nowait=true })
-- map("i", "<Tab>", "<C-V><Tab>", { desc = "Tab" })
map("n", "<leader>w", ":w<cr>", { desc = "Save" })
map("n", "<leader>c", ":bdelete<cr>", { desc = "Close buffer" })
map("n", "<leader>n", ":nohl<cr>", { desc = "Clear Highlights" })
-- map("n", "x", '"_x', { desc = "Deletes but does not copy to clipboard" })
map("n", "qq", ":bdelete!<cr>", { desc = "Closes Buffer" })
-- map caps b to beginning of line
map({ "n", "v" }, "<S-b>", "0", { desc = "Beginning of Line" })
-- map caps b to beginning of line
map({ "n", "v" }, "<S-e>", "$", { desc = "End of line" })
map("n", "yaf", "<cmd> %y+ <CR>", { desc = "copy whole file" })
--Split Screen
map("n", "<leader>\\", "<:vsp<cr>", { desc = "Split Screen Vertically" })
map("n", "<leader>-", ":sp<cr>", { desc = "Split Screen Horizontally" })
map("n", "<leader>se", "<C-w>=", { desc = "Make Splits Equal Widths" })
map("n", "<A-Right>", "<C-w>>", { desc = "Increase buffer width" })
map("n", "<A-Left>", "<C-w><", { desc = "Decrease buffer width" })
map("n", "<A-Up>", "<C-w>+", { desc = "Decrease buffer height" })
map("n", "<A-Down>", "<C-w>-", { desc = "Decrease buffer height" })

-- Buffers Move -- vim-tmux navigator replaced these
map("n", "<A-l>", "<C-w>l", { desc = "Move To Right Buffer" })
map("n", "<A-h>", "<C-w>h", { desc = "Move to Left Buffer" })
map("n", "<A-k>", "<C-w>k", { desc = "Move Up a Buffer" })
map("n", "<A-j>", "<C-w>j", { desc = "Move Down a Buffer" })
map("n", "<leader>bc", "<cmd>BufferLinePickClose<cr>", { desc = "Buffer Pick to Close" })
map("n", "<leader>bp", "<cmd>BufferLinePick<cr>", { desc = "Buffer Pick" })

--Tabs
map("n", "<leader>nt", ":tabnew<cr>", { desc = "Open New Tab" })
-- map("n", "<S-l>", ":tabn<cr>", { desc = "Go to Next tab" })
-- map("n", "<S-h>", ":tabp<cr>", { desc = "Go to Previous tab" })
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next buffer tab" })
map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Previous buffer tab" })

map("n", "<TAB>", "<C-6>", { desc = "return to previous file" })          -- toggle between 2 recent files
map("i", "jj", "<ESC>", { silent = true }, { desc = "return to previous file" }) -- escape
