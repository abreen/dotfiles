set tabstop=8       " how many columns a tab spans
set shiftwidth=8    " how many columns text is indented with >>, <<, etc.
"set expandtab       " expand tab characters to spaces
set smarttab
set hlsearch        " highlights all matches of search command
set magic           " use regular expressions in search patterns
set noerrorbells    " don't beep or flash when encountering an error
set novisualbell    " don't flash when encountering an error
set smartindent     " turn on intelligent indentation measures
set so=3            " keep cursor from moving >3 lines from edge of window

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

    set background=light
    "colorscheme berlin
else
    set noruler
endif

" set English for spellchecking
"set spell spelllang=en_us

