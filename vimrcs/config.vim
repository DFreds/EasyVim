"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer:
"       Derek Fredrickson
"
" Sections:
"    -> General
"    -> Indenting
"    -> Searching
"    -> VIM user interface
"    -> Colors and Fonts
"    -> Visual mode related
"    -> Moving around, tabs and buffers
"    -> Autocmd
"    -> Plugin configuration
"    -> Keymaps
"    -> Helper functions
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=500

" Hide buffers instead of closing them
set hidden

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread
au FocusGained,BufEnter * checktime

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","

" :W sudo saves the file
" (useful for handling the permission-denied error)
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

" Turn persistent undo on, means that you can undo even when you close a buffer/VIM
try
    set undodir=~/.vim_runtime/temp_dirs/undodir
    set undofile
catch
endtry

" Turn backup off, since most stuff is in SVN, git etc. anyway...
set nobackup
set nowritebackup
set nowb
set noswapfile

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Indenting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set autoindent

" Use spaces instead of tabs
set expandtab

" 1 tab == 2 spaces
set tabstop=2
set shiftwidth=2
set smartindent

" Be smart when using tabs ;)
set smarttab


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Searching
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Highlight search results
set hlsearch

" Ignore case when searching
set ignorecase

" Makes search act like search in modern browsers
set incsearch

" When searching try to be smart about cases
set smartcase


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" We use lightline to show the modes
set noshowmode

" Prefer splitting to the right and below
set splitright
set splitbelow

" Turn on the Wild menu
set wildmenu
set wildmode=list:longest,full

" Ignore compiled files and git
set wildignore=*.class,*.git,*.o,*~,*.pyc

if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

"Always show current position
set ruler

" Height of the command bar
set cmdheight=2

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Add a bit extra margin to the left
set foldcolumn=1

" turn off folding
set foldmethod=manual
set nofoldenable

" Enable the sign column for use by gitgutter
set signcolumn=yes

" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable
syntax on

set termguicolors

try
    colorscheme monokai
catch
endtry

set background=dark

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Set font according to system
if has("mac") || has("macunix")
    set gfn=IBM\ Plex\ Mono:h14,Hack:h14,Source\ Code\ Pro:h15,Menlo:h15
elseif has("win16") || has("win32")
    set gfn=IBM\ Plex\ Mono:h14,Source\ Code\ Pro:h12,Bitstream\ Vera\ Sans\ Mono:h11
elseif has("gui_gtk2")
    set gfn=IBM\ Plex\ Mono\ 14,:Hack\ 14,Source\ Code\ Pro\ 12,Bitstream\ Vera\ Sans\ Mono\ 11
elseif has("linux")
    set gfn=IBM\ Plex\ Mono\ 14,:Hack\ 14,Source\ Code\ Pro\ 12,Bitstream\ Vera\ Sans\ Mono\ 11
elseif has("unix")
    set gfn=Monospace\ 11
endif

" Disable scrollbars
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L

" Display ruler at 80 characters
if exists('+colorcolumn')
  set colorcolumn=80
endif

" line numbers
set number

set ruler

" Linebreak on 500 characters
set lbr
set tw=500

set nowrap "Don't wrap lines


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
au TabLeave * let g:lasttab = tabpagenr()

" Specify the behavior when switching between buffers
try
  set switchbuf=useopen
  set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==> Autocmd 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Properly disable sound on errors on MacVim
if has("gui_macvim")
    autocmd GUIEnter * set vb t_vb=
endif

if has("autocmd")
  " Clean extra spaces before save
  autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()

  " Make sure that enter is never overriden in the quickfix window
  autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>

  " Highlight the symbol and its references when holding the cursor.
  autocmd CursorHold * silent call CocActionAsync('highlight')

  autocmd FileType css set omnifunc=csscomplete#CompleteCSS
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==> Plugin configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => match-up
let g:loaded_matchit = 1

" This setting makes EasyMotion work similarly to Vim's smartcase option for global searches.
let g:EasyMotion_smartcase = 1

" => vim-test - change to dispatch to run async in quickfix
let test#strategy = {
  \ 'nearest': 'neovim',
  \ 'file':    'neovim',
  \ 'suite':   'neovim',
\}

" ==> better whitespace
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1
let g:strip_whitespace_confirm=0
let g:better_whitespace_filetypes_blacklist=['diff', 'gitcommit', 'unite', 'qf', 'help', 'vim']

" ==> lightline
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ ['mode', 'paste'],
	    \             [ 'cocstatus', 'readonly', 'filename', 'modified' ],
      \             ['fugitive', 'readonly', 'relativefilepath', 'modified'] ],
      \   'right': [ [ 'lineinfo' ], ['percent'] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"🔒":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*FugitiveHead")?FugitiveHead():""}'
      \ },
      \ 'component_function': {
      \   'relativefilepath': 'LightlineFilename',
	    \   'cocstatus': 'coc#status'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*FugitiveHead") && ""!=FugitiveHead())'
      \ },
      \ 'separator': { 'left': ' ', 'right': ' ' },
      \ 'subseparator': { 'left': ' ', 'right': ' ' }
      \ }

" ==> ALE
let g:ale_fix_on_save = 1
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'

let g:ale_ruby_rubocop_executable = 'bundle'

let g:ale_linters = {'javascript': ['eslint', 'tsserver']}
let g:ale_fixers = {'javascript': ['prettier', 'eslint', 'remove_trailing_lines'],
                    \'ruby': ['rubocop', 'remove_trailing_lines'],
                    \'markdown': ['prettier', 'remove_trailing_lines']}


" ==> FZF
" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" ==> Ack searching and cope displaying
" Requires ack.vim - it's much better than vimgrep/grep

" Use the the_silver_searcher if possible (much faster than Ack)
if executable('ag')
  let g:ackprg = 'ag --vimgrep --smart-case'
endif

" ==> YankStack
let g:yankstack_yank_keys = ['y', 'd']

" ==> COC
let g:coc_global_extensions = [
      \ 'coc-css',
      \ 'coc-dictionary',
      \ 'coc-flutter',
      \ 'coc-git',
      \ 'coc-highlight',
      \ 'coc-html',
      \ 'coc-json',
      \ 'coc-snippets',
      \ 'coc-solargraph',
      \ 'coc-syntax',
      \ 'coc-tag',
      \ 'coc-tsserver',
      \ 'coc-vimlsp',
      \ 'coc-yaml',
      \ ]

" Use :CocConfig to test configs with auto-completion, then port them here
let g:coc_user_config = {
      \ 'solargraph.checkGemVersion': 0,
      \ 'solargraph.promptDownload': 0,
      \ 'solargraph.useBundler': 'true',
      \ 'snippets.extends': {
      \   'javascriptreact': ['javascript'],
      \   'gitcommit_markdown': ['gitcommit']
      \ }
      \ }

" coc-snippets
let g:coc_snippet_next = '<tab>'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Keymaps
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:floaterm_keymap_toggle = '<leader>ft'

nnoremap <silent> <F6> :call ToggleDarkLight()<CR>

nmap <leader>tn :TestNearest<CR>
nmap <leader>tf :TestFile<CR>
nmap <leader>ts :TestSuite<CR>
" nmap <silent> t<C-l> :TestLast<CR>
" nmap <silent> t<C-g> :TestVisit<CR>

" ==> vim-projectionist
nmap <silent> <leader>a :A<CR>
nmap <silent> <leader>va :AV<CR>

" ==> EasyMotion
" s{char}{char} to move to {char}{char}
nmap <leader>s <Plug>(easymotion-overwin-f2)
" Move to word
map <leader><leader><leader> <Plug>(easymotion-bd-w)
nmap <leader><leader><leader> <Plug>(easymotion-overwin-w)

" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>
" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

" Map auto complete of (, ", ', [
vnoremap $1 <esc>`>a)<esc>`<i(<esc>
vnoremap $2 <esc>`>a]<esc>`<i[<esc>
vnoremap $3 <esc>`>a}<esc>`<i{<esc>
vnoremap $$ <esc>`>a"<esc>`<i"<esc>
vnoremap $q <esc>`>a'<esc>`<i'<esc>
vnoremap $e <esc>`>a`<esc>`<i`<esc>
inoremap $1 ()<esc>i
inoremap $2 []<esc>i
inoremap $3 {}<esc>i
inoremap $4 {<esc>o}<esc>O
inoremap $q ''<esc>i
inoremap $e ""<esc>i

" Copy current file name (relative/absolute) to system clipboard
" relative path  (src/foo.txt)
nnoremap <leader>cf :let @*=expand("%")<CR>
" absolute path  (/something/src/foo.txt)
nnoremap <leader>cF :let @*=expand("%:p")<CR>
" filename       (foo.txt)
nnoremap <leader>ct :let @*=expand("%:t")<CR>
" directory name (/something/src)
nnoremap <leader>ch :let @*=expand("%:p:h")<CR>

" Remap VIM 0 to first non-blank character
map 0 ^

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Clear current search highlight by double tapping //
nmap <silent> // :nohlsearch<CR>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Close the current buffer
map <leader>bd :Bclose<cr>
" Close all the buffers
map <leader>ba :bufdo bd<cr>
map <leader>L :bnext<cr>
map <leader>H :bprevious<cr>

" Useful mappings for managing tabs - I don't use these, so commented out
" nmap <leader>TN :tabnew<cr>
" nmap <leader>TO :tabonly<cr>
" nmap <leader>TC :tabclose<cr>
" nmap <leader>TM :tabmove
" nmap <leader>T<leader> :tabnext
" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
" map <leader>TE :tabedit <C-r>=expand("%:p:h")<cr>/
" nmap <leader>TL :exe "tabn ".g:lasttab<CR>

" Remap indenting
nnoremap > >>_
nnoremap < <<_

" Visual mode pressing * or # searches for the current selection
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

" Re-select blocks after indenting
xnoremap < <gv
xnoremap > >gv|

" Use ; to enter command mode instead of :
nnoremap ; :
vnoremap ; :

" Disable Ex mode
nnoremap Q <nop>

" Fast saving
nmap <leader>w :w!<cr>

" Copying to OS clipboard
map <leader>y "*y
map <leader>Y "+y

" If you put this in your vimrc file, then it will call the :Tabularize command each time you insert a | character.
inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

" Map movement through errors with wrapping around the file.
nmap <silent> <leader>ap <Plug>(ale_previous_wrap)
nmap <silent> <leader>an <Plug>(ale_next_wrap)

" Quickly find and open a file in the current working directory
map <silent> <leader>j :GFiles<cr>
" Quickly jump to previously opened file
map <silent> <leader>o :Buffers<cr>
" Quickly jump between tags in the open buffer. Requires ctags
map <silent> <leader>t :BTags<cr>
" Quickly jump between lines in the open buffer
map <silent> <leader>l :BLines<cr>
" mnemonic 'File Grep'
nnoremap <leader>fg :Ag<space>
" mnemonic 'File History'
nnoremap <silent> <leader>fh :History<CR>
" mnemonic 'File Search'
nnoremap <silent> <leader>fs :Files<CR>
" mnemonic 'Search History'
nnoremap <silent> <leader>sh :History/<CR>
" mnemonic 'Command History'
nnoremap <silent> <leader>ch :History:<CR>

" Grep the word under cursor
nnoremap <silent> <leader>gw :silent execute "Ag " . expand("<cword>")<cr>


" ==> Fugitive
nnoremap <silent> <leader>gs :Git<CR>
nnoremap <silent> <leader>gd :Git diff<CR>
nnoremap <silent> <leader>gr :Git rebase -i<CR>
nnoremap <silent> <leader>gc :Git commit<CR>
nnoremap <silent> <leader>gb :Git blame<CR>
nnoremap <silent> <leader>gl :Git log<CR>
nnoremap <silent> <leader>gp :Git push<CR>

" When you press gv you Ack after the selected text
vnoremap <silent> gv :call VisualSelection('gv', '')<CR>

" Open Ack and put the cursor in the right position - "File Grep"
" map <leader>fg :Ack<space>

" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace', '')<CR>

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

" Open or close QuickFix
nnoremap <leader>q :call ToggleQuickFix()<cr>

nmap <C-p> <Plug>yankstack_substitute_older_paste
nmap <C-n> <Plug>yankstack_substitute_newer_paste

nmap <leader>z :Goyo<cr>

nnoremap <leader>ut :UndotreeToggle<CR>

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : <SID>check_back_space() ? "\<TAB>" : coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
" inoremap <silent><expr> <CR>
"       \ pumvisible() ? coc#_select_confirm() :
"       \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
"       \ <SID>check_back_space() ? "\<CR>" :
"       \ coc#refresh()

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif


" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

nnoremap <leader>un :call NewUuid()<CR>

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

" Don't close window, when deleting a buffer
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

function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction

" Thanks to this https://github.com/itchyny/lightline.vim/issues/293#issuecomment-373710096
function! LightlineFilename()
  let root = fnamemodify(get(b:, 'git_dir'), ':h')
  let path = expand('%:p')
  if path[:len(root)-1] ==# root
    return path[len(root)+1:]
  endif
  return expand('%')
endfunction

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

function! ToggleQuickFix()
    if empty(filter(getwininfo(), 'v:val.quickfix'))
        copen
    else
        cclose
    endif
endfunction

function! NewUuid()
  let l:prefix = '@uuid-'
  call CmdLine("r !uuidgen|sed \'s/.*/" . l:prefix . "&/\'|tr \"[A-Z]\" \"[a-z]\"")
endfunction

" Delete trailing white space on save, useful for some filetypes ;)
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun
