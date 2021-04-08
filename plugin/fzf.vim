" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" Quickly find and open a file in the current working directory
map <silent> <leader>j :GFiles<cr>
" Quickly jump to previously opened file
map <silent> <leader>o :Buffers<cr>
" Quickly jump between tags in the open buffer. Requires ctags
map <silent> <leader>t :BTags<cr>
" Quickly jump between lines in the open buffer
map <silent> <leader>l :BLines<cr>
" mnemonic 'File Grep'
nnoremap <leader>fg :Rg<CR>
" mnemonic 'File History'
nnoremap <silent> <leader>fh :History<CR>
" mnemonic 'File Search'
nnoremap <silent> <leader>fs :Files<CR>
" mnemonic 'File Commits'
nnoremap <silent> <leader>fc :BCommits<CR>
" mnemonic 'Search History'
nnoremap <silent> <leader>sh :History/<CR>
" mnemonic 'Command History'
nnoremap <silent> <leader>ch :History:<CR>
" Grep the word under cursor
nnoremap <silent> <leader>gw :silent execute "Rg " . expand("<cword>")<cr>
