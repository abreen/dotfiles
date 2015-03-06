set tabstop=4
set shiftwidth=4
set expandtab
set smarttab
set hlsearch
set magic
set noerrorbells
set novisualbell
set smartindent
set so=3

syntax on

set number
set ruler
set showcmd

set listchars=tab:▸\ ,trail:·
set list

highlight rightMargin ctermfg=lightred
match rightMargin /.\%>80v/

set background=light

autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
