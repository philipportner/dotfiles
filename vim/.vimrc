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

Plug 'sevko/vim-nand2tetris-syntax'
Plug 'honza/vim-snippets'
Plug 'bfrg/vim-cpp-modern'
Plug 'preservim/nerdtree'
Plug 'lifepillar/vim-solarized8'
Plug 'dense-analysis/ale'
Plug 'puremourning/vimspector'
Plug 'rhysd/git-messenger.vim'
Plug 'jreybert/vimagit'
Plug 'NLKNguyen/papercolor-theme'
Plug 'rbgrouleff/bclose.vim'
Plug 'francoiscabrol/ranger.vim'
Plug 'ericcurtin/CurtineIncSw.vim'
Plug 'troydm/zoomwintab.vim'
Plug 'vimwiki/vimwiki'
Plug 'terryma/vim-expand-region'
" Plug 'RRethy/vim-illuminate'
Plug 'airblade/vim-gitgutter'
Plug 'lervag/vimtex'
Plug 'morhetz/gruvbox'
Plug 'justinmk/vim-sneak'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'preservim/tagbar'
let g:polyglot_disabled = ['autoindent']
Plug 'sheerun/vim-polyglot'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'mkitt/tabline.vim'
Plug 'junegunn/gv.vim'
Plug 'itchyny/lightline.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"
call plug#end()

