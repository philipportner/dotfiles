" Required for operations modifying multiple buffers like rename.
set hidden
set updatetime=100
set shortmess+=c
" fix cursor becomming a | after viewing CoCList
set guicursor=n:blinkon1

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

xmap <leader>n  <Plug>(coc-format-selected)
nmap <leader>n  <Plug>(coc-format-selected)
"
" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
imap <C-l> <Plug>(coc-snippets-expand)
" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> rn <Plug>(coc-rename)
" nmap <silent> <leader>rd :call CocAction('diagnosticToggle')<CR>

nmap ge :CocCommand explorer<CR>
" Use gk to show documentation in preview window
nnoremap <silent> gk :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

let g:coc_global_extensions = [
            \ 'coc-clangd',
            \ 'coc-format-json',
            \ 'coc-highlight',
            \ 'coc-json',
            \ 'coc-pyright',
            \ 'coc-snippets',
            \ 'coc-texlab',
            \ 'coc-vimlsp',
            \ 'coc-lists',
            \ 'coc-git',
            \ 'coc-clangd',
            \ 'coc-rust-analyzer',
            \ 'coc-java',
            \ 'coc-java-debug',
            \ ]
