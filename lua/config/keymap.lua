vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.keymap.set("i", "jk", "<Esc>")
-- vim.keymap.set("n", "<leader>e", ":Explore<CR>", { desc = "File explorer" })
vim.keymap.set("n", "<leader>ee", ":Ex<CR>")
vim.keymap.set("n", "<leader>l", ":Lazy<CR>")
vim.keymap.set("n", "<leader>mm", ":Mason<CR>")
-- Split Windows
-- Use these to create new splits
vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })   -- Left/Right
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- Up/Down
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
vim.keymap.set("n", "<leader>sx", "<cmd>close<cr>", { desc = "Close current split" })

-- Navigate Windows using <leader>w <h,j,k,l>
-- This matches your specific request for navigation
vim.keymap.set("n", "<leader>wh", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<leader>wj", "<C-w>j", { desc = "Move to lower window" })
vim.keymap.set("n", "<leader>wk", "<C-w>k", { desc = "Move to upper window" })
vim.keymap.set("n", "<leader>wl", "<C-w>l", { desc = "Move to right window" })
