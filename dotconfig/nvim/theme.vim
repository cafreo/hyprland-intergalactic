let s:palette = lightline#colorscheme#fill({
      \ 'normal': {
      \   'left':  [ [ '#201C28', '#EEB017', 'bold' ] ],
      \   'right': [ [ '#C8CACC', '#292531' ] ],
      \   'middle': [ [ '#C8CACC', '#292531' ] ]
      \ },
      \ 'insert': {
      \   'left':  [ [ '#201C28', '#4FCB11', 'bold' ] ],
      \   'right': [ [ '#C8CACC', '#292531' ] ],
      \   'middle': [ [ '#C8CACC', '#292531' ] ]
      \ },
      \ 'visual': {
      \   'left':  [ [ '#201C28', '#CB1183', 'bold' ] ],
      \   'right': [ [ '#C8CACC', '#292531' ] ],
      \   'middle': [ [ '#C8CACC', '#292531' ] ]
      \ },
      \ 'command': {
      \   'left':  [ [ '#201C28', '#DD6914', 'bold' ] ],
      \   'right': [ [ '#C8CACC', '#292531' ] ],
      \   'middle': [ [ '#C8CACC', '#292531' ] ]
      \ },
      \ 'replace': {
      \   'left':  [ [ '#201C28', '#CB2211', 'bold' ] ],
      \   'right': [ [ '#C8CACC', '#292531' ] ],
      \   'middle': [ [ '#C8CACC', '#292531' ] ]
      \ },
      \ 'tabline': {
      \   'left':  [ [ '#C8CACC', '#201C28' ] ],
      \   'right': [ [ '#C8CACC', '#201C28' ] ],
      \   'middle': [ [ '#C8CACC', '#201C28' ] ],
      \   'tabsel': [ [ '#C8CACC', '#292531', 'bold' ] ]
      \ }
      \ })

let g:lightline#colorscheme#intergalactic#palette = s:palette

let g:lightline = {
  \ 'colorscheme': 'intergalactic',
  \ 'separator': { 'left': '', 'right': '' },
  \ 'subseparator': { 'left': '', 'right': '' },
  \ 'active': {
  \       'left': [
  \             [ 'mode', 'paste' ],
  \             [ 'readonly', 'filename', 'filetype', 'modified' ]
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
