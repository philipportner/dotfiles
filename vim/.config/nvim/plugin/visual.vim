set termguicolors
let $BAT_THEME='Solarized (dark)'
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

"lua << EOF
" require'nvim-treesitter.configs'.setup {
"     highlight = {
"         enable = false,
"         additional_vim_regex_highlighting = false,
"     },
" }
"EOF


let g:gruvbox_contrast_dark="normal"
set background=dark
colorscheme neosolarized
set number relativenumber
" hi normal guifg=#bbbbbb
" hi Function guifg=#9cdcfe


hi DiffAdd guibg=none
hi DiffDelete guibg=none
hi NeogitHunkHeaderHighlight guibg=none

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

lua << EOF
  require('neosolarized').setup({
    comment_italics = true,
    background_set = false,
  })
EOF
