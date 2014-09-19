" Berlin, a color scheme for vim
" Author: Alexander Breen (abreen@bu.edu)
" Last Change:  August 28, 2014

highlight clear

set background=dark
let g:colors_name = "berlin"

highlight DiffAdd ctermfg=lightgreen
highlight DiffChange ctermfg=yellow
highlight DiffDelete ctermfg=lightred
highlight DiffText ctermbg=darkyellow ctermfg=white

highlight Folded ctermbg=darkgray ctermfg=white

highlight LineNr ctermfg=darkgray
highlight MatchParen ctermbg=darkblue
highlight ModeMsg cterm=bold
highlight NonText ctermfg=red
highlight SpecialKey ctermfg=darkgray
highlight StatusLine ctermbg=blue ctermfg=blue
highlight StatusLineNC ctermbg=gray ctermfg=gray
highlight VertSplit cterm=none
highlight Visual ctermbg=none cterm=reverse
highlight VisualNOS cterm=bold
highlight Todo cterm=bold ctermfg=red ctermbg=none

highlight Search cterm=bold ctermbg=darkblue ctermfg=yellow
highlight link IncSearch Search

" syntax
highlight Normal cterm=none ctermfg=white
highlight Comment cterm=none ctermfg=gray
highlight Constant cterm=none ctermfg=magenta
highlight Operator ctermfg=green
highlight Identifier cterm=none ctermfg=blue
highlight PreProc cterm=none ctermfg=darkcyan
highlight Special cterm=bold ctermfg=gray
highlight Delimiter cterm=none ctermfg=darkblue
highlight Statement cterm=none ctermfg=yellow
highlight Type cterm=none ctermfg=cyan

" HTML syntax
highlight htmlH1 cterm=bold ctermfg=red
highlight htmlH2 cterm=none ctermfg=red

" Markdown syntax
highlight markdownRule ctermfg=darkblue
