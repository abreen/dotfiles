set tabstop=4       " how many columns a tab spans
set shiftwidth=4    " how many columns text is indented with >>, <<, etc.
set expandtab       " expand tab characters to spaces
set smarttab
set hlsearch        " highlights all matches of search command
set magic           " use regular expressions in search patterns
set noerrorbells    " don't beep or flash when encountering an error
set novisualbell    " don't flash when encountering an error
set foldenable      " enable code folding
set fdm=syntax      " set fold mode
set foldnestmax=2
set smartindent     " turn on intelligent indentation measures
set so=7            " keep cursor from moving >7 lines from edge of window

if &term != "vt220"
    syntax on
    set number
    set ruler
    set showcmd

    " show tab characters with triangle and trailing spaces with dot
    set listchars=tab:▸\ ,trail:·
    set list

    " highlight characters running past column 80
    highlight rightMargin ctermfg=lightred
    match rightMargin /.\%>80v/

    " choose colors based on dark background
    colorscheme lucius
    set background=light
else
    set noruler
endif

" set English for spellchecking
"set spell spelllang=en_us

