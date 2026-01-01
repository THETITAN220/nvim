local opt = vim.opt

vim.opt.shadafile = "NONE"
opt.number = true
opt.relativenumber = true

opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true

opt.wrap = false
opt.cursorline = true
opt.termguicolors = true

opt.ignorecase = true
opt.smartcase = true

opt.splitbelow = true
opt.splitright = true

opt.scrolloff = 8
opt.signcolumn = "yes"
vim.opt.splitright = true
vim.opt.splitbelow = true
opt.clipboard = "unnamedplus"

vim.opt.numberwidth = 5
vim.opt.foldcolumn = "1"
vim.opt.signcolumn = "yes"
vim.opt.statuscolumn = "%C%=%l %s "

vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank()
    end,
})
