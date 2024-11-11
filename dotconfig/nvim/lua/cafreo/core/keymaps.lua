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

keymap({""}, "<Space>", "<Nop>", opts)

-- Reload config file
keymap({"n", "i", "v"}, "<C-r>", ":so ~/.config/nvim/init.lua <CR>:so % <CR>", opts)

-- Quit neovim / go back to normal mode
keymap({"n"}, "<C-q>", vim.cmd.quit, opts)
keymap({"i"}, "<C-q>", "<Esc>", opts)
keymap({"n"}, "<Esc>", ":nohlsearch<CR><Esc>", opts)

-- Toggle settings
keymap({"n", "i"}, "<C-n>", '<C-o>:set relativenumber!<CR>', opts)

-- Select
-- all
keymap({"n", "i"}, "<C-a>", 'ggVG', opts)
-- current line
keymap({"n", "i"}, "<C-l>", '^V$', opts)

-- Format code
keymap({"n", "i", "v"}, "<C-i>", "gg=G''", opts)

-- Stay in indent mode
keymap({"v"}, "<", "<gv", opts)
keymap({"v"}, ">", ">gv", opts)

-- Move text up and down
keymap({"v"}, "<S-up>", ":m .-1<CR>==", opts)
keymap({"v"}, "<S-down", ":m .+2<CR>==", opts)

-- Insert at start of line
keymap({"n", "i"}, "<C-j>", '<C-o>:1,1s!^!!<left>', opts)
keymap({"n", "i"}, "<CS-j>", '<C-o>:%s!^!!<left>', opts)
-- Insert at end of line
keymap({"n", "i"}, "<C-k>", '<C-o>:1,1s!$!!<left>', opts)
keymap({"n", "i"}, "<CS-k>", '<C-o>:%s!$!!<left>', opts)

-- Copy to system clipboard
keymap({"n", "v", "i"}, "<C-c>", '"+y', opts)
--keymap({"n", "v", "i"}, "<C-c>", '"+Y')

-- Paste from system clipboard
keymap({"n", "c"}, "<C-v>", ':set paste<CR>"+p<CR>:set nopaste<CR>', opts)
keymap({"i"}, "<C-v>", '<C-r><C-o>+', opts)
keymap({"v"}, "<C-v>", '"_dP', opts)

-- Cut to system clipboard
keymap({"v", "i"}, "<C-x>", '"+x', opts)

-- Delete selected Text
keymap({"v"}, "<Bs>", '"_d', opts)
keymap({"v"}, "<Del>", '"_d', opts)
keymap({"n", "v", "i"}, "<S-Del>", '"_DELETE', opts)

-- Undo and Redo
keymap({"n"}, "<C-z>", "u", opts)
keymap({"i"}, "<C-z>", "<C-o>u", opts)
keymap({"n"}, "<C-S-z>", "<C-r>", opts)
keymap({"i"}, "<C-S-z>", "<C-o><C-r>", opts)

-- Navigate buffers
keymap({"n"}, "<C-Insert>", ":enew | Dashboard<CR>", opts)
keymap({"n"}, "<C-PageUp>", ":bnext<CR>", opts)
keymap({"n"}, "<C-PageDown>", ":bprevious<CR>", opts)
keymap({"n"}, "q", ":bw<CR>", opts)
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
keymap({"n"}, "f", "/", opts)
keymap({"n", "i"}, "<C-f>", ':1,1s/-/-/<left><left><left><left><left><left><left><left>', opts)
-- keymap({"n", "i"}, "<CS-f>", '<C-o>:%s///gci<left><left><left><left>')

-- Move text up and down
keymap("v", "<S-Up>", ":m .+1<CR>==", opts)
keymap("v", "<S-Down>", ":m .-2<CR>==", opts)

-- Plugin Keymaps
-- auto-save
keymap({"n"}, "<C-F5>", '<C-o>:ASToggle<CR>', opts)
