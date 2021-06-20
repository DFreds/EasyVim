" NOTE: Use fzf.vim :Maps command to search for any keymaps

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General Keymaps
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Clear current search highlight by double tapping //
nnoremap <silent> // :nohlsearch<cr>

" Use ; to enter command mode instead of :
nnoremap ; :
vnoremap ; :

" Disable Ex mode
nnoremap Q <nop>

" Quick way to move the current line above or below:
" These mappings also take a count, so 2]e moves the current line 2 lines below.
nnoremap [e  :<c-u>execute 'move -1-'. v:count1<cr>
nnoremap ]e  :<c-u>execute 'move +'. v:count1<cr>

" Quickly add empty lines
" 5[<space> inserts 5 blank lines above the current line.
nnoremap [<space>  :<c-u>put! =repeat(nr2char(10), v:count1)<cr>'[
nnoremap ]<space>  :<c-u>put =repeat(nr2char(10), v:count1)<cr>

" Toggle jumping between the beginning of the line and the first character
nnoremap <silent> 0 :call HomeToggle()<cr>

" Open or close QuickFix
nnoremap <leader>q :call ToggleQuickFix()<cr>

" Generate a UUID
nnoremap <leader>un :call NewUuid()<cr>

" Switch between light and dark mode
nnoremap <silent> <F6> :call ToggleDarkLight()<cr>

" Toggle paste mode on and off
noremap <leader>pp :setlocal paste!<cr>

" Visual mode pressing * or # searches for the current selection
vnoremap <silent> * :<C-u>call VisualSelection('', '')<cr>/<C-R>=@/<cr><cr>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<cr>?<C-R>=@/<cr><cr>

" When you press gv you Ack after the selected text
vnoremap <silent> gv :call VisualSelection('gv', '')<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing Keymaps
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fast saving
nnoremap <leader>w :update!<cr>

" Fast saving and quitting
nnoremap <leader>x :xit<cr>

" Remap indenting
nnoremap <leader>i >>_
nnoremap <leader>I <<_
" Re-select blocks after indenting in visual mode
xnoremap <leader>i >gv|
xnoremap <leader>I <gv

" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace', '')<cr>

" Copying to OS clipboard
if has('unnamedplus')
  noremap <leader>y "+y
  noremap <leader>p "+p
else
  noremap <leader>y "*y
  noremap <leader>p "*p
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Movement Keymaps
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Smart way to move between windows
noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-h> <C-W>h
noremap <C-l> <C-W>l

" Make n always search forward and N backward
nnoremap <expr> n 'Nn'[v:searchforward]
nnoremap <expr> N 'nN'[v:searchforward]
onoremap <expr> n 'Nn'[v:searchforward]
onoremap <expr> N 'nN'[v:searchforward]
xnoremap <expr> N 'nN'[v:searchforward]
xnoremap <expr> n 'Nn'[v:searchforward]

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Buffer Keymaps
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Close the current buffer
noremap <leader>bd :Bclose<cr>

" Close all the buffers
noremap <leader>ba :bufdo bd<cr>

" Close all but the current buffer
noremap <leader>bo :BufOnly<cr>

" Go to last buffer
noremap <silent> <leader>bl :b#<cr>

" Easy way to navigate between buffers. Pairs well with vim-buftabline
noremap > :bnext<cr>
noremap < :bprevious<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spelling Keymaps
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Toggle spell checking on and off
noremap <leader>ss :setlocal spell!<cr>
" Add misspelled word under cursor to dictionary
noremap <leader>sa zg
" Get suggestions for spelling
noremap <leader>s? z=

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Command Keymaps
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <C-K> <C-U>

cnoremap <C-P> <Up>
cnoremap <C-N> <Down>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Terminal Keymaps
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
tnoremap <c-o> <c-\><c-n><esc><cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper Functions 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Don't close window when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt() 
function! <SID>BufcloseCloseIt()
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr("#")

    if buflisted(l:alternateBufNum)
        buffer #
    else
        bnext
    endif

    if bufnr("%") == l:currentBufNum
        new
    endif

    if buflisted(l:currentBufNum)
        execute("bdelete! ".l:currentBufNum)
    endif
endfunction

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

       " let g:lightline.colorscheme = 'sonokai'
       call lightline#init()
       call lightline#colorscheme()
    else
       set background=light
       colorscheme PaperColor
       let s:mybg = "light"

       " let g:lightline.colorscheme = 'PaperColor'
       call lightline#init()
       call lightline#colorscheme()
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

function HomeToggle()
    if (col('.') == 1)
        normal! ^
    else
        normal! 0
    endif
endfunction
