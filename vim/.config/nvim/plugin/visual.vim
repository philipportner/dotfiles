set termguicolors
lua require'nvim-treesitter.configs'.setup { highlight = { enable = true } }

let $BAT_THEME='Solarized (dark)'

syntax enable
set nowrap
set ruler
set number
" let &colorcolumn="80,120"
set list
set showmode

let g:coc_disable_transparent_cursor = 1
set gcr=n-v-c-sm:block,i-ci-ve:ver25-Cursor,r-cr-o:hor20

" let g:gruvbox_contrast_dark = 'hard'
" let g:gruvbox_invert_selection = 0
set background=dark
colorscheme solarized8_high
hi normal guibg=#282828
hi colorcolumn guibg=#2a2a2a
hi MatchParen guifg=red
hi EndOfBuffer guifg=bg
set number relativenumber
" set nonumber norelativenumber
set cursorline
highlight cursorlinenr guibg=none ctermbg=none
highlight cursorline guibg=none ctermbg=none cterm=none
highlight signcolumn guibg=none ctermbg=none
highlight linenr guibg=none ctermbg=none
highlight VertSplit guibg=none ctermbg=none
highlight link illuminatedWord Visual

highlight GitGutterAdd    guifg=#8ec07c guibg=none ctermfg=2
highlight GitGutterChange guifg=#83a598 guibg=none ctermfg=3
highlight GitGutterDelete guifg=#fb4934 guibg=none ctermfg=1


set fillchars=fold:\
set fillchars=vert:\|
set laststatus=2
