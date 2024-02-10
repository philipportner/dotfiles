map <Leader>gb :let &background = ( &background == "dark"? "light" : "dark" )<CR>
inoremap jj <esc>
inoremap jk <esc>

nmap <Leader>n :ClangFormat<CR>
xmap <Leader>n :ClangFormat<CR>

nnoremap n nzzzv
nnoremap n nzzzv

" " Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
" " Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

" exit TERMINAL MODE in terminal
tnoremap <Esc> <C-\><C-n>

map <F1> :call CurtineIncSw()<CR>
nmap <F2> :TagbarToggle<CR>

" VIMSPECTOR
nnoremap <leader>dd :call vimspector#Launch()<cr>
nmap <leader>dx :VimspectorReset<CR>
nnoremap <leader>dc :call vimspector#Continue()<cr>
nnoremap <leader>ds :call vimspector#Stop()<cr>
nnoremap <leader>dR :call vimspector#Restart()<cr>
nnoremap <leader>dp :call vimspector#Pause()<cr>
nnoremap <leader>db :call vimspector#ToggleBreakpoint()<cr>
nnoremap <leader>dB :call vimspector#ToggleConditionalBreakpoint()<cr>
nnoremap <leader>dn :call vimspector#StepOver()<cr>
nnoremap <leader>di :call vimspector#StepInto()<cr>
nnoremap <leader>do :call vimspector#StepOut()<cr>
nnoremap <leader>dr :call vimspector#RunToCursor()<cr>
nmap <leader>de :VimspectorEval
nmap <leader>dw :VimspectorWatch
nmap <leader>do :VimspectorShowOutput

" zoomwin toggle
nnoremap <silent> <C-w>w :ZoomWinTabToggle<CR>

" FuGITive
nmap <leader>gl :diffget LOCAL<CR>
nmap <leader>gr :diffget REMOTE<CR>
nmap <leader>gs :G<CR>
nmap <leader>gc :GCommit<CR>
nmap <leader>gv <Plug>(GitGutterPreviewHunk)
nmap <leader>gn <Plug>(GitGutterNextHunk)
nmap <leader>gp <Plug>(GitGutterPrevHunk)
nmap <leader>ga <Plug>(GitGutterStageHunk)
nmap <leader>gd <Plug>(GitGutterUndoHunk)

map q: :q
map :W :w
map :E :e
map :Q :q

" Allows you to easily replace the current word and all its occurrences.
" nnoremap <leader>cr :%s/\<<C-r><C-w>\>/
" vnoremap <leader>cr y:%s/<C-r>"/

vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

map <left> :5winc ><CR>
map <right> :5winc <<CR>
map <down> :5winc +<CR>
map <up> :5winc -<CR>

nnoremap j gj
nnoremap k gk

noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

nnoremap <silent> <leader>b :Buffers<CR>


"" Clean search (highlight)
nnoremap <silent> <leader><space> :noh<cr>

nnoremap <silent> <leader>f :Files<CR>
nnoremap <silent> <leader>t :GFiles<CR>
nnoremap <silent> <leader>r :GGrep<CR>
nnoremap <silent> <leader>R :Rg<CR>
nnoremap <silent> <Leader>* :Rg <C-R><C-W><CR>
nnoremap <silent> <leader>gg :GGrep<space>

nnoremap <C-n> :NERDTreeToggle<CR>

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
