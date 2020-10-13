" VIM-PLUG core {{{
if has('vim_starting')
  set nocompatible               " Be iMproved
endif

let vimplug_exists=expand('~/.config/nvim/autoload/plug.vim')

let g:vim_bootstrap_langs = "c,html,javascript,php,python"
let g:vim_bootstrap_editor = "nvim"				" nvim or vim

if !filereadable(vimplug_exists)
  if !executable("curl")
    echoerr "You have to install curl or first install vim-plug yourself!"
    execute "q!"
  endif
  echo "Installing Vim-Plug..."
  echo ""
  silent !\curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  let g:not_finish_vimplug = "yes"

  autocmd VimEnter * PlugInstall
endif

" Required:
call plug#begin(expand('~/.config/nvim/plugged'))

" }}}

" Plug install {{{

Plug 'rhysd/git-messenger.vim'
Plug 'jreybert/vimagit'
Plug 'wincent/ferret'
Plug 'vim-airline/vim-airline'
Plug 'rbgrouleff/bclose.vim'
Plug 'francoiscabrol/ranger.vim'
Plug 'ericcurtin/CurtineIncSw.vim'
Plug 'troydm/zoomwintab.vim'
Plug 'vimwiki/vimwiki'
Plug 'terryma/vim-expand-region'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'RRethy/vim-illuminate'
Plug 'airblade/vim-gitgutter'
Plug 'lervag/vimtex'
Plug 'gruvbox-community/gruvbox'
" Plug 'mhinz/vim-signify'
Plug 'justinmk/vim-sneak'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'majutsushi/tagbar'
Plug 'sheerun/vim-polyglot'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sleuth'
Plug 'mkitt/tabline.vim'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'janko-m/vim-test'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/gv.vim'
call plug#end()
" }}}

" Basic Setup {{{
"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set autoread
set inccommand=nosplit

" Enable mouse support
set mouse=a

set clipboard+=unnamedplus
" " Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
" " Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

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

" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

au BufRead,BufNewFile *.sbt set filetype=scala

" vim-tests
" these "Ctrl mappings" work well when Caps Lock is mapped to Ctrl
nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>

" Vim Sneak
let g:sneak#label = 1
let g:sneak#streak = 1

let g:python_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/usr/bin/python3'


nmap <F4> :TagbarToggle<CR>
map <F5> :call CurtineIncSw()<CR>
nmap <F2> :!./run.sh<CR>
nmap <F1> :make<CR>

"" Tabs. May be overridden by autocmd rules
set tabstop=2
set smarttab
set smartindent
set autoindent
set softtabstop=2
set shiftwidth=2
set expandtab


" Display tabs and trailing spaces visually
set list
set listchars=tab:\ \ ,trail:·
" set listchars=tab:•\ ,trail:•

filetype plugin on
filetype indent on

"" Map leader to ,
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

"" nerdcommenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Enable NERDCommenterToggle to check all selected lines is commented or not
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
" }}}

" Visual Settings {{{
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



syntax enable
set nowrap
set ruler
set number
let &colorcolumn="80,".join(range(120,120),",")
set list
set showmode

let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_invert_selection = 0
set background=dark
colorscheme gruvbox
"set signcolumn=auto:2

" relative numbers
set number relativenumber
set cursorline
highlight linenr term=bold cterm=none ctermfg=darkgrey ctermbg=none
highlight cursorlinenr ctermfg=yellow
highlight clear signcolumn
" gdiff highlight
" highlight diffadd           cterm=bold ctermbg=none ctermfg=108
" highlight diffdelete        cterm=bold ctermbg=none ctermfg=167
" highlight diffchange        cterm=bold ctermbg=none ctermfg=172
highlight GitGutterAdd    guifg=#8ec07c ctermfg=2
highlight GitGutterChange guifg=#83a598 ctermfg=3
highlight GitGutterDelete guifg=#fb4934 ctermfg=1

highlight signifysignadd    cterm=bold ctermbg=none ctermfg=108 guifg=#8ec07c
highlight signifysigndelete cterm=bold ctermbg=none ctermfg=167 guifg=#fb4934
highlight signifysignchange cterm=bold ctermbg=none ctermfg=172 guifg=#83a598

" hide bg from colorscheme in vsplit
highlight vertsplit ctermbg=none guibg=none

"" disable the blinking cursor.
set gcr=a:blinkon0

set fillchars=fold:\
set fillchars=vert:\|
" set fillchars=vert:┃
" status bar {{{
set laststatus=2
set statusline=
set statusline +=\ %#identifier\ #\ %n\                         " buffer number
set statusline +=\ %#preproc\ #%{&ff}%*                         " file format
set statusline +=\ %#string\ #%<%t%*                            " full path
set statusline +=\ %#specialkey\ #%m%*                          " modified flag
set statusline +=\ %#identifier\ #%=%5l%*                       " current line
set statusline +=\ %#specialkey\ #/%l%*                         " total lines
set statusline +=\ %#identifier\ #%4v\ %*                       " virtual column number
set statusline +=\ %#specialkey\ #0x\ %02b\ %*                  " character under cursor
" hi statusline ctermfg=white
" }}}

" search mappings: these will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap n nzzzv
" }}}

" CoC {{{
" Required for operations modifying multiple buffers like rename.
set hidden
set updatetime=100
set shortmess+=c
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
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
"
" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
"
" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

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
" }}}

" Mappings {{{
inoremap jj <esc>
inoremap jk <esc>
nnoremap <Leader>W :w<CR>
vnoremap <leader>p "_dP

" exit TERMINAL MODE in terminal
tnoremap <Esc> <C-\><C-n>


" zoomwin toggle
nnoremap <silent> <C-w>w :ZoomWinTabToggle<CR>

" Sweet Sweet FuGITive
nmap <leader>gh :diffget //3<CR>
nmap <leader>gu :diffget //2<CR>
nmap <leader>gs :G<CR>
nmap <leader>gc :GCommit<CR>
nmap <leader>gv :Gvdiff<CR>
nmap <leader>gn <Plug>(GitGutterNextHunk)
nmap <leader>gp <Plug>(GitGutterPrevHunk)
nmap <leader>ga <Plug>(GitGutterStageHunk)
nmap <leader>gd <Plug>(GitGutterUndoHunk)
let g:git_messenger_always_into_popup=v:true

map q: :q
map :W :w

" Allows you to easily replace the current word and all its occurrences.
nnoremap <Leader>cr :%s/\<<C-r><C-w>\>/
vnoremap <Leader>cr y:%s/<C-r>"/

" expand region
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" keymap for resizing split windows
map <left> :5winc ><CR>
map <right> :5winc <<CR>
map <down> :5winc +<CR>
map <up> :5winc -<CR>

"" custom move
"vertically by visual line
nnoremap j gj
nnoremap k gk

"" Switching windows
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

"" Split
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

"" Buffer nav
nnoremap <silent> <leader>b :Buffers<CR>
" noremap <leader>q :bp<CR>
noremap <leader>w :bn<CR>
noremap <leader>c :bd<CR>

"" Tabs
nnoremap <Tab> :tabnext<CR>
nnoremap <S-Tab> :tabprev<CR>

"" Clean search (highlight)
nnoremap <silent> <leader><space> :noh<cr>

"" Open current line on GitHub
nnoremap <Leader>o :.Gbrowse<CR>

" FZF
" This is the default extra key bindings
nnoremap <silent> <leader>t :FZF -m<CR>
nnoremap <silent> <leader><space>e :ProjectFiles <CR>
nnoremap <silent> <leader>r :Rg <CR>

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~40%' }

" In Neovim, you can set up fzf window using a Vim command
let g:fzf_layout = { 'window': 'enew' }
let g:fzf_layout = { 'window': '-tabnew' }
let g:fzf_layout = { 'window': '10split enew' }

" Customize fzf colors to match your color scheme
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

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'
" }}}

" Autocmd rules {{{


" json syntax highlighting
 autocmd FileType json syntax match Comment +\/\/.\+$+

 autocmd BufWritePre * :call TrimWhitespace()

 """ The PC is fast enough, do syntax highlight syncing from start unless 200 lines
augroup vimrc-sync-fromstart
  autocmd!
  autocmd BufEnter * :syntax sync maxlines=200
augroup END

"" Remember cursor position
augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END
" }}}

" Functions {{{

" ripgrep
" :Rg open preview with ?
" :Rg! opens rg with preview in buffer
" command! -bang -nargs=* Rg
"   \ call fzf#vim#grep(
"   \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
"   \   <bang>0 ? fzf#vim#with_preview('up:60%')
"   \           : fzf#vim#with_preview('right:50%:hidden', '?'),
"   \   <bang>0)

" Likewise, Files command with preview window
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

function! s:find_git_root()
  return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction

command! PF execute 'Files' s:find_git_root()

" vp doesn't replace paste buffer
function! RestoreRegister()
  let @" = s:restore_reg
  return ''
endfunction
function! s:Repl()
  let s:restore_reg = @"
  return "p@=RestoreRegister()\<cr>"
endfunction
vmap <silent> <expr> p <sid>Repl()

fun! TrimWhitespace()
  let l:save = winsaveview()
  keeppatterns %s/\s\+$//e
  call winrestview(l:save)
endfun

" vim:foldmethod=marker:foldlevel=0
" }}}
