set termguicolors
let $BAT_THEME='Solarized (dark)'
" let g:lightline = {
"       \ 'colorscheme': 'default',
"       \ }
syntax enable
set nowrap
set ruler
set number
set list
set showmode

let g:coc_disable_transparent_cursor = 1
set gcr=n-v-c-sm:block,i-ci-ve:ver25-Cursor,r-cr-o:hor20

set background=light
colorscheme plain
set number relativenumber
" set nocursorline
" 005787
" hi MatchParen guifg=red ctermbg=red
" hi cursorlinenr guibg=none ctermbg=none
" hi cursorline guibg=none ctermbg=none cterm=none
" hi signcolumn guibg=none ctermbg=none
" hi linenr guibg=none ctermbg=none
" hi VertSplit guibg=none ctermbg=none
" hi link illuminatedWord Visual

" hi GitGutterAdd    guifg=#8ec07c guibg=none ctermfg=2
" hi GitGutterChange guifg=#83a598 guibg=none ctermfg=3
" hi GitGutterDelete guifg=#fb4934 guibg=none ctermfg=1
hi GitGutterAdd    guifg=#77dd77 guibg=none ctermfg=2
hi GitGutterChange guifg=#005878 guibg=none ctermfg=3
hi GitGutterDelete guifg=#ff6961 guibg=none ctermfg=1

set fillchars=fold:\
set fillchars=vert:\|
set laststatus=2