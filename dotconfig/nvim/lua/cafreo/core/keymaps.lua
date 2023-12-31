local opts = { noremap = true, silent = false }

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Quit neovim / go back to normal mode
vim.keymap.set("n", "<C-q>", vim.cmd.quit)
vim.keymap.set("i", "<C-q>", "<Esc>")

-- Copy to system keyboard
vim.keymap.set({"n", "v", "i"}, "<C-c>", '"+y')
vim.keymap.set({"n", "v", "i"}, "<C-c>", '"+Y')

-- Paste from system keyboard
vim.keymap.set({"n", "v"}, "<C-v>", '"*P')
vim.keymap.set("i", "<C-v>", '<C-r>+')

-- Cut to system keyboard
vim.keymap.set({"v", "i"}, "<C-x>", '"+x')
