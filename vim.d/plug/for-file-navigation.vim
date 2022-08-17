vim9script

# File Navigation (fzf, fzf.vim, nerdtree, telescope.nvim) --------------- {{{
# FZF
$FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -l -g ""'
nnoremap <c-p> :FZF<cr>

# NERDTree
g:NERDTreeDirArrowExpandable = '▸'
g:NERDTreeDirArrowCollapsible = '▾'
map <C-n> :NERDTreeToggle<cr>
map <leader>nf :NERDTreeFind<cr>
# This segment should remove the square brackets in NERDTree. But to do this,
# the following criteria has to be met
# - Vim needs to be compiled with +conceal
#   - Homebrew's Vim has this, but it comes with other complications
# - set conceallevel? must be 3, and
# - g:webdevicons_conceal_nerdtree_brackets must be 1
set conceallevel=3
if exists('g:loaded_webdevicons')
  webdevicons#refresh()
endif

# Telescope
if exists("loaded_telescope")
lua <<TELESCOPE_CONFIG
require('telescope').setup{
  defaults = {
  },
  pickers = {
    find_files = {
      find_command = { "ag", "--hidden", "--ignore", ".git", "-l", "-g", "" },
    }
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = smart_case,
    }
  }
}

require('telescope').load_extension('fzf')
require('telescope').load_extension('gh')
TELESCOPE_CONFIG
endif
# ------------------------------------------------------------------------ }}}