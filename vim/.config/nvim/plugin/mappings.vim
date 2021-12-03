map <Leader>gb :let &background = ( &background == "dark"? "light" : "dark" )<CR>
inoremap jj <esc>
inoremap jk <esc>
nnoremap <Leader>W :w<CR>

nnoremap n nzzzv
nnoremap n nzzzv

nnoremap <C-n> :NvimTreeToggle<CR>

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
nmap <leader>dd :call vimspector#Launch()<CR>
nmap <leader>dx :VimspectorReset<CR>
nmap <leader>de :VimspectorEval
nmap <leader>dw :VimspectorWatch
nmap <leader>do :VimspectorShowOutput
nmap <leader>d5 <Plug>VimspectorContinue

" zoomwin toggle
nnoremap <silent> <C-w>w :ZoomWinTabToggle<CR>

" FuGITive
nmap <leader>gh :diffget //3<CR>
nmap <leader>gu :diffget //2<CR>
nmap <leader>gs :G<CR>
nmap <leader>gc :GCommit<CR>
nmap <leader>gv :Gvdiff<CR>
nmap <leader>gn <Plug>(GitGutterNextHunk)
nmap <leader>gp <Plug>(GitGutterPrevHunk)
nmap <leader>ga <Plug>(GitGutterStageHunk)
nmap <leader>gd <Plug>(GitGutterUndoHunk)

map q: :q
map :W :w

" Allows you to easily replace the current word and all its occurrences.
nnoremap <leader>cr :%s/\<<C-r><C-w>\>/
vnoremap <leader>cr y:%s/<C-r>"/

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

nnoremap <silent> <leader>p :FZF -m<CR>
nnoremap <silent> <leader>t :GFiles<CR>
nnoremap <silent> <leader>r :Rg<CR>
nnoremap <silent> <Leader>* :Rg <C-R><C-W><CR>

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
