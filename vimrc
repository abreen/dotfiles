autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
autocmd Filetype yaml setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2

set tabstop=4
set shiftwidth=4
set expandtab
set smarttab

set magic
set smartindent
set so=3

"set foldmethod=syntax

set noshowmode
set noruler
set noesckeys

colorscheme base16-eighties
set background=dark

" iTerm only: change cursor shape in insert mode
if exists('$TMUX')
  " need special escape when using tmux
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

set hlsearch
set noerrorbells
set novisualbell

syntax on

set ruler
set showcmd

set listchars=tab:▸\ ,trail:·
set list

set number
