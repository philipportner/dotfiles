call plug#begin(expand('~/.config/nvim/plugged'))


Plug 'stsewd/fzf-checkout.vim'
Plug 'honza/vim-snippets'
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
" Plug 'TimUntersberger/neogit'
Plug 'mkitt/tabline.vim'
Plug 'junegunn/gv.vim'
Plug 'itchyny/lightline.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jackguo380/vim-lsp-cxx-highlight'

call plug#end()
