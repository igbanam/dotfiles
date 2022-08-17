vim9script

# File Navigation (fzf, fzf.vim, nerdtree) ------------------------------- {{{
# FZF
$FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git --ignore sorbet -l -g ""'
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
# ------------------------------------------------------------------------ }}}
