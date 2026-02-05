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
    config = function()
      require('neogit').setup({})
    end,
  },
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
  'ericcurtin/CurtineIncSw.vim',
  'tpope/vim-surround',
  'lervag/vimtex',
  fzf_spec,
  { 'junegunn/fzf.vim', dependencies = { 'fzf' } },
  'preservim/tagbar',
  'scrooloose/nerdcommenter',
  { 'neoclide/coc.nvim', branch = 'release' },
  'christoomey/vim-tmux-navigator',
  'rhysd/vim-clang-format',
  'dstein64/vim-startuptime',
  'jikkujose/vim-visincr',
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
  'Konfekt/FastFold',
  {
    'stevearc/oil.nvim',
    config = function()
      require('oil').setup()
    end,
  },
}

require('lazy').setup(plugins)

vim.opt.updatetime = 50
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'
vim.opt.fileencodings = 'utf-8'
vim.opt.autoread = true
vim.opt.inccommand = 'nosplit'
vim.opt.foldmethod = 'syntax'
vim.opt.foldenable = false
vim.opt.mouse = 'a'
vim.opt.makeprg = 'cmake --build /home/philipportner/llvm_upgrade/build --target'
vim.opt.backspace = { 'indent', 'eol', 'start' }
vim.opt.clipboard:append('unnamedplus')
vim.opt.tags = { './tags;' }

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true

vim.opt.list = true
vim.opt.listchars = { tab = '  ', trail = '·' }

vim.cmd('filetype plugin on')
vim.cmd('filetype indent on')

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.fileformats = { 'unix', 'dos', 'mac' }

vim.g.vimspector_enable_mappings = 'HUMAN'

vim.g.gutentags_ctags_exclude_wildignore = 1
vim.g.gutentags_ctags_exclude = {
  'node_modules',
  '_build',
  'build',
  'CMakeFiles',
  '.mypy_cache',
  'venv',
  '*.md',
  '*.tex',
  '*.css',
  '*.html',
  '*.json',
  '*.xml',
  '*.xmls',
  '*.ui',
  '__pycache__',
  '.idea',
}

vim.g.tex_flavor = 'latex'
vim.g.vimtex_view_method = 'zathura'
vim.opt.conceallevel = 3
vim.g.tex_conceal = 'abdmg'
vim.g.vimtex_compiler_method = 'latexmk'
vim.g.vimtex_compiler_latexmk = {
  options = {
    '-g',
    '-pdf',
    '-shell-escape',
    '-verbose',
    '-file-line-error',
    '-synctex=1',
    '-interaction=nonstopmode',
  },
}
vim.g.vimtex_syntax_packages = { minted = { load = 2 } }

vim.g.python_host_prog = '/usr/bin/python'
vim.g.python3_host_prog = '/usr/bin/python3'

vim.g.NERDSpaceDelims = 1
vim.g.NERDCompactSexyComs = 1
vim.g.NERDDefaultAlign = 'left'
vim.g.NERDAltDelims_java = 1
vim.g.NERDCustomDelimiters = { c = { left = '//' }, java = { left = '//' } }
vim.g.NERDCommentEmptyLines = 1
vim.g.NERDTrimTrailingWhitespace = 1
vim.g.NERDToggleCheckAllLines = 1

local shell = vim.env.SHELL
if shell and shell ~= '' then
  vim.opt.shell = shell
else
  vim.opt.shell = '/bin/sh'
end

vim.g.git_messenger_floating_win_opts = { border = 'rounded' }
vim.g.git_messenger_popup_content_margins = false
vim.g.git_messenger_always_into_popup = true
vim.g.fzf_preview_window = { 'right:hidden', 'ctrl-/' }
vim.g.fzf_layout = { down = '30%' }
vim.env.FZF_PREVIEW_COMMAND = 'COLORTERM=truecolor bat --style=auto --color=always {}'
vim.env.FZF_DEFAULT_COMMAND = 'rg --files --no-ignore --hidden --follow --glob "!.git/**"'

vim.cmd([[
function! FzfBuildQuickfixList(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val, "lnum": 1 }'))
  copen
  cc
endfunction
let g:fzf_action = {
      \ 'ctrl-q': function('FzfBuildQuickfixList'),
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-x': 'split',
      \ 'ctrl-v': 'vsplit' }
]])

vim.g.fzf_history_dir = '~/.local/share/fzf-history'

vim.api.nvim_create_user_command('CBuild', function(opts)
  local target = opts.args ~= '' and opts.args or 'daphne'
  vim.cmd('make ' .. target)
end, { nargs = '?' })

vim.cmd([[cabbrev <expr> make (getcmdtype() == ':' && getcmdline() =~? '^make\s*$' ? 'CBuild' : 'make')]])

vim.api.nvim_create_user_command('GGrep', function(opts)
  local cmd = 'git grep --line-number -- ' .. vim.fn.shellescape(opts.args)
  local root = vim.fn.systemlist('git rev-parse --show-toplevel')[1]
  local preview = vim.fn['fzf#vim#with_preview']({ dir = root })
  vim.fn['fzf#vim#grep'](cmd, 0, preview, opts.bang and 1 or 0)
end, { bang = true, nargs = '*' })

local augroup = vim.api.nvim_create_augroup('init_lua_settings', { clear = true })

vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
  pattern = "*.txt",
  command = "set filetype=markdown"
})

vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  group = augroup,
  pattern = '*.jjdescription',
  callback = function()
    vim.opt_local.textwidth = 72
    vim.opt_local.formatoptions:append('t')
  end,
})

vim.api.nvim_create_autocmd('BufReadPost', {
  group = augroup,
  pattern = { '*.daph', '*.daphne' },
  callback = function()
    vim.bo.syntax = 'python'
  end,
})

vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  group = augroup,
  pattern = '*.mlir',
  callback = function()
    vim.bo.filetype = 'mlir'
  end,
})

vim.api.nvim_create_autocmd('QuickFixCmdPost', {
  group = augroup,
  pattern = '*grep*',
  command = 'cwindow',
})

vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  group = augroup,
  pattern = '*.py',
  callback = function()
    vim.bo.tabstop = 4
    vim.bo.softtabstop = 4
    vim.bo.shiftwidth = 4
    vim.bo.textwidth = 79
    vim.bo.expandtab = true
    vim.bo.autoindent = true
    vim.bo.fileformat = 'unix'
  end,
})

vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  group = augroup,
  pattern = '*.nlogo',
  callback = function()
    vim.bo.filetype = 'nlogo'
  end,
})

vim.opt.hidden = true
vim.opt.updatetime = 100
vim.opt.shortmess:append('c')
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
vim.keymap.set('n', '<space>e', ':<C-u>CocList extensions<cr>', { silent = true })
vim.keymap.set('n', '<space>c', ':<C-u>CocList commands<cr>', { silent = true })
vim.keymap.set('n', '<leader>o', ':CocOutline<CR>')
vim.keymap.set('n', '<space>s', ':<C-u>CocList -I symbols<cr>', { silent = true })
vim.keymap.set('n', '<space>j', ':<C-u>CocNext<CR>', { silent = true })
vim.keymap.set('n', '<space>k', ':<C-u>CocPrev<CR>', { silent = true })
vim.keymap.set('n', '<space>p', ':<C-u>CocListResume<CR>', { silent = true })

vim.g.coc_outline_auto_preview = 1
vim.g.coc_global_extensions = {
  'coc-clangd',
  'coc-format-json',
  'coc-highlight',
  'coc-json',
  'coc-pyright',
  'coc-snippets',
  'coc-texlab',
  'coc-vimlsp',
  'coc-git',
  'coc-rust-analyzer',
  'coc-java',
  'coc-java-debug',
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

vim.keymap.set({ 'n', 'v', 'o', 's' }, '<F1>', ':call CurtineIncSw()<CR>', { remap = true })
vim.keymap.set('n', '<F2>', ':TagbarToggle<CR>', { remap = true })

vim.keymap.set('n', '<leader>dd', ':call vimspector#Launch()<cr>')
vim.keymap.set('n', '<leader>dx', ':VimspectorReset<CR>', { remap = true })
vim.keymap.set('n', '<leader>dc', ':call vimspector#Continue()<cr>')
vim.keymap.set('n', '<leader>ds', ':call vimspector#Stop()<cr>')
vim.keymap.set('n', '<leader>dR', ':call vimspector#Restart()<cr>')
vim.keymap.set('n', '<leader>dp', ':call vimspector#Pause()<cr>')
vim.keymap.set('n', '<leader>db', ':call vimspector#ToggleBreakpoint()<cr>')
vim.keymap.set('n', '<leader>dB', ':call vimspector#ToggleConditionalBreakpoint()<cr>')
vim.keymap.set('n', '<leader>dn', ':call vimspector#StepOver()<cr>')
vim.keymap.set('n', '<leader>di', ':call vimspector#StepInto()<cr>')
vim.keymap.set('n', '<leader>do', ':call vimspector#StepOut()<cr>')
vim.keymap.set('n', '<leader>dr', ':call vimspector#RunToCursor()<cr>')
vim.keymap.set('n', '<leader>de', ':VimspectorEval', { remap = true })
vim.keymap.set('n', '<leader>dw', ':VimspectorWatch', { remap = true })
vim.keymap.set('n', '<leader>do', ':VimspectorShowOutput', { remap = true })

vim.keymap.set('n', '<C-w>w', ':ZoomWinTabToggle<CR>', { silent = true })

vim.keymap.set('n', '<leader>gl', ':diffget LOCAL<CR>', { remap = true })
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

vim.keymap.set('v', 'v', '<Plug>(expand_region_expand)', { remap = true })
vim.keymap.set('v', '<C-v>', '<Plug>(expand_region_shrink)', { remap = true })

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
vim.keymap.set('n', '<leader>r', ':GGrep<CR>', { silent = true })
vim.keymap.set('n', '<leader>R', ':Rg<CR>', { silent = true })
vim.keymap.set('n', '<Leader>*', ':Rg <C-R><C-W><CR>', { silent = true })
vim.keymap.set('n', '<leader>gg', ':GGrep<space>', { silent = true })
vim.keymap.set('n', '<C-n>', ':NERDTreeToggle<CR>')

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

vim.opt.termguicolors = true
vim.env.BAT_THEME = 'modus'
vim.cmd('syntax enable')
vim.opt.wrap = false
vim.opt.ruler = true
vim.opt.number = true
vim.opt.showmode = true

vim.g.coc_disable_transparent_cursor = 1
vim.opt.guicursor = 'n-v-c-sm:block,i-ci-ve:ver25-Cursor,r-cr-o:hor20'
vim.g.indentLine_char = '│'
vim.g.indentLine_concealcursor = ''
vim.g.vimwiki_listsyms = '✗○◐●✓'

vim.g.gruvbox_contrast_dark = 'normal'
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

vim.opt.number = false

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
