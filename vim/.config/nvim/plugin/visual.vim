set termguicolors
let $BAT_THEME='gruvbox-dark'
syntax enable
set nowrap
set ruler
set number
set list
set showmode

let g:coc_disable_transparent_cursor = 1
set gcr=n-v-c-sm:block,i-ci-ve:ver25-Cursor,r-cr-o:hor20
let g:indentLine_char = '│'
let g:indentLine_concealcursor = ''
let g:vimwiki_listsyms = '✗○◐●✓'

" lua << EOF
" require'nvim-treesitter.configs'.setup {
"     highlight = {
"         enable = false,
"         additional_vim_regex_highlighting = false,
"     },
" }
" EOF
let g:gruvbox_contrast_dark="normal"
set background=dark
" let g:sonokai_diagnostic_text_highlight=1
" let g:sonokai_better_performance = 1
colorscheme gruvbox
au BufNewFile,BufRead *.daphne set filetype=llvm
" Syntax highlight for CUDA
au BufNewFile,BufRead *.cu set filetype=cuda
au BufNewFile,BufRead *.cuh set filetype=cuda
set number relativenumber
" hi Function guifg=#9cdcfe
" hi Function guifg=#76cce0
hi Function guifg=#83a598
" hi MatchParen guibg=#fc5d7c

" hi DiffAdd guibg=none
" hi DiffDelete guibg=none
" hi NeogitHunkHeaderHighlight guibg=none

hi cursorlinenr guibg=none ctermbg=none
hi cursorline guibg=none ctermbg=none cterm=none
hi signcolumn guibg=none ctermbg=none
hi linenr guibg=none ctermbg=none
hi VertSplit gui=none guibg=none guifg=b74951 ctermbg=none

hi GitGutterAdd    guifg=#8ec07c guibg=none ctermfg=2
hi GitGutterChange guifg=#83a598 guibg=none ctermfg=3
hi GitGutterDelete guifg=#fb4934 guibg=none ctermfg=1

set fillchars=fold:\
set fillchars=vert:\|
set laststatus=2
