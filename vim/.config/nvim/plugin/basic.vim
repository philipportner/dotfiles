"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set autoread
set inccommand=nosplit
" Enable mouse support
set mouse=a


"" ALE"
let g:ale_linters = {
\   'cpp': ['clangtidy'],
\   'c': ['clangtidy'],
\}
let g:ale_fixers={
\   'cpp': ['clang-format'],
\}

let g:ale_cpp_clangtidy_checks = []
let g:ale_cpp_clangtidy_executable = 'clang-tidy'
let g:ale_c_parse_compile_commands=1
let g:ale_cpp_clangtidy_extra_options = ''
let g:ale_cpp_clangtidy_options = ''
let g:ale_set_balloons=1
let g:ale_linters_explicit=1
let g:airline#extensions#ale#enabled=1

let g:vimspector_enable_mappings = 'HUMAN'

set clipboard+=unnamedplus

"" Fix backspace indent
set backspace=indent,eol,start

let g:ale_lint_on_text_changed = 'never'
let g:ale_completion_enabled = 1

let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
" let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'
" let g:polyglot_disabled = ['latex']

set tags=tags;/



" Vim Sneak
let g:sneak#label = 1
let g:sneak#streak = 1

let g:python_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/usr/bin/python3'


set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent


set list
set listchars=tab:\ \ ,trail:·

filetype plugin on
filetype indent on

"" Map leader to space
let mapleader=' '

"" Splits
set splitbelow
set splitright

"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

"" Directories for swp files
set nobackup
set nowritebackup
set noswapfile
set fileformats=unix,dos,mac

let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDAltDelims_java = 1
let g:NERDCustomDelimiters = { 'c': { 'left': '//'}, 'java': { 'left': '//' } }
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines = 1

"" python pep8 indents
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

if exists('$SHELL')
    set shell=$SHELL
else
    set shell=/bin/sh
endif


let g:git_messenger_always_into_popup=v:true
" let g:fzf_preview_window = 'up:50%'

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

let g:fzf_history_dir = '~/.local/share/fzf-history'
