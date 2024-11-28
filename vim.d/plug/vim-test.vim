vim9script

# Test (vim-test) -------------------------------------------------------- {{{
command! -nargs=* -bar TestNearestDebug call test#run('nearest', split(<q-args>)->add('-Dmaven.surefire.debug'))

map <leader>t :TestFile<cr>
map <leader>s :TestNearest<cr>
map <leader>l :TestLast<cr>
map <leader>a :TestSuite<cr>
map <leader>d :TestNearestDebug<cr>

if exists('$TMUX')
  g:test#strategy = "dispatch"
else
  g:test#strategy = "vimterminal"
endif

g:test#ruby#minitest#options = '--verbose'
g:test#ruby#rspec#options = {
  'all': '--no-color',
  'file': '--format documentation'
}
g:test#crystal#crystalspec#options = '--no-color'
g:test#dart#darttest#options = '--no-color'
# ------------------------------------------------------------------------ }}}
