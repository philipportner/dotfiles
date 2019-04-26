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

Plug 'lervag/vimtex'
Plug 'morhetz/gruvbox'
Plug 'altercation/vim-colors-solarized'
Plug 'airblade/vim-gitgutter'
Plug 'justinmk/vim-sneak'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'majutsushi/tagbar'
Plug 'sheerun/vim-polyglot'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'mkitt/tabline.vim'
Plug 'davidhalter/jedi-vim'
Plug 'vim-scripts/OmniCppComplete'
Plug 'chriskempson/base16-vim'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'w0rp/ale'
Plug 'derekwyatt/vim-scala'
Plug 'janko-m/vim-test'
call plug#end()
" }}}

" Basic Setup {{{
"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set autoread

"" Fix backspace indent
set backspace=indent,eol,start

let g:ale_lint_on_text_changed = 'never'
let g:ale_completion_enabled = 1

" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

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

"
let g:jedi#popup_on_dot = 0

let g:python_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/usr/bin/python3'
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" LSP
" Required for operations modifying multiple buffers like rename.
set hidden

" tagbar
nmap <F4> :TagbarToggle<CR>

"" Tabs. May be overridden by autocmd rules
set tabstop=2
set smarttab
set smartindent
set autoindent
set softtabstop=2
set shiftwidth=2
set expandtab

" Auto indent pasted text
nnoremap p p=`]<C-o>
nnoremap P P=`]<C-o>

" Display tabs and trailing spaces visually
set list 
"set listchars=tab:\ \ ,trail:·
set listchars=tab:•\ ,trail:•

filetype plugin on
filetype indent on

"" Map leader to ,
let mapleader=','

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
syntax enable
set ruler
set number
" set cc=80
let &colorcolumn="80,".join(range(120,120),",")
set list
set showmode
set nowrap
let g:solarized_termtrans =   1
set background=dark
" if filereadable(expand("~/.vimrc_background"))
"   let base16colorspace=256
"   source ~/.vimrc_background
" endif
" highlight ColorColumn ctermbg=8
" colorscheme solarized
colorscheme gruvbox

" relative numbers
set number relativenumber
set cursorline
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE
highlight cursorlinenr ctermfg=red
highlight clear SignColumn

" hide bg from colorscheme in vsplit
highlight VertSplit ctermbg=NONE guibg=NONE

"" Disable the blinking cursor.
set gcr=a:blinkon0
set scrolloff=5

set fillchars=fold:\ 
" Status bar {{{
set laststatus=2
set statusline=
set statusline +=%#Identifier#\ %n\                         " buffer number
set statusline +=%#PreProc#%{&ff}%*                         " file format
set statusline +=%#String#\ %<%t%*                          " full path
set statusline +=%#SpecialKey#%m%*                          " modified flag
set statusline +=%#Identifier#%=%5l%*                       " current line
set statusline +=%#SpecialKey#/%L%*                         " total lines
set statusline +=%#Identifier#%4v\ %*                       " virtual column number
set statusline +=%#SpecialKey#0x%02B\ %*                    " character under cursor
" }}}

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv


" }}}

" Mappings {{{
inoremap jk <esc>

" exit TERMINAL MODE in terminal
tnoremap <Esc> <C-\><C-n>

" Allows you to easily replace the current word and all its occurrences.
nnoremap <Leader>cr :%s/\<<C-r><C-w>\>/
vnoremap <Leader>cr y:%s/<C-r>"/

"" custom move
"vertically by visual line
nnoremap j gj
nnoremap k gk

" Tree
nnoremap <silent> <F2> :NERDTreeFind<CR>
nnoremap <silent> <F3> :NERDTreeToggle<CR>

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
noremap <leader>q :bp<CR>
noremap <leader>w :bn<CR>
noremap <leader>c :bd<CR>

" session management
nnoremap <leader>so :OpenSession<Space>
nnoremap <leader>ss :SaveSession<Space>
nnoremap <leader>sd :DeleteSession<CR>
nnoremap <leader>sc :CloseSession<CR>

"" Tabs
nnoremap <Tab> :tabnext<CR>
nnoremap <S-Tab> :tabprev<CR>

"" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>

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

" vimtex live preview
" \ll to toggle the live compilation and \lv to view the generated document in your PDF viewer.
"  See :help VimtexCompile.

" }}}

" Autocmd rules {{{
"" The PC is fast enough, do syntax highlight syncing from start unless 200 lines
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

command! ProjectFiles execute 'Files' s:find_git_root()

" vim:foldmethod=marker:foldlevel=0
" }}}
