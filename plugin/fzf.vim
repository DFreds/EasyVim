" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" Display preview to the right, toggle with ctrl-/
let g:fzf_preview_window = ['right:50%', 'ctrl-/']

" mnemonic 'File Search'
noremap <silent> <leader>fs :GFiles<cr>
" mnemonic 'Buffer Search'
noremap <silent> <leader>bs :Buffers<cr>
" mnemonic 'Buffer Tags'
noremap <silent> <leader>bt :BTags<cr>
" mnemonic 'Buffer Lines'
noremap <silent> <leader>bl :BLines<cr>
" mnemonic 'File Grep'
nnoremap <leader>fg :Rg<CR>
" mnemonic 'File History'
nnoremap <silent> <leader>fh :History<CR>
" mnemonic 'All File Search'
nnoremap <silent> <leader>afs :Files<CR>
" mnemonic 'Buffer Commits'
nnoremap <silent> <leader>bc :BCommits<CR>
" mnemonic 'Search History'
nnoremap <silent> <leader>sh :History/<CR>
" mnemonic 'Command History'
nnoremap <silent> <leader>ch :History:<CR>
" Grep the word under cursor - mnemonic 'Grep Word'
nnoremap <silent> <leader>gw :silent execute "Rg " . expand("<cword>")<cr>
