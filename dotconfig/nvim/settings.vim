set encoding=utf8
set guifont=UbuntuMono\ Nerd\ Font\ 12

set listchars=tab:\▏\ 
set list

" theming
colorscheme catppuccin
set termguicolors

" filetype
filetype on
filetype plugin indent on

" ui
syntax on
set number relativenumber
set numberwidth=2
set cursorline
set scrolloff=8
set sidescrolloff=8
set noshowmode

" tabline
set showtabline=2

" status line / ruler
let g:currentmode={
       \ 'n'  : 'NORMAL ',
       \ 'v'  : 'VISUAL ',
       \ 'V'  : 'V·Line ',
       \ "\<C-V>" : 'V·Block ',
       \ 'i'  : 'INSERT ',
       \ 'R'  : 'R ',
       \ 'Rv' : 'V·Replace ',
       \ 'c'  : 'Command ',
       \}

set noruler
set statusline=
set statusline+=\ %{toupper(g:currentmode[mode()])}
set statusline+=\ %R\ %F\ %M\ %Y
set statusline+=%=
set statusline+=\ %l\ %c
set laststatus=2

" indent
set shiftwidth=4
set tabstop=4
set expandtab
set wrap
set autoindent
set smartindent
set cindent

" change history file
set undofile
set undodir=$HOME/.nvim/undo

" backup
set nobackup

" search
set incsearch
set ignorecase
set smartcase
set showmatch
set hlsearch

set history=1000

" auto completion
set wildmenu
set wildmode=list:full
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx
set completeopt+=menuone

" clipboard
set clipboard=unnamedplus

" misc
set shortmess+=c
set belloff+=ctrlg
set nocompatible
set mouse=a
