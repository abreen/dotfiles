" Alexander Breen (alexander.breen@gmail.com)

syntax on           " turns on syntax highlighting
set tabstop=4       " how many columns a tab spans
set shiftwidth=2    " how many columns text is indented with >>, <<, etc.
set expandtab       " expand tab characters to spaces
set number          " turns on line numbers on the left margin
set ruler           " turns on ruler on bottom right of screen
set showcmd         " shows extra details about mode/command as you type
set hlsearch        " highlights all matches of search command
set magic           " use regular expressions in search patterns
set noerrorbells    " don't beep or flash when encountering an error
set novisualbell    " don't flash when encountering an error
set foldenable      " enable code folding
set fdm=manual      " set fold mode to manual
set smartindent     " turn on intelligent indentation measures

" highlight characters running past column 80
highlight rightMargin ctermfg=lightred
match rightMargin /.\%>80v/

" choose colors based on dark background
colorscheme koehler
set background=dark

" set English for spellchecking
"set spell spelllang=en_us

" attempt to save position of cursor in each file
au BufWinLeave ?* mkview
au BufWinEnter ?* silent loadview

