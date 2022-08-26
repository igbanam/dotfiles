vim9script

# Intellisense (coc.nvim, copilot.vim, ale, supertab) -------------------- {{{
set shortmess+=c      # Don't give |ins-completion-menu| messages
set updatetime=300    # Diagnostic messages disappear faster

# For expanding decorations in Scala worksheets
nmap <leader>ws <Plug>(coc-metals-expand-decoration)

# Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

# Navigating the diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev>)
nmap <silent> ]g <Plug>(coc-diagnostic-next>)

# Trigger Code Actions
nnoremap <leader>cl :<c-u>call CocActionAsync('codeLensAction')<cr>

# Remap <C-f> and <C-b> for scroll float windows/popups.
# -- currently doesn't work in Vim9 because of different scroll semantics
nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"

g:coc_global_extensions = [
  'coc-java',
  'coc-json',
  'coc-phpactor',
  'coc-tsserver'
]

# Copilot
g:copilot_filetypes = {
  '*': v:false,
  'php': v:true,
  'python': v:true,
  'ruby': v:true
}

# Ale
g:ale_set_highlights = 1
g:ale_linters_explicit = 1
g:ale_linters = {
  'elixir': ['credo', 'dialyxir', 'dogma', 'mix'],
  'ruby': ['ruby', 'rails_best_practices']
}

# SuperTab
g:SuperTabDefaultCompletionType = "<c-n>"
# ------------------------------------------------------------------------ }}}
