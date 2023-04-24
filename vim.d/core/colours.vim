vim9script

# Highlighting ----------------------------------------------------------- {{{
# switch syntax highlighting on, when the terminal has colors
# also switch on highlighting the last used search pattern.
if (str2nr(&t_Co) > 2 || has("gui_running")) && !exists("syntax_on")
  syntax enable
endif
# ------------------------------------------------------------------------ }}}
# Colour Scheme ---------------------------------------------------------- {{{
colorscheme onehalfdark
# ------------------------------------------------------------------------ }}}
# GUI Colours ------------------------------------------------------------ {{{
if (has('termguicolors'))
  set termguicolors
endif
# ------------------------------------------------------------------------ {{{
