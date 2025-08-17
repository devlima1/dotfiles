vim.opt.number = true
vim.opt.cursorline = true

vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

vim.g.mapleader = " "

vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	update_in_insert = false,
	underline = true,
})

vim.opt.clipboard = "unnamedplus" -- requires wl-clipboard to work

vim.keymap.set("n", "<F5>", ':!gcc "%" -o "%:r" && "%:r"<CR>')
vim.keymap.set("n", "<F6>", ':!g++ "%" -o "%:r" && "%:r"<CR>')
