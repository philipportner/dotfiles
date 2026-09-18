vim.g.mapleader = ' '

local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local fzf_dir = vim.fn.expand('~/.fzf')
local fzf_spec = { 'junegunn/fzf', name = 'fzf', build = './install --all' }
if vim.fn.isdirectory(fzf_dir) == 1 then
  fzf_spec = { dir = fzf_dir, name = 'fzf', build = './install --all' }
end

local plugins = {
  -- {
    -- "craftzdog/solarized-osaka.nvim",
    -- lazy = false,
    -- priority = 1000,
    -- opts = {},
    -- config = function()
      -- vim.cmd([[colorscheme solarized-osaka]])
    -- end,
  -- },
  'rhysd/git-messenger.vim',
  'tpope/vim-fugitive',
  'junegunn/gv.vim',
  'airblade/vim-gitgutter',
  'nvim-lua/plenary.nvim',
  'echasnovski/mini.icons',
  'nvim-tree/nvim-web-devicons',
  { 'sindrets/diffview.nvim', dependencies = { 'nvim-lua/plenary.nvim' } },
  {
    'NeogitOrg/neogit',
    dependencies = { 'nvim-lua/plenary.nvim', 'sindrets/diffview.nvim', 'nvim-tree/nvim-web-devicons' },
    config = true,
    keys = {
      { "<leader>gg", "<cmd>Neogit<cr>", desc = "Show Neogit UI" }
    },
  },
  -- {
  -- "esmuellert/codediff.nvim",
  -- cmd = "CodeDiff",
  -- },
  {
      "lionyxml/gitlineage.nvim",
      dependencies = {
          "sindrets/diffview.nvim", -- optional, for open_diff feature
      },
      config = function()
          require("gitlineage").setup()
      end
  },
  'troydm/zoomwintab.vim',
  'sheerun/vim-polyglot',
  'antiagainst/vim-tablegen',
  'tie/llvm.vim',
  'preservim/nerdtree',
  { 'miikanissi/modus-themes.nvim', lazy = false, priority = 1000 },
  'tpope/vim-surround',
  'lervag/vimtex',
  fzf_spec,
  { 'junegunn/fzf.vim', dependencies = { 'fzf' } },
  'scrooloose/nerdcommenter',
  { 'neoclide/coc.nvim', branch = 'release' },
  'rhysd/vim-clang-format',
  'vimwiki/vimwiki',
  {
  "folke/flash.nvim",
  event = "VeryLazy",
  ---@type Flash.Config
  opts = {},
  keys = {
    { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
  },
    },
  'jiangmiao/auto-pairs',
  {
    'stevearc/oil.nvim',
    config = function()
      require('oil').setup()
    end,
  },
  {
    'MagicDuck/grug-far.nvim',
    -- Note (lazy loading): grug-far.lua defers all it's requires so it's lazy by default
    -- additional lazy config to defer loading is not really needed...
    config = function()
      -- optional setup call to override plugin options
      -- alternatively you can set options with vim.g.grug_far = { ... }
      require('grug-far').setup({
        -- options, see Configuration section below
        -- there are no required options atm
      });
end
},
{
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    bigfile = { enabled = true },
    indent = { enabled = true },
    input = { enabled = true },
    quickfile = { enabled = true },
    scope = { enabled = true },
    scroll = {
      enabled = true,
      animate = {
        duration = { step = 10, total = 100 }, -- default is total = 200 (lower = faster)
        easing = "linear",
      },
      -- Controls scrolling speed when repeating motions (e.g., holding <C-d>)
      animate_repeat = {
        delay = 100,
        duration = { step = 5, total = 40 }, -- default is total = 50
        easing = "linear",
      },
    },
    words = { enabled = true },
  },
},
}

require('lazy').setup(plugins)
vim.cmd("packadd nvim.undotree")
vim.opt.mouse = 'a'
vim.opt.clipboard:append('unnamedplus')
vim.opt.tags = { './tags;' }
vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.smartindent = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.g.NERDSpaceDelims = 1

vim.g.git_messenger_floating_win_opts = { border = 'rounded' }
vim.g.git_messenger_popup_content_margins = false
vim.g.git_messenger_always_into_popup = true
vim.g.fzf_preview_window = { 'right:hidden', 'ctrl-/' }
vim.g.fzf_layout = { down = '30%' }
vim.env.FZF_PREVIEW_COMMAND = 'COLORTERM=truecolor bat --style=auto --color=always {}'
vim.env.FZF_DEFAULT_COMMAND = 'rg --files --no-ignore --hidden --follow --glob "!.git/**"'
vim.g.fzf_rg_options = { '--nth', '4..' }

vim.cmd([[
let g:fzf_action = {
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-x': 'belowright split',
      \ 'ctrl-v': 'belowright vsplit' }
]])

vim.g.fzf_history_dir = '~/.local/share/fzf-history'

vim.api.nvim_create_user_command('GGrep', function(opts)
  local cmd = 'git grep --line-number -- ' .. vim.fn.shellescape(opts.args)
  local root = vim.fn.systemlist('git rev-parse --show-toplevel')[1]
  local preview = vim.fn['fzf#vim#with_preview']({ dir = root })
  vim.fn['fzf#vim#grep'](cmd, 0, preview, opts.bang and 1 or 0)
end, { bang = true, nargs = '*' })

vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
  pattern = "*.txt",
  command = "set filetype=markdown"
})

vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  pattern = '*.jjdescription',
  callback = function()
    vim.opt_local.textwidth = 72
    vim.opt_local.formatoptions:append('t')
  end,
})

vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  pattern = '*.mlir',
  callback = function()
    vim.bo.filetype = 'mlir'
  end,
})


vim.opt.guicursor = 'n:blinkon1'

vim.cmd([[
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
]])

local function show_documentation()
  if vim.tbl_contains({ 'vim', 'help' }, vim.bo.filetype) then
    vim.cmd('h ' .. vim.fn.expand('<cword>'))
  else
    vim.fn.CocAction('doHover')
  end
end

vim.keymap.set('i', '<C-Space>', 'coc#refresh()', { expr = true, silent = true })
vim.keymap.set('n', '<Leader>n', ':ClangFormat<CR>', { remap = true })
vim.keymap.set('x', '<Leader>n', ':ClangFormat<CR>', { remap = true })
vim.keymap.set('x', '<leader>m', '<Plug>(coc-format-selected)', { remap = true })
vim.keymap.set('n', '<leader>m', '<Plug>(coc-format-selected)', { remap = true })
vim.keymap.set(
  'i',
  '<Tab>',
  'coc#pum#visible() ? coc#pum#next(1) : CheckBackspace() ? "\\<Tab>" : coc#refresh()',
  { expr = true }
)
vim.keymap.set(
  'i',
  '<S-Tab>',
  'coc#pum#visible() ? coc#pum#prev(1) : "\\<C-h>"',
  { expr = true }
)
vim.keymap.set(
  'i',
  '<CR>',
  'coc#pum#visible() ? coc#pum#confirm() : "\\<C-g>u\\<CR>\\<c-r>=coc#on_enter()\\<CR>"',
  { expr = true }
)
vim.keymap.set('i', '<C-l>', '<Plug>(coc-snippets-expand)', { remap = true })
vim.keymap.set('n', 'gd', '<Plug>(coc-definition)', { remap = true, silent = true })
vim.keymap.set('n', 'gy', '<Plug>(coc-type-definition)', { remap = true, silent = true })
vim.keymap.set('n', 'gi', '<Plug>(coc-implementation)', { remap = true, silent = true })
vim.keymap.set('n', 'gr', '<Plug>(coc-references)', { remap = true, silent = true })
vim.keymap.set('n', 'rn', '<Plug>(coc-rename)', { remap = true })
vim.keymap.set('n', 'ge', ':CocCommand explorer<CR>', { remap = true })
vim.keymap.set('n', 'gk', show_documentation, { silent = true })
vim.keymap.set('x', '<leader>a', '<Plug>(coc-codeaction-selected)', { remap = true })
vim.keymap.set('n', '<leader>a', '<Plug>(coc-codeaction-selected)', { remap = true })
vim.keymap.set('n', '<leader>qf', '<Plug>(coc-fix-current)', { remap = true })
vim.keymap.set('n', '<leader>cc', ':<C-u>CocList commands<cr>', { silent = true })
vim.keymap.set('n', '<leader>o', ':CocOutline<CR>')
vim.keymap.set('n', '<leader>s', ':<C-u>CocList -I symbols<cr>', { silent = true })
vim.keymap.set('n', '<leader>j', ':<C-u>CocNext<CR>', { silent = true })
vim.keymap.set('n', '<leader>k', ':<C-u>CocPrev<CR>', { silent = true })
vim.keymap.set('n', '<leader>p', ':<C-u>CocListResume<CR>', { silent = true })
vim.keymap.set("n", "<leader>cl", "<Plug>(coc-codelens-action)", { silent = true, remap = true })

vim.g.coc_outline_auto_preview = 1
vim.g.coc_global_extensions = {
  'coc-clangd',
  'coc-format-json',
  'coc-highlight',
  'coc-json',
  -- 'coc-pyright',
  'coc-snippets',
  'coc-texlab',
  'coc-vimlsp',
  'coc-git',
  'coc-rust-analyzer',
}

vim.keymap.set({ 'n', 'v', 'o', 's' }, '<Leader>gb', function()
  vim.o.background = (vim.o.background == 'dark') and 'light' or 'dark'
end, { remap = true })
vim.keymap.set('i', 'jj', '<esc>')
vim.keymap.set('i', 'jk', '<esc>')
vim.keymap.set('n', 'n', 'nzzzv')

vim.keymap.set('v', '<leader>y', '"+y')
vim.keymap.set('n', '<leader>Y', '"+yg_')
vim.keymap.set('n', '<leader>y', '"+y')
vim.keymap.set('n', '<leader>p', '"+p')
vim.keymap.set('n', '<leader>P', '"+P')
vim.keymap.set('v', '<leader>p', '"+p')
vim.keymap.set('v', '<leader>P', '"+P')

vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')


vim.keymap.set('n', '<leader>gr', ':diffget REMOTE<CR>', { remap = true })
vim.keymap.set('n', '<leader>gs', ':G<CR>', { remap = true })
vim.keymap.set('n', '<leader>gc', ':GCommit<CR>', { remap = true })
vim.keymap.set('n', '<leader>gv', '<Plug>(GitGutterPreviewHunk)', { remap = true })
vim.keymap.set('n', '<leader>gn', '<Plug>(GitGutterNextHunk)', { remap = true })
vim.keymap.set('n', '<leader>gp', '<Plug>(GitGutterPrevHunk)', { remap = true })
vim.keymap.set('n', '<leader>ga', '<Plug>(GitGutterStageHunk)', { remap = true })
vim.keymap.set('n', '<leader>gd', '<Plug>(GitGutterUndoHunk)', { remap = true })

vim.keymap.set({ 'n', 'v', 'o', 's' }, 'q:', ':q', { remap = true })
vim.keymap.set({ 'n', 'v', 'o', 's' }, ':W', ':w', { remap = true })
vim.keymap.set({ 'n', 'v', 'o', 's' }, ':E', ':e', { remap = true })
vim.keymap.set({ 'n', 'v', 'o', 's' }, ':Q', ':q', { remap = true })

vim.keymap.set('n', '<leader>cr', ':%s/\\<<C-r><C-w>\\>/')
vim.keymap.set('v', '<leader>cr', 'y:%s/<C-r>"/')

vim.keymap.set({ 'n', 'v', 'o', 's' }, '<left>', ':5winc ><CR>', { remap = true })
vim.keymap.set({ 'n', 'v', 'o', 's' }, '<right>', ':5winc <<CR>', { remap = true })
vim.keymap.set({ 'n', 'v', 'o', 's' }, '<down>', ':5winc +<CR>', { remap = true })
vim.keymap.set({ 'n', 'v', 'o', 's' }, '<up>', ':5winc -<CR>', { remap = true })

vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')

vim.keymap.set({ 'n', 'v', 'o', 's' }, '<C-j>', '<C-w>j')
vim.keymap.set({ 'n', 'v', 'o', 's' }, '<C-k>', '<C-w>k')
vim.keymap.set({ 'n', 'v', 'o', 's' }, '<C-l>', '<C-w>l')
vim.keymap.set({ 'n', 'v', 'o', 's' }, '<C-h>', '<C-w>h')

vim.keymap.set({ 'n', 'v', 'o', 's' }, '<Leader>h', ':<C-u>split<CR>')
vim.keymap.set({ 'n', 'v', 'o', 's' }, '<Leader>v', ':<C-u>vsplit<CR>')

vim.keymap.set('n', '<leader>b', ':Buffers<CR>', { silent = true })
vim.keymap.set('n', '<leader><space>', ':noh<cr>', { silent = true })
vim.keymap.set('n', '<leader>p', ':Files<CR>', { silent = true })
vim.keymap.set('n', '<leader>t', ':GFiles<CR>', { silent = true })
vim.keymap.set('n', '<leader>r', '<cmd>Rg<CR>', { silent = true })
vim.keymap.set('n', '<leader>R', '<cmd>RG<CR>', { silent = true })
vim.keymap.set('n', '<Leader>*', ':Rg <C-R><C-W><CR>', { silent = true })
vim.keymap.set('n', '<C-n>', ':NERDTreeToggle<CR>')

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

vim.opt.termguicolors = true
vim.env.BAT_THEME = 'modus'
vim.opt.wrap = false
vim.opt.ruler = true

vim.g.coc_disable_transparent_cursor = 1
vim.opt.guicursor = 'n-v-c-sm:block,i-ci-ve:ver25-Cursor,r-cr-o:hor20'

vim.opt.background = 'light'
vim.cmd('colorscheme modus')

vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  group = augroup,
  pattern = '*.daphne',
  callback = function()
    vim.bo.filetype = 'llvm'
  end,
})

vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  group = augroup,
  pattern = { '*.cu', '*.cuh' },
  callback = function()
    vim.bo.filetype = 'cuda'
  end,
})

vim.cmd('hi StatusLine guibg=#000087 guifg=#ffffff')
vim.cmd('hi NormalNC guibg=#ffffff')
vim.cmd('hi cursorlinenr guibg=none ctermbg=none')
vim.cmd('hi cursorline guibg=none ctermbg=none cterm=none')
vim.cmd('hi signcolumn guibg=none ctermbg=none')
vim.cmd('hi linenr guibg=none ctermbg=none')
vim.cmd('hi VertSplit gui=none guibg=none guifg=b74951 ctermbg=none')
vim.cmd('hi GitGutterAdd guifg=#8ec07c guibg=none')
vim.cmd('hi GitGutterChange guifg=#83a598 guibg=none')
vim.cmd('hi GitGutterDelete guifg=#fb4934 guibg=none')
vim.cmd('hi DiffviewStatusAdded guibg=none')
vim.cmd('hi DiffviewStatusDeleted guibg=none')

vim.opt.fillchars = { fold = '\\' }
vim.opt.fillchars = { vert = '|' }
vim.opt.laststatus = 2
