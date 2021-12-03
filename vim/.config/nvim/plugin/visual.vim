set termguicolors
let $BAT_THEME='Solarized (dark)'
syntax enable
set nowrap
set ruler
set number
set list
set showmode

" lua <<EOF
" require'nvim-treesitter.configs'.setup {
"   highlight = {
"     enable = true
"   }
" }
" EOF

let g:coc_disable_transparent_cursor = 1
set gcr=n-v-c-sm:block,i-ci-ve:ver25-Cursor,r-cr-o:hor20
let g:indentLine_char = '│'
let g:indentLine_concealcursor = ''

set background=dark
let g:vscode_style = "dark"
colorscheme vscode
set number relativenumber
hi Visual gui=none
" set nonumber norelativenumber

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
