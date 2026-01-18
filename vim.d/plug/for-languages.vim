vim9script

def RailsCommentNotes()
  var keywords = 'OPTIMIZE|REVIEW|NOTE|XXX|FIXME|todo|HACK|TODO|REVIEW|DEBUG|BUG|NOTE'
  var tooling = ''
  var error_fmt = &errorformat
  # var cmd = $'rg --vimgrep "\b({keywords})\b:?"'

  if executable('rg')
    tooling = 'rg --vimgrep'
  elseif executable('ag')
    tooling = 'ag --vimgrep'
  else
    # Do nothing
    #
    # I'd have fallen back to `grep` here, but grep is atrociously slow, and
    # will break flow. It's best to stick to fast regex engines because the
    # sizes of these codebases are not reducing.
  endif

  if tooling == ''
    echoerr "No search tool (rg, ag) found in PATH"
    return
  endif

  var cmd = $'{tooling} "\b({keywords})\b:?"'

  var list = system(cmd)

  if v:shell_error == 0
    cexpr list
    copen
    w:quickfix_title = $'Rails Notes ({getqflist()->len()} entries)'
  else
    cclose
    echo "No notes found in codebase 🎉"
  endif
enddef

# Ledger (vim-ledger) ---------------------------------------------------- {{{
augroup ledger_filetypes
  au!
  autocmd BufNewFile,BufRead *.timeclock  set filetype=ledger
augroup END

g:ledger_fuzzy_account_completion = 1
# ------------------------------------------------------------------------ }}}
# PHP (php) -------------------------------------------------------------- {{{
var php_folding = 1
# ------------------------------------------------------------------------ }}}
# Rails (vim-rails) ------------------------------------------------------ {{{
command AC :execute "e " . eval('rails#buffer().alternate()')
command Notes RailsCommentNotes()
# ------------------------------------------------------------------------ }}}
