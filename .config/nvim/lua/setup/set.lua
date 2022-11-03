vim.g.mapleader        = " "

vim.opt.undofile       = true
vim.opt.number         = true
vim.opt.relativenumber = true
vim.opt.cursorline     = true
vim.opt.scrolloff      = 5

vim.opt.softtabstop    = 4
vim.opt.shiftwidth     = 4
vim.opt.tabstop        = 4
vim.opt.shiftround     = true
vim.opt.expandtab      = true

vim.opt.ignorecase     = true
vim.opt.smartcase      = true
vim.opt.fileignorecase = true
vim.opt.incsearch      = true

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
