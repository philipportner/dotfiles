call plug#begin(expand('~/.config/nvim/plugged'))
" GIT
Plug 'rhysd/git-messenger.vim'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'airblade/vim-gitgutter'
" Plug 'rhysd/conflict-marker.vim'
" Plug 'nvim-lua/plenary.nvim'
" Plug 'NeogitOrg/neogit'
" >= 0.7.0
Plug 'sindrets/diffview.nvim'

" VISUAL
Plug 'troydm/zoomwintab.vim'
Plug 'sheerun/vim-polyglot'
Plug 'antiagainst/vim-tablegen'
Plug 'tie/llvm.vim'
" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'preservim/nerdtree'
" Plug 'itchyny/lightline.vim'

" Colorschemes
Plug 'morhetz/gruvbox'
Plug 'Mofiqul/vscode.nvim'
Plug 'miikanissi/modus-themes.nvim'

" EDITING
" Plug 'puremourning/vimspector'
" Plug 'ludovicchabant/vim-gutentags'
Plug 'ericcurtin/CurtineIncSw.vim'
Plug 'tpope/vim-surround'
Plug 'lervag/vimtex'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'preservim/tagbar'
Plug 'scrooloose/nerdcommenter'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'vhdirk/vim-cmake'
Plug 'christoomey/vim-tmux-navigator'
Plug 'rhysd/vim-clang-format'
" https://github.com/searleser97/cpbooster
Plug 'dstein64/vim-startuptime'
Plug 'jikkujose/vim-visincr'
Plug 'vimwiki/vimwiki'
Plug 'justinmk/vim-sneak'
Plug 'kevinhwang91/nvim-bqf'
Plug 'jiangmiao/auto-pairs'
Plug 'Konfekt/FastFold'

call plug#end()

" lua require('leap').add_default_mappings()
