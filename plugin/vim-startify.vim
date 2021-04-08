let g:startify_session_persistence = 1
let g:startify_session_number = 10
let g:startify_session_sort = 1
let g:startify_session_dir = '~/.vim_runtime/temp_dirs/sessions'
let g:startify_change_to_dir = 0
let g:startify_change_to_vcs_root = 1

let g:startify_lists = [
        \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
        \ { 'type': 'sessions',  'header': ['   Sessions']       },
        \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
        \ { 'type': 'commands',  'header': ['   Commands']       },
        \ ]
