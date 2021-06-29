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

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
" inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : <SID>check_back_space() ? "\<TAB>" : coc#refresh()

" Use tab to go to next suggestion. If a snippet has just been included, tab
" will jump between the arguments.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

" Use shift-tab for the previous suggestion
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nnoremap <silent> [g <Plug>(coc-diagnostic-prev)
nnoremap <silent> ]g <Plug>(coc-diagnostic-next)

" Symbol renaming.
nnoremap <leader>rn <Plug>(coc-rename)

" GoTo code navigation.
nnoremap <silent> gd <Plug>(coc-definition)
nnoremap <silent> gy <Plug>(coc-type-definition)
nnoremap <silent> gi <Plug>(coc-implementation)
nnoremap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Formatting selected code.
xnoremap <leader>ff  <Plug>(coc-format-selected)
nnoremap <leader>ff  <Plug>(coc-format-selected)

" Remap keys for applying codeAction to the current buffer.
" nnoremap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
" nnoremap <leader>qf  <Plug>(coc-fix-current)

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <leader>cd  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <leader>ce  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <leader>cc  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <leader>co  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <leader>cs  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <leader>cn  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <leader>cp  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <leader>cr  :<C-u>CocListResume<CR>
" Search using coc.
nnoremap <nowait> <leader>cg  :<C-u>CocSearch<space>

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
