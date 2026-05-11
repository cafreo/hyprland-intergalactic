" QUIT
" quit neovim / go back to normal mode
nnoremap <C-q> :q<CR>
inoremap <C-q> <Esc>
vnoremap <C-q> <Esc>
" clear search highlights
nnoremap <Esc> :nohlsearch<CR><Esc>

" SELECT
" all
nnoremap <C-a> ggVG
inoremap <C-a> <C-o>gg<C-o>VG
" current line
nnoremap <C-l> ^V$
inoremap <C-l> <C-o>^<C-o>V$
" current paragraph
nnoremap <C-p> vip
inoremap <C-p> <C-o>vip
" current word
nnoremap <C-right> viw

" INDENTATION
" auto all
nnoremap <C-i> gg=G
" auto selection
vnoremap <C-i> =
" manual selection
vnoremap < <gv
vnoremap > >gv

" COPY PASTE
" copy
nnoremap <C-c> ^V$"+y
vnoremap <C-c> "+y
" paste
nnoremap <C-v> :set paste <CR>"+p<CR>:set nopaste<CR>
inoremap <C-v> <C-r><C-o>+
vnoremap <C-v> "_dP"
" cut
nnoremap <C-x> ^V$"+x
vnoremap <C-x> "+x

" DELETE
vnoremap <BS> "_d
vnoremap <Delete> "_d

" UNDO REDO
" undo
nnoremap <C-z> u
inoremap <C-z> <C-o>u
" redo
nnoremap <C-S-z> <C-r>
inoremap <C-S-z> <C-o><C-r>

" FIND
" word
nnoremap f /
" all find and replace
nnoremap <C-f> :1,1s/-/-/<left><left><left><left><left><left><left><left>
inoremap <C-f> <C-o>:1,1s/-/-/<left><left><left><left><left><left><left><left>
