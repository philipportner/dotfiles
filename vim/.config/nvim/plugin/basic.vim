set updatetime=50
"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set autoread
set inccommand=nosplit
set foldmethod=syntax
set nofoldenable
" Enable mouse support
set mouse=a

let g:vimspector_enable_mappings = 'HUMAN'

set clipboard+=unnamedplus


"" Fix backspace indent
set backspace=indent,eol,start
au BufRead,BufNewFile *.mlir setfiletype mlir
autocmd QuickFixCmdPost *grep* cwindow
set tags=./tags;
let g:gutentags_ctags_exclude_wildignore = 1
let g:gutentags_ctags_exclude = [
  \'node_modules', '_build', 'build', 'CMakeFiles', '.mypy_cache', 'venv',
  \'*.md', '*.tex', '*.css', '*.html', '*.json', '*.xml', '*.xmls', '*.ui', '__pycache__', '.idea']

let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
" let g:vimtex_quickfix_mode=0
set conceallevel=3
let g:tex_conceal='abdmg'
let g:vimtex_compiler_method = 'latexmk'
let g:vimtex_compiler_latexmk = {
            \ 'options' : [
                \   '-g',
                \   '-pdf',
                \   '-shell-escape',
                \   '-verbose',
                \   '-file-line-error',
                \   '-synctex=1',
                \   '-interaction=nonstopmode',
                \ ],
                \}
let g:vimtex_syntax_packages = {'minted': {'load': 2}}
" let g:polyglot_disabled = ['latex']

" set tags=tags;/

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


let g:git_messenger_floating_win_opts = { 'border': 'rounded' }
let g:git_messenger_popup_content_margins = v:false
let g:git_messenger_always_into_popup=v:true
let g:fzf_preview_window = ['right:hidden', 'ctrl-/']
let g:fzf_layout = { 'down': '30%' }
let $FZF_PREVIEW_COMMAND="COLORTERM=truecolor bat --style=auto --color=always {}" 
let $FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/**"'

function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val, "lnum": 1 }'))
  copen
  cc
endfunction
let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

let g:fzf_history_dir = '~/.local/share/fzf-history'
command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number -- '.shellescape(<q-args>), 0,
  \   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)
au BufRead,BufNewFile *.nlogo set filetype=nlogo

" lua << EOF
" local neogit = require('neogit')
"
" neogit.setup {}
" EOF
" let g:vimwiki_list = [{'syntax': 'markdown', 'ext': '.md'}]
