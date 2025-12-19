vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set("n", "<leader>ee", ":Ex<CR>")
vim.keymap.set("n", "<leader>l", ":Lazy<CR>")
vim.keymap.set("n", "<leader>mm", ":Mason<CR>")

-- Split Windows
vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
vim.keymap.set("n", "<leader>sx", "<cmd>close<cr>", { desc = "Close current split" })

vim.keymap.set("n", "<leader>wh", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<leader>wj", "<C-w>j", { desc = "Move to lower window" })
vim.keymap.set("n", "<leader>wk", "<C-w>k", { desc = "Move to upper window" })
vim.keymap.set("n", "<leader>wl", "<C-w>l", { desc = "Move to right window" })
vim.keymap.set('n', '<leader>bd', ':bp|bd #<CR>', { desc = 'Close Buffer, Keep Window' })
