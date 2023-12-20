local opts = { noremap = true, silent = false }

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("i", "<C-i>", "<Esc>")
