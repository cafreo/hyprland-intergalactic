Plug 'itchyny/lightline.vim'

let g:lightline = {
  \ 'separator': { 'left': '', 'right': '' },
  \ 'subseparator': { 'left': '', 'right': '' },
  \ 'active': {
  \       'left': [
  \             [ 'mode', 'paste' ],
  \             [ 'readonly', 'filename', 'filetype' ,'modified' ]
  \       ],
  \       'right': [
  \             [ 'lineinfo' ],
  \       ]
  \ },
  \ 'component_function': {
  \       'filetype': 'DevIconsFiletype',
  \       'filetformat': 'DevIconsFileformat'
  \ },
  \ }

function! DevIconsFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction
  
function! DevIconsFileformat()
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction
