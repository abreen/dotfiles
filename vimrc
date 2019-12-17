set tabstop=4
set shiftwidth=4
set smarttab
set expandtab

autocmd BufNewFile,BufRead *.md set filetype=markdown

autocmd Filetype sh setlocal expandtab
autocmd Filetype python setlocal expandtab
autocmd Filetype java setlocal expandtab
autocmd Filetype php setlocal expandtab
autocmd Filetype javascript setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd Filetype css setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd Filetype yaml setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd Filetype html setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd Filetype markdown setlocal expandtab

if exists('$WAYFAIR')
    autocmd Filetype php setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
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

set nonumber
