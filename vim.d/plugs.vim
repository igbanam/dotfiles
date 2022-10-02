vim9script

# Descriptions ----------------------------------------------------------- {{{
# This file contains all the plugins I use for Vim + the configuration of the
# plugin manager I use: vim-plug.
#
# The differnt files in the folder goes on to configure the plugins which need
# configuration. There are three groups of files in this folder by prefix:
# - `for-...`: configures plugins based on use-cases (e.g. for-folding.vim)
# - `my-...`: which hold custom functions I write myself
# - `...`: configuring plugins directly (e.g. vim-airline.vim)
# ------------------------------------------------------------------------ }}}

plug#begin('~/.vim/bundle')
# Colors ----------------------------------------------------------------- {{{

Plug 'dikiaap/minimalist'
Plug 'embark-theme/vim', { 'as': 'embark', 'branch': 'main' }
Plug 'logico/typewriter-vim'
Plug 'sainnhe/everforest'
Plug 'sonph/onehalf', { 'rtp': 'vim' }
# ------------------------------------------------------------------------ }}}
# IDE Capabilities ------------------------------------------------------- {{{
Plug 'airblade/vim-gitgutter'
Plug 'asheq/close-buffers.vim'
Plug 'docunext/closetag.vim',           { 'for': ['html', 'xml'] }
Plug 'edgedb/edgedb-vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'ervandew/supertab'
Plug 'evanleck/vim-svelte',             { 'for': 'svelte' }
Plug 'fatih/vim-go',                    { 'for': 'go', 'do': ':GoUpdateBinaries' }
Plug 'github/copilot.vim'
Plug 'janko-m/vim-test'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/fzf',                    { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim',               { 'for': 'markdown' }
Plug 'junegunn/limelight.vim'
Plug 'neoclide/coc.nvim',               { 'branch': 'release' }
Plug 'pangloss/vim-javascript',         { 'for': 'javascript' }
Plug 'pbrisbin/vim-mkdir'
Plug 'preservim/tagbar'
Plug 'pseewald/vim-anyfold'
Plug 'reedes/vim-pencil',               { 'for': 'markdown' }
Plug 'reedes/vim-wordy',                { 'for': 'markdown' }
Plug 'rhysd/vim-crystal',               { 'for': 'crystal' }
Plug 'romainl/vim-cool'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'slashmili/alchemist.vim',         { 'for': 'elixir' }
Plug 'tmhedberg/matchit'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-heroku'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-pandoc/vim-pandoc',           { 'for': 'markdown' }
Plug 'vim-pandoc/vim-pandoc-syntax',    { 'for': 'markdown' }
Plug 'vim-ruby/vim-ruby',               { 'for': 'ruby' }
Plug 'vim-scripts/vim-auto-save'
Plug 'wellle/targets.vim'

if v:version >= 800 || has('nvim')
  Plug 'dense-analysis/ale'
endif
# ------------------------------------------------------------------------ }}}
plug#end()

# Plug (vim-plug) -------------------------------------------------------- {{{
map <leader>plc :PlugClean<cr>
map <leader>pli :PlugInstall<cr>
map <leader>plu :PlugUpdate<cr>
# ------------------------------------------------------------------------ }}}
