call plug#begin('~/.vim_runtime/plugged')

Plug 'mileszs/ack.vim'
Plug 'dense-analysis/ale'
  let g:ale_disable_lsp = 1
Plug 'jiangmiao/auto-pairs'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'shumphrey/fugitive-gitlab.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'rhysd/git-messenger.vim'
Plug 'junegunn/goyo.vim'
Plug 'yggdroot/indentline'
Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'
Plug 'godlygeek/tabular'
Plug 'tomtom/tlib_vim'
Plug 'mbbill/undotree'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'ntpeters/vim-better-whitespace'
Plug 'ap/vim-buftabline'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'junegunn/vim-easy-align', {'on': '<plug>(LiveEasyAlign)'}
Plug 'easymotion/vim-easymotion'
Plug 'terryma/vim-expand-region'
Plug 'voldikss/vim-floaterm'
  let g:floaterm_keymap_toggle = '<leader>ft'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'machakann/vim-highlightedyank'
Plug 'farmergreg/vim-lastplace'
Plug 'andymass/vim-matchup'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-repeat'
Plug 'machakann/vim-sandwich'
Plug 'psliwka/vim-smoothie'
  let g:smoothie_update_interval = 10
  let g:smoothie_speed_constant_factor = 30
  let g:smoothie_speed_linear_factor = 30
Plug 'mhinz/vim-startify'
Plug 'vim-test/vim-test'
Plug 'tpope/vim-vinegar'
Plug 'maxbrunsfeld/vim-yankstack'

" Color schemes
Plug 'NLKNguyen/papercolor-theme'
Plug 'crusoexia/vim-monokai'
Plug 'ghifarit53/sonokai'

" Language support
Plug 'groenewege/vim-less'
Plug 'heavenshell/vim-jsdoc', { 'for': ['javascript', 'javascript.jsx', 'typescript'], 'do': 'make install' }
Plug 'natebosch/vim-lsc'
Plug 'natebosch/vim-lsc-dart', { 'for': 'dart' }
Plug 'sheerun/vim-polyglot'

" Snippets
Plug 'SirVer/ultisnips'
  let g:UltiSnipsExpandTrigger="<C-W>m" " dummy to just disable <tab>
Plug 'honza/vim-snippets'

call plug#end()

"   call plug#begin('~/.vim/plugged')
"
"   " Make sure you use single quotes
"
"   " Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
"   Plug 'junegunn/vim-easy-align'
"
"   " Any valid git URL is allowed
"   Plug 'https://github.com/junegunn/vim-github-dashboard.git'
"
"   " Multiple Plug commands can be written in a single line using | separators
"   Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
"
"   " On-demand loading
"   Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
"   Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
"
"   " Using a non-default branch
"   Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
"
"   " Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
"   Plug 'fatih/vim-go', { 'tag': '*' }
"
"   " Plugin options
"   Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }
"
"   " Plugin outside ~/.vim/plugged with post-update hook
"   Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
"
"   " Unmanaged plugin (manually installed and updated)
"   Plug '~/my-prototype-plugin'
"
"   " Initialize plugin system
"   call plug#end()
"
" Then reload .vimrc and :PlugInstall to install plugins.
"
" Plug options:
"
"| Option                  | Description                                      |
"| ----------------------- | ------------------------------------------------ |
"| `branch`/`tag`/`commit` | Branch/tag/commit of the repository to use       |
"| `rtp`                   | Subdirectory that contains Vim plugin            |
"| `dir`                   | Custom directory for the plugin                  |
"| `as`                    | Use different name for the plugin                |
"| `do`                    | Post-update hook (string or funcref)             |
"| `on`                    | On-demand loading: Commands or `<Plug>`-mappings |
"| `for`                   | On-demand loading: File types                    |
"| `frozen`                | Do not update unless explicitly specified        |
"
" More information: https://github.com/junegunn/vim-plug
