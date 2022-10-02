vim9script

# Buffers ---------------------------------------------------------------- {{{
set hidden

# Closers (close-buffers)
nmap <leader>w :Bdelete this<cr>
nmap <leader>aw :Bdelete all<cr>
nmap <leader>hw :Bdelete hidden<cr>

# Quicker Window Movement
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
# ------------------------------------------------------------------------ }}}
# Discipline ------------------------------------------------------------- {{{
nnoremap <left>  :echoe "!!! Use h !!!"<cr>
nnoremap <right> :echoe "!!! Use l !!!"<cr>
nnoremap <up>    :echoe "!!! Use k !!!"<cr>
nnoremap <down>  :echoe "!!! Use j !!!"<cr>
# ------------------------------------------------------------------------ }}}
