call plug#begin(expand('~/.config/nvim/plugged'))
" GIT
Plug 'rhysd/git-messenger.vim'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'airblade/vim-gitgutter'
Plug 'sindrets/diffview.nvim'

" VISUAL
Plug 'troydm/zoomwintab.vim'
Plug 'sheerun/vim-polyglot'
Plug 'antiagainst/vim-tablegen'
Plug 'tie/llvm.vim'
" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'preservim/nerdtree'

" Colorschemes
Plug 'morhetz/gruvbox'
Plug 'miikanissi/modus-themes.nvim'
Plug 'lunacookies/vim-colors-xcode'

" EDITING
" Plug 'puremourning/vimspector'
" Plug 'dhananjaylatkar/cscope_maps.nvim'
Plug 'ludovicchabant/vim-gutentags'
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
call plug#end()
lua require('bqf').setup { preview = { winblend = 0, } }
" lua require("cscope_maps").setup({ disable_maps = false, skip_input_prompt = false,  prefix = "<C-c>"})
" lua require("cscope_maps").setup()
" lua require('distant'):setup()
" lua require('leap').add_default_mappings()
