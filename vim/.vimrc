call plug#begin(expand('~/.config/nvim/plugged'))
" GIT
Plug 'stsewd/fzf-checkout.vim'
Plug 'rhysd/git-messenger.vim'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'

Plug 'nvim-lua/plenary.nvim'
Plug 'TimUntersberger/neogit'
Plug 'kdheepak/lazygit.nvim'

" VISUAL
Plug 'troydm/zoomwintab.vim'
Plug 'airblade/vim-gitgutter'
Plug 'sheerun/vim-polyglot'
Plug 'yasukotelin/shirotelin'

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
" Plug 'vale1410/vim-minizinc'
Plug 'jiangmiao/auto-pairs'

call plug#end()
