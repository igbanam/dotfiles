vim9script

set packpath^=~/.vim

const MainPackages = [
  'lifepillar/vim-devel',
  '~/projects/igbanam/vim-stdlib'
]

# Try to load minpac.
packadd minpac

if !exists('g:loaded_minpac')
  # minpac is not available.

  # clone minpack into the pack directory.
  silent !git clone https://github.com/k-takata/minpac.git ~/.vim/pack/minpac/opt/minpac

  packadd minpac
endif

# minpac is available.
call minpac#init()
call minpac#add('k-takata/minpac', {'type': 'opt'})
for package in MainPackages
  call minpac#add(package)
endfor

command! PackClean  call minpac#clean()
command! PackStatus call minpac#status()
command! PackUpdate call minpac#update()

# MinPac (minpac) -------------------------------------------------------- {{{
map <leader>mpc :PackClean<cr>
map <leader>mps :PackStatus<cr>
map <leader>mpu :PackUpdate<cr>
# ------------------------------------------------------------------------ }}}
