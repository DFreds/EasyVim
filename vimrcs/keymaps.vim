" NOTE: Use fzf.vim :Maps command to search for any keymaps

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General Keymaps
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Copying to OS clipboard
map <leader>y "*y
map <leader>Y "+y

" Close the current buffer
map <leader>bd :Bclose<cr>
" Close all the buffers
map <leader>ba :bufdo bd<cr>

noremap > :bnext<cr>
noremap < :bprevious<cr>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

" Toggle spell checking on and off
map <leader>ss :setlocal spell!<cr>
" Navigate to next and previous spelling error
map <leader>sn ]s
map <leader>sp [s
" Add misspelled word under cursor to dictionary
map <leader>sa zg
" Get suggestions for spelling
map <leader>s? z=

" Remap VIM 0 to first non-blank character
map 0 ^

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Do :help cope if you are unsure what cope is. It's super useful!
"
" To go to the next search result do:
"   <leader>n
"
" To go to the previous search results do:
"   <leader>p
"
map <leader>n :cn<cr>
map <leader>p :cp<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Command Keymaps
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <C-K> <C-U>

cnoremap <C-P> <Up>
cnoremap <C-N> <Down>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Insert Mode Keymaps
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Normal Mode Keymaps
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fast saving
nmap <leader>w :update!<cr>

" Fast saving and quitting
nmap <leader>x :xit<cr>

" Clear current search highlight by double tapping //
nmap <silent> // :nohlsearch<CR>

" Use ; to enter command mode instead of :
nnoremap ; :

" Remap indenting
nnoremap <leader>i >>_
nnoremap <leader>I <<_

" Disable Ex mode
nnoremap Q <nop>

" Open or close QuickFix
nnoremap <leader>q :call ToggleQuickFix()<cr>

" Generate a UUID
nnoremap <leader>un :call NewUuid()<CR>

" Switch between light and dark mode
nnoremap <silent> <F6> :call ToggleDarkLight()<CR>

" Make n always search forward and N backward
nnoremap <expr> n  'Nn'[v:searchforward]
nnoremap <expr> N  'nN'[v:searchforward]

" Quick way to move the current line above or below:
" These mappings also take a count, so 2]e moves the current line 2 lines below.
nnoremap [e  :<c-u>execute 'move -1-'. v:count1<cr>
nnoremap ]e  :<c-u>execute 'move +'. v:count1<cr>

" Quickly add empty lines
" 5[<space> inserts 5 blank lines above the current line.
nnoremap [<space>  :<c-u>put! =repeat(nr2char(10), v:count1)<cr>'[
nnoremap ]<space>  :<c-u>put =repeat(nr2char(10), v:count1)<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Operator Keymaps
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Make n always search forward and N backward
onoremap <expr> n  'Nn'[v:searchforward]
onoremap <expr> N  'nN'[v:searchforward]

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Select/Visual Mode Keymaps
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use ; to enter command mode instead of :
vnoremap ; :

" Visual mode pressing * or # searches for the current selection
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

" When you press gv you Ack after the selected text
vnoremap <silent> gv :call VisualSelection('gv', '')<CR>

" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace', '')<CR>

" Re-select blocks after indenting
xnoremap <leader>i >gv|
xnoremap <leader>I <gv

" Make n always search forward and N backward
xnoremap <expr> N  'nN'[v:searchforward]
xnoremap <expr> n  'Nn'[v:searchforward]

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Terminal Keymaps
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
tmap <C-o> <C-\><C-n>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper Functions 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! CmdLine(str)
    call feedkeys(":" . a:str)
endfunction

function! NewUuid()
  let l:prefix = '@uuid-'
  call CmdLine("r !uuidgen|sed \'s/.*/" . l:prefix . "&/\'|tr \"[A-Z]\" \"[a-z]\"")
endfunction

" Initially set it to "dark" or "light" according to your default
let s:mybg = "dark"
function! ToggleDarkLight()
    if (s:mybg ==? "light")
       set background=dark
       colorscheme monokai
       let s:mybg = "dark"
    else
       set background=light
       colorscheme PaperColor
       let s:mybg = "light"
    endif
endfunction

function! ToggleQuickFix()
    if empty(filter(getwininfo(), 'v:val.quickfix'))
        copen
    else
        cclose
    endif
endfunction

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction
