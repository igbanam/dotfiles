vim9script

g:startify_files_number = 0
g:startify_enable_special = 1
g:startify_commands = [
  {'c': ['Show All Commands', ':Commands']},
  {'o': ['Go To File', ':FZF']},
  {'f': ['Find in Files', ':Ag']},
  {'g': ['Open Git', ':G']},
  {'l': ['Show Branch Commits', ':Gclog']},
]
var longest_command = g:startify_commands
                        ->mapnew((_, f) => f->values()->deepcopy()->flatten(1)[0])
                        ->mapnew((_, g) => g->len())
                        ->max()
g:startify_padding_left = (winwidth(0) - longest_command) / 2
g:startify_lists = [
  { 'header': [repeat(' ', g:startify_padding_left) .. 'Commands'], 'type': 'commands' }
]

def! g:StartifyEntryFormat()
  return 'entry_path'
enddef

g:startify_custom_header = startify#center([
  '██╗   ██╗██╗███╗   ███╗███████╗ ██████╗ ██████╗ ██████╗ ███████╗',
  '██║   ██║██║████╗ ████║██╔════╝██╔════╝██╔═══██╗██╔══██╗██╔════╝',
  '██║   ██║██║██╔████╔██║███████╗██║     ██║   ██║██║  ██║█████╗',
  '╚██╗ ██╔╝██║██║╚██╔╝██║╚════██║██║     ██║   ██║██║  ██║██╔══╝',
  ' ╚████╔╝ ██║██║ ╚═╝ ██║███████║╚██████╗╚██████╔╝██████╔╝███████╗',
  '  ╚═══╝  ╚═╝╚═╝     ╚═╝╚══════╝ ╚═════╝ ╚═════╝ ╚═════╝ ╚══════╝',
])
g:startify_custom_footer = startify#center([
  '┌┐ ┬ ┬  ┬┌─┐┌┐ ┌─┐┌┐┌┌─┐┌┬┐',
  '├┴┐└┬┘  ││ ┬├┴┐├─┤│││├─┤│││',
  '└─┘ ┴   ┴└─┘└─┘┴ ┴┘└┘┴ ┴┴ ┴',
])
