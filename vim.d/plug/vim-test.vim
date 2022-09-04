vim9script

# Test (vim-test) -------------------------------------------------------- {{{
map <leader>t :TestFile<cr>
map <leader>s :TestNearest<cr>
map <leader>l :TestLast<cr>
map <leader>a :TestSuite<cr>

if exists('$TMUX')
  g:test#strategy = "dispatch"
else
  g:test#strategy = "vimterminal"
endif

g:test#ruby#minitest#options = '--verbose'
# ------------------------------------------------------------------------ }}}
