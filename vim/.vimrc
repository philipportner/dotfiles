call plug#begin(expand('~/.config/nvim/plugged'))
" GIT
Plug 'rhysd/git-messenger.vim'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'airblade/vim-gitgutter'
" Plug 'rhysd/conflict-marker.vim'
" Plug 'nvim-lua/plenary.nvim'
" Plug 'TimUntersberger/neogit'
" >= 0.7.0
" Plug 'sindrets/diffview.nvim'

" VISUAL
Plug 'troydm/zoomwintab.vim'
Plug 'sheerun/vim-polyglot'
Plug 'antiagainst/vim-tablegen'
Plug 'tie/llvm.vim'
Plug 'vimoxide/vim-cinnabar'
Plug 'preservim/nerdtree'

" Colorschemes
Plug 'morhetz/gruvbox'
Plug 'lifepillar/vim-solarized8'
Plug 'Mofiqul/vscode.nvim'
Plug 'yasukotelin/shirotelin'
Plug 'NLKNguyen/papercolor-theme'

" EDITING
Plug 'puremourning/vimspector'
" Plug 'ludovicchabant/vim-gutentags'
" Plug 'skywind3000/gutentags_plus'
Plug 'ericcurtin/CurtineIncSw.vim'
Plug 'tpope/vim-surround'
Plug 'lervag/vimtex'
" Plug 'ggandor/leap.nvim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'preservim/tagbar'
Plug 'scrooloose/nerdcommenter'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vhdirk/vim-cmake'
Plug 'jiangmiao/auto-pairs'
Plug 'honza/vim-snippets'
Plug 'christoomey/vim-tmux-navigator'
Plug 'rhysd/vim-clang-format'
" https://github.com/searleser97/cpbooster
Plug 'nathom/filetype.nvim'
Plug 'dstein64/vim-startuptime'
Plug 'jikkujose/vim-visincr'
call plug#end()

" lua require('leap').add_default_mappings()
