vim9script

# Ruby (vim-ruby) -------------------------------------------------------- {{{
# ------------------------------------------------------------------------ }}}
# PHP (php) -------------------------------------------------------------- {{{
var php_folding = 1
# ------------------------------------------------------------------------ }}}
# Rails (vim-rails) ------------------------------------------------------ {{{
command AC :execute "e " . eval('rails#buffer().alternate()')
# ------------------------------------------------------------------------ }}}
