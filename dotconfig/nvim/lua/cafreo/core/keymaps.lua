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
keymap({"n"}, "<C-r>", ":source $MYVIMRC <CR>", opts)

-- Quit neovim / go back to normal mode
keymap({"n"}, "<C-q>", vim.cmd.quit, opts)
keymap({"i", "v"}, "<C-q>", "<Esc>", opts)
keymap({"n"}, "<Esc>", ":nohlsearch<CR><Esc>", opts)

-- Toggle settings
-- XXX keymap({"n", "i"}, "<C-n>", '<C-o>:set relativenumber!<CR>', opts)

-- Select
-- all
keymap({"n"}, "<C-a>", 'ggVG', opts)
keymap({"i"}, "<C-a>", '<C-o>gg<C-o>VG', opts)
-- current line
keymap({"n"}, "<C-l>", '^V$', opts)
keymap({"i"}, "<C-l>", '<C-o>^<C-o>V$', opts)

-- Format code
keymap({"n"}, "<C-i>", "gg=G''", opts)
keymap({"v"}, "<C-i>", "=", opts)

-- Stay in indent mode
keymap({"v"}, "<", "<gv", opts)
keymap({"v"}, ">", ">gv", opts)

-- Move text up and down
keymap({"n"}, "<C-up>", "ddkP", opts)
keymap({"n"}, "<C-down>", "ddp", opts)
keymap({"v"}, "<C-up>", "dkP`[V`]", opts)
keymap({"v"}, "<C-down>", "dp`[V`]", opts)

-- Insert at start of line
keymap({"n", "i"}, "<C-h>", 'I', opts)
keymap({"v"}, "<C-h>", ':normal I', opts)
-- Insert at end of line
keymap({"n", "i"}, "<C-l>", 'A', opts)
keymap({"v"}, "<C-l>", ':normal A', opts)

-- Copy to system clipboard
keymap({"n"}, "<C-c>", '^V$"+y', opts)
keymap({"v"}, "<C-c>", '"+y', opts)
keymap({"v"}, "c", '"+y', opts)

-- Paste from system clipboard
keymap({"n"}, "<C-v>", ':set paste<CR>"+p<CR>:set nopaste<CR>', opts)
keymap({"i"}, "<C-v>", '<C-r><C-o>+', opts)
keymap({"v"}, "<C-v>", '"_dP', opts)
keymap({"v"}, "v", '"_dP', opts)

-- Cut to system clipboard
keymap({"n"}, "<C-x>", '^V$"+x', opts)
keymap({"v"}, "<C-x>", '"+x', opts)

-- Delete selected Text
keymap({"n"}, "<S-Bs>", '^V$"_d', opts)
keymap({"v"}, "<Bs>", '"_d', opts)
keymap({"v"}, "<Del>", '"_d', opts)

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
keymap({"n"}, "<C-f>", ':1,1s/-/-/<left><left><left><left><left><left><left><left>', opts)
keymap({"i"}, "<C-f>", '<C-o>:1,1s/-/-/<left><left><left><left><left><left><left><left>', opts)

-- Plugin Keymaps
-- auto-save
keymap({"n"}, "<C-F5>", '<C-o>:ASToggle<CR>', opts)

-- record macro
keymap({"n"}, "r", "q", opts)

-- count up numbers in selected lines
keymap({"v"}, "n", "g<C-a>", opts)

