set tabstop=4
set shiftwidth=4
set smarttab

autocmd BufNewFile,BufRead *.md set filetype=markdown

autocmd Filetype sh setlocal expandtab
autocmd Filetype python setlocal expandtab
autocmd Filetype java setlocal expandtab
autocmd Filetype php setlocal expandtab
autocmd Filetype javascript setlocal expandtab
autocmd Filetype css setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd Filetype yaml setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd Filetype html setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd Filetype markdown setlocal expandtab

if exists('$WAYFAIR')
    autocmd Filetype php setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
    autocmd Filetype javascript setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
endif

set magic
set smartindent
set so=3

"set foldmethod=syntax

set noshowmode
set noruler
set noesckeys

set background=dark

set hlsearch
set noerrorbells
set novisualbell

syntax on

set ruler
set showcmd

set listchars=tab:▸\ ,trail:·
set list

set number

call plug#begin('~/.vim/plugged')
Plug 'metakirby5/codi.vim'
Plug 'scrooloose/nerdtree'
call plug#end()

" :PlugInstall          install plugins
" :PlugUpdate           install or update plugins
" :PlugClean            remove unused directories
" :PlugUpgrade          upgrade vim-plug
" :PlugStatus           status of plugins

let g:NERDTreeDirArrowExpandable = '►'
let g:NERDTreeDirArrowCollapsible = '▼'

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
