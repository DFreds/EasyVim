"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer:
"       Derek Fredrickson
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:netrw_fastbrowse=0 " Fix issue with netrw keeping file paths open as buffers

set display=lastline  " Show as much as possible of the last line.

set noshowmode " We use lightline to show the modes

set lazyredraw             " Only redraw when necessary.

set synmaxcol=200  " Only highlight the first 200 columns.

set history=500  " Sets how many lines of history VIM has to remember

set foldcolumn=1 " Add a bit extra margin to the left for folds
set nofoldenable " turn off folding - manual folding is supportted

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
    colorscheme monokai
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
