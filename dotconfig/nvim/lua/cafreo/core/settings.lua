vim.cmd('colorscheme default')

syntax = true

vim.opt.number = true

vim.opt.incsearch = true

vim.opt.smartindent = true

vim.opt.undofile = true
vim.opt.undodir = os.getenv("HOME") .. "/.nvim/undodir"

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

vim.opt.clipboard = "unnamedplus"
vim.opt.conceallevel = 0
vim.opt.hlsearch = true  
vim.opt.ignorecase = true  
vim.opt.mouse = "a" 
vim.opt.showtabline = 2  
vim.opt.splitbelow = true
vim.opt.splitright = true 
vim.opt.cursorline = true
vim.opt.relativenumber = false   
vim.opt.numberwidth = 2  

vim.opt.wrap = false
vim.opt.linebreak = true
vim.opt.list = false
