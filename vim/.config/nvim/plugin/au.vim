" json syntax highlighting
autocmd FileType json syntax match Comment +\/\/.\+$+
au BufRead,BufNewFile *.sbt set filetype=scala
autocmd FileType java nmap <leader>dd :CocCommand java.debug.vimspector.start<CR>
