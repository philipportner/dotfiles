call plug#begin(expand('~/.config/nvim/plugged'))
" GIT
Plug 'rhysd/git-messenger.vim'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'airblade/vim-gitgutter'

Plug 'nvim-lua/plenary.nvim'
Plug 'TimUntersberger/neogit'

" VISUAL
Plug 'troydm/zoomwintab.vim'
Plug 'sheerun/vim-polyglot'
Plug 'Mofiqul/vscode.nvim'
" Plug 'morhetz/gruvbox'

" EDITING
Plug 'ludovicchabant/vim-gutentags'
Plug 'ericcurtin/CurtineIncSw.vim'
Plug 'tpope/vim-surround'
Plug 'lervag/vimtex'
Plug 'ggandor/lightspeed.nvim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'preservim/tagbar'
Plug 'scrooloose/nerdcommenter'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vhdirk/vim-cmake'
Plug 'jiangmiao/auto-pairs'
Plug 'honza/vim-snippets'
" https://github.com/searleser97/cpbooster

call plug#end()
