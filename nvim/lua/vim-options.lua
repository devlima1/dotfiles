--vim.opt.number = true
--vim.opt.relativenumber = true
vim.opt.cursorline = true
--vim.opt.colorcolumn = "80"

vim.diagnostic.config({
    virtual_text = true
})

vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.g.mapleader = " "
