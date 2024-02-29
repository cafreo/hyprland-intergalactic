local opts = { noremap = true, silent = false }

local keymap = vim.keymap.set

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

--vim.g.mapleader = " "
--keymap("n", "<leader>pv", vim.cmd.Ex)

-- Quit neovim / go back to normal mode
keymap("n", "<C-q>", vim.cmd.quit)
keymap("i", "<C-q>", "<Esc>")

-- Copy to system keyboard
keymap({"n", "v", "i"}, "<C-c>", '"+y')
--keymap({"n", "v", "i"}, "<C-c>", '"+Y')

-- Paste from system keyboard
keymap({"n", "v", "c"}, "<C-v>", ':set paste<CR>"+p<CR>:set nopaste<CR>')
keymap("i", "<C-v>", '<C-r><C-o>+')

-- Cut to system keyboard
keymap({"v", "i"}, "<C-x>", '"+x')

-- Delete selected Text
keymap({"v"}, "<Bs>", "d")
keymap({"n", "v", "i"}, "<S-Del>", "DELETE")

-- Undo and Redo
keymap({"n"}, "<C-z>", "u")
keymap({"i"}, "<C-z>", "<C-o>u")
keymap({"n"}, "<C-S-z>", "<C-r>")
keymap({"i"}, "<C-S-z>", "<C-o><C-r>")

-- Navigate buffers
keymap({"n"}, "<C-Insert>", ":enew | Dashboard<CR>")
keymap({"n"}, "<C-PageUp>", ":bnext<CR>")
keymap({"n"}, "<C-PageDown>", ":bprevious<CR>")
keymap({"n"}, "q", ":bw<CR>")
--keymap({"n"}, "!", ":buffer 1<CR>")
--keymap({"n"}, '"', ":buffer 2<CR>")
--keymap({"n"}, "§", ":buffer 3<CR>")
--keymap({"n"}, "$", ":buffer 4<CR>")
--keymap({"n"}, "%", ":buffer 5<CR>")
--keymap({"n"}, "&", ":buffer 6<CR>")
--keymap({"n"}, "/", ":buffer 7<CR>")
--keymap({"n"}, "(", ":buffer 8<CR>")
--keymap({"n"}, ")", ":buffer 9<CR>")

-- Move text up and down
keymap("v", "<S-Up>", ":m .+1<CR>==")
keymap("v", "<S-Down>", ":m .-2<CR>==")

-- Plugin Keymaps
-- auto-save
keymap({"n"}, "<f5>", ":ASToggle<CR>")
