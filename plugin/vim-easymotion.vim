" Generally, just use <leader><leader>some_motion to use, such as
" <leader><leader>j

" This setting makes EasyMotion work similarly to Vim's smartcase option for global searches.
let g:EasyMotion_smartcase = 1

" Move to word using all available windows - don't use noremap
map <leader><leader><leader> <Plug>(easymotion-bd-w)
nmap <leader><leader><leader> <Plug>(easymotion-overwin-w)
