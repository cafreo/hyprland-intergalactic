Plug '907th/vim-auto-save'

let g:auto_save = 1
let g:auto_save_events = ["InsertLeave", "TextChanged"]
let g:auto_save_silent = 1
let g:auto_save_postsave_hook = "echo '󰠘 autosave completed'"
let g:auto_save_write_all_buffers = 0

