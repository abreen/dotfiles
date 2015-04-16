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

set background=dark
colorscheme base16-tomorrow

highlight rightMargin ctermbg=red ctermfg=white
match rightMargin /.\%>80v/

if &term == "xterm-256color-italic"
  hi Comment cterm=italic
endif

" Special escape for iTerm
if exists('$TMUX')
  " Need special escape when using tmux
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

set noesckeys

au BufRead,BufNewFile *.dats set filetype=ats
au BufRead,BufNewFile *.sats set filetype=ats

autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
autocmd Filetype ats setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd Filetype yaml setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
