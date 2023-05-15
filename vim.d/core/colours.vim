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
# ------------------------------------------------------------------------ }}}
# Terse Programming, shall we? ------------------------------------------- {{{
def HighlightExcess(): void
  var blacklistSyntax = [
    'startify',
    'markdown'
  ]

  if &syntax->empty() || blacklistSyntax->index(&syntax) > 0
    return
  endif

  if &textwidth > 0
    call clearmatches()
    call matchadd('ColorColumn', '\%>' .. &tw .. 'v', 100)
  endif
enddef
augroup TooLong
    autocmd!
    autocmd winEnter,BufEnter * HighlightExcess()
augroup END
# ------------------------------------------------------------------------ }}}
# Everforest ------------------------------------------------------------- {{{
g:everforest_background = 'soft'
g:everforest_better_performance = 1
# ------------------------------------------------------------------------ {{{
