vim9script

# Highlighting ----------------------------------------------------------- {{{
# switch syntax highlighting on, when the terminal has colors
# also switch on highlighting the last used search pattern.
if (str2nr(&t_Co) > 2 || has("gui_running")) && !exists("syntax_on")
  syntax enable
endif
# ------------------------------------------------------------------------ }}}
# Colour Scheme ---------------------------------------------------------- {{{

def ColorExists(color: string): bool
  var color_path: string = "colors/" .. color .. ".vim"
  return !empty(globpath(&rtp, color_path))
enddef

def ThemeExists(vimtheme: string): bool
  return vimtheme->filereadable() && vimtheme->readfile('', 1)->get(0)->ColorExists()
enddef

def GetThemeFile(): string
  if 'g:vimtheme_location'->exists()
    return getcwd() .. g:vimtheme_location
  endif
  return getcwd() .. '/.vimtheme'
enddef

def Theme(theme_file: string, default_theme: string)
  var active_theme: string
  if ThemeExists(theme_file)
    active_theme = theme_file->readfile('', 1)->get(0)
  else
    active_theme = "sorbet"
  endif
  execute 'colorscheme ' .. active_theme
enddef

Theme(GetThemeFile(), "sorbet")
# ------------------------------------------------------------------------ }}}
# GUI Colours ------------------------------------------------------------ {{{
if (has('termguicolors'))
  set termguicolors
endif
# ------------------------------------------------------------------------ }}}
# Everforest ------------------------------------------------------------- {{{
g:everforest_background = 'soft'
g:everforest_better_performance = 1
# ------------------------------------------------------------------------ {{{
