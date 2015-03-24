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

set fdm=manual

set number
set ruler
set showcmd

set listchars=tab:▸\ ,trail:·
set list

let base16colorspace=256  " Access colors present in 256 colorspace
set background=dark
colorscheme base16-tomorrow

highlight rightMargin ctermbg=red ctermfg=white
match rightMargin /.\%>80v/

if &term == "xterm-256color-italic"
  hi Comment cterm=italic
endif

au BufRead,BufNewFile *.dats set filetype=ats
au BufRead,BufNewFile *.sats set filetype=ats

autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
autocmd Filetype ats setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd Filetype yaml setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
