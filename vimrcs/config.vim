"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer:
"       Derek Fredrickson
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let mapleader = ',' " Use , as the leader
let g:netrw_fastbrowse=0 " Fix issue with netrw keeping file paths open as buffers

filetype plugin indent on  " Load plugins according to detected filetype.
syntax on                  " Enable syntax highlighting.
syntax enable                  " Enable syntax highlighting.

set autoindent             " Indent according to previous line.
set expandtab              " Use spaces instead of tabs.
set softtabstop=2         " Tab key indents by 4 spaces.
set shiftwidth=2         " >> indents by 4 spaces.
set smartindent " Be smart about indenting

set guioptions-=L " Disable left-hand scrollbar when there is a vertical window
set guioptions-=R " Disable right-hand scrollbar when there is a vertical window
set guioptions-=T " Disable toolbar for Win32 GUI
set guioptions-=e " Disable tab pages
set guioptions-=l " Disable left-hand scrollbar
set guioptions-=r " Disable right-hand scrollbar

set number " Include line numbers

set so=7 " Set 7 lines to the cursor - when moving vertically using j/k

set backspace=indent,eol,start  " Make backspace work as you would expect.
set hidden                 " Switch between buffers without having to save first.
set display=lastline  " Show as much as possible of the last line.

set noshowmode " We use lightline to show the modes
set showcmd                " Show already typed keys when more are expected.

set incsearch              " Highlight while searching with / or ?.
set hlsearch               " Keep matches highlighted.
set ignorecase " Ignore case when searching
set smartcase " Only ignore case if all letters are lowercase

set shortmess+=c " Don't pass messages to |ins-completion-menu|.

set lazyredraw             " Only redraw when necessary.

set splitbelow             " Open new windows below the current window.
set splitright             " Open new windows right of the current window.

set cursorline             " Find the current line quickly.
set wrapscan               " Searches wrap around end-of-file.
set report=0    " Always report changed lines.
set synmaxcol=200  " Only highlight the first 200 columns.
set nowrap " Don't wrap lines

set updatetime=300 " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable delays and poor user experience.

set encoding=utf8 " Set utf8 as standard encoding
set fileformats=unix,dos,mac " Use Unix as the standard file type

set history=500  " Sets how many lines of history VIM has to remember

set switchbuf=useopen " Use open buffer when switching between files if it is already open

set timeoutlen=500 " Timeout in ms to wait for a command sequence to complete

set list                   " Show non-printable characters.

set cmdheight=2 " Make command-line bar slightly larger
set foldcolumn=1 " Add a bit extra margin to the left for folds
set nofoldenable " turn off folding - manual folding is supportted

set signcolumn=yes " Always enable the sign column

set undofile " Turn persistent undo on
set undodir=~/.vim_runtime/temp_dirs/undodir " Save undo data here

set nowritebackup " Don't backup a file before writing it. Everything is usually in a VCS anyway
set noswapfile " Don't create annoying .swp files

set termguicolors " Enable 24-bit RGB color in the TUI
set background=dark " Dark mode is the only mode :P
set colorcolumn=80 " Display ruler at 80 characters

set whichwrap+=h,l " Allow specified keys to go to previous/next line when at first/last character"

set wildmenu " Use command line completion menu on Tab
set wildmode=list:longest,full " When more than one match, list all matches and complete till longest common string.
set wildignore=*.class,*.git,*.o,*~,*.pyc " Ignore compiled files and git

if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

if has('multi_byte') && &encoding ==# 'utf-8'
  let &listchars = 'tab:▸ ,extends:❯,precedes:❮,nbsp:±'
else
  let &listchars = 'tab:> ,extends:>,precedes:<,nbsp:.'
endif

" Choose default colorscheme
try
    colorscheme PaperColor
catch
endtry

" Set font according to system
if has("mac") || has("macunix")
    set guifont=IBM\ Plex\ Mono:h14,Hack:h14,Source\ Code\ Pro:h15,Menlo:h15
elseif has("win16") || has("win32")
    set guifont=IBM\ Plex\ Mono:h14,Source\ Code\ Pro:h12,Bitstream\ Vera\ Sans\ Mono:h11
elseif has("gui_gtk2")
    set guifont=IBM\ Plex\ Mono\ 14,:Hack\ 14,Source\ Code\ Pro\ 12,Bitstream\ Vera\ Sans\ Mono\ 11
elseif has("linux")
    set guifont=IBM\ Plex\ Mono\ 14,:Hack\ 14,Source\ Code\ Pro\ 12,Bitstream\ Vera\ Sans\ Mono\ 11
elseif has("unix")
    set guifont=Monospace\ 11
endif

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
