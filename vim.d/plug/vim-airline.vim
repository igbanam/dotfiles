vim9script

# Airline (vim-airline) -------------------------------------------------- {{{
if !exists('g:airline_symbols')
  g:airline_symbols = {}
endif

g:airline_theme = 'zenburn'
g:airline_experimental = 1
g:airline_powerline_fonts = 1
g:airline_left_alt_sep = "\uE0C1"
g:airline_left_sep = "\uE0C0"
g:airline_right_alt_sep = "\uE0C3"
g:airline_right_sep = "\uE0C2"

g:airline#extensions#coc#enabled = 1
g:airline#extensions#coc#show_coc_status = 1
g:airline#extensions#fzf#enabled = 1
g:airline#extensions#tabline#enabled = 1
g:airline#extensions#tabline#alt_sep = 1
g:airline#extensions#tabline#close_symbol = '󰅙'
g:airline#extensions#tabline#left_alt_sep = ''
g:airline#extensions#tabline#left_sep = ''
g:airline#extensions#tabline#right_alt_sep = ''
g:airline#extensions#tabline#right_sep = ''
g:airline#extensions#wordcount#enabled = 1
g:airline#extensions#wordcount#filetypes = ['asciidoc', 'help', 'mail', 'markdown', 'rmd', 'nroff', 'org', 'plaintex', 'rst', 'tex', 'text']

# ------------------------------------------------------------------------ }}}
