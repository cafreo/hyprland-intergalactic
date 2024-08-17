local opts = { noremap = true, silent = false }

local keymap = vim.keymap.set

-- Functions

function toggle_relativenumbers()
    if (vim.opt.relativenumber == "true") then
        vim.opt.relativenumber="false";
    else
        vim.opt.relativenumber="true";
    end
end

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

--vim.g.mapleader = " "
--keymap("n", "<leader>pv", vim.cmd.Ex)

-- Reload config file
keymap({"n", "i", "v"}, "<C-r>", ":so ~/.config/nvim/init.lua <CR>:so % <CR>")

-- Quit neovim / go back to normal mode
keymap("n", "<C-q>", vim.cmd.quit)
keymap("i", "<C-q>", "<Esc>")
keymap("n", "<Esc>", ":nohlsearch<CR><Esc>")

-- Toggle settings
keymap({"n", "i"}, "<C-n>", '<C-o>:set relativenumber!<CR>')

-- Select
-- all
keymap({"n", "i"}, "<C-a>", 'ggVG')
-- current line
keymap({"n", "i"}, "<C-l>", '^V$')

-- Format code
keymap({"n", "i", "v"}, "<C-i>", 'gg=G')

-- Insert at start of line
keymap({"n", "i"}, "<C-j>", '<C-o>:1,1s!^!!<left>')
keymap({"n", "i"}, "<CS-j>", '<C-o>:%s!^!!<left>')
-- Insert at end of line
keymap({"n", "i"}, "<C-k>", '<C-o>:1,1s!$!!<left>')
keymap({"n", "i"}, "<CS-k>", '<C-o>:%s!$!!<left>')

-- Copy to system clipboard
keymap({"n", "v", "i"}, "<C-c>", '"+y')
--keymap({"n", "v", "i"}, "<C-c>", '"+Y')

-- Paste from system clipboard
keymap({"n", "c"}, "<C-v>", ':set paste<CR>"+p<CR>:set nopaste<CR>')
keymap("i", "<C-v>", '<C-r><C-o>+')
keymap({"v"}, "<C-v>", '"_dP')

-- Cut to system clipboard
keymap({"v", "i"}, "<C-x>", '"+x')

-- Delete selected Text
keymap({"v"}, "<Bs>", '"_d')
keymap({"v"}, "<Del>", '"_d')
keymap({"n", "v", "i"}, "<S-Del>", '"_DELETE')

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

-- Find
keymap({"n"}, "f", "/")
keymap({"n", "i"}, "<C-f>", ':1,1s/-/-/<left><left><left><left><left><left><left><left>')
-- keymap({"n", "i"}, "<CS-f>", '<C-o>:%s///gci<left><left><left><left>')

-- Move text up and down
keymap("v", "<S-Up>", ":m .+1<CR>==")
keymap("v", "<S-Down>", ":m .-2<CR>==")

-- Plugin Keymaps
-- auto-save
keymap({"n"}, "<C-F5>", '<C-o>:ASToggle<CR>')
