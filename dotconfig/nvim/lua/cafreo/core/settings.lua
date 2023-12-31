vim.cmd('colorscheme default')

syntax = true

vim.opt.nu = true

vim.opt.incsearch = true

vim.opt.smartindent = true

vim.opt.undofile = true
vim.opt.undodir = os.getenv("HOME") .. "/.nvim/undodir"

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
