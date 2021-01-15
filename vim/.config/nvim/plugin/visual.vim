"
" if has('termguicolors')
"   set termguicolors
" endif
" Enable true color 启用终端24位色
"
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

let g:terminal_ansi_colors = ["#282828", "#CC241D", "#98971A", "#D79921", "#458588", "#B16286", "#689D6A", "#A89984", "#928374", "#FB4934", "#B8BB26", "#198844", "#83A598", "#D3869B", "#8EC07C", "#EBDBB2"]

if has('nvim')
  for i in range(16)
    let g:terminal_color_{i} = g:terminal_ansi_colors[i]
  endfor
  unlet! g:terminal_ansi_colors
endif

let g:lightline = {
            \ 'colorscheme': 'default',
            \ 'active': {
            \   'left': [ [ 'mode', 'paste' ],
            \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
            \ },
            \ 'component_function': {
            \   'cocstatus': 'coc#status'
            \ },
            \ }

syntax enable
set nowrap
set ruler
set number
let &colorcolumn="80,120"
set list
set showmode

let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_invert_selection = 0
set background=dark
colorscheme gruvbox

" relative numbers
set number relativenumber
set cursorline
" highlight linenr term=bold cterm=none ctermfg=darkgrey ctermbg=none
highlight cursorlinenr guibg=none ctermbg=none
highlight cursorline guibg=none ctermbg=none cterm=none
highlight signcolumn guibg=none ctermbg=none
highlight linenr guibg=none ctermbg=none
highlight VertSplit guibg=none ctermbg=none
highlight link illuminatedWord Visual

" gdiff highlight
" highlight diffadd           cterm=bold ctermbg=none ctermfg=108
" highlight diffdelete        cterm=bold ctermbg=none ctermfg=167
" highlight diffchange        cterm=bold ctermbg=none ctermfg=172
highlight GitGutterAdd    guifg=#8ec07c ctermfg=2
highlight GitGutterChange guifg=#83a598 ctermfg=3
highlight GitGutterDelete guifg=#fb4934 ctermfg=1

"" disable the blinking cursor.
" set gcr=a:blinkon0
set gcr=n-v-c-sm:block,i-ci-ve:ver25-Cursor,r-cr-o:hor20

set fillchars=fold:\
set fillchars=vert:\|
" set fillchars=vert:┃
" status bar {{{
set laststatus=2
" set statusline=
" set statusline +=\ %#identifier\ #\ %n\                         " buffer number
" set statusline +=\ %#preproc\ #%{&ff}%*                         " file format
" set statusline +=\ %#string\ #%<%t%*                            " full path
" set statusline +=\ %#specialkey\ #%m%*                          " modified flag
" set statusline +=\ %#identifier\ #%=%5l%*                       " current line
" set statusline +=\ %#specialkey\ #/%l%*                         " total lines
" set statusline +=\ %#identifier\ #%4v\ %*                       " virtual column number
" set statusline +=\ %#specialkey\ #0x\ %02b\ %*                  " character under cursor
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
hi statusline guifg=white
" }}}

