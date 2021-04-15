call plug#begin(expand('~/.config/nvim/plugged'))
" GIT
Plug 'stsewd/fzf-checkout.vim'
Plug 'rhysd/git-messenger.vim'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
" Plug 'TimUntersberger/neogit'

" VISUAL
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'troydm/zoomwintab.vim'
Plug 'airblade/vim-gitgutter'
" let g:polyglot_disabled = ['autoindent']
Plug 'sheerun/vim-polyglot'
Plug 'lifepillar/vim-solarized8'

" EDITING
Plug 'ericcurtin/CurtineIncSw.vim'
Plug 'tpope/vim-surround'
Plug 'lervag/vimtex'
Plug 'justinmk/vim-sneak'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'preservim/tagbar'
Plug 'scrooloose/nerdcommenter'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vhdirk/vim-cmake'

call plug#end()
