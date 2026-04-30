Plug 'itchyny/lightline.vim'

let g:lightline = {
     \ 'colorscheme': 'one',
     \ 'active': {
     \       'left': [
     \             [ 'mode', 'paste' ],
     \             [ 'readonly', 'filename', 'modified' ]
     \       ],
     \       'right': [
     \             [ 'lineinfo' ],
     \             [ 'filetype' ]
     \       ]
     \ },
\ }
