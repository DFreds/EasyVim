" This setting makes EasyMotion work similarly to Vim's smartcase option for global searches.
let g:EasyMotion_smartcase = 1

" m{char}{char} to move to {char}{char}
nmap <leader>em <Plug>(easymotion-overwin-f2)
" Move to word
map <leader><leader><leader> <Plug>(easymotion-bd-w)
nmap <leader><leader><leader> <Plug>(easymotion-overwin-w)
