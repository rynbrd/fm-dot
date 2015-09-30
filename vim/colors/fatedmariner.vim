"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fated Mariner VIM Color Scheme
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
hi clear
if exists("syntax on")
    syntax reset
endif
let g:colors_name = "fatedmariner"

" general colors
hi Normal       ctermfg=250 ctermbg=234
hi Directory    term=bold ctermfg=blue
hi ErrorMsg     term=standout ctermfg=white ctermbg=red
hi NonText      ctermfg=233 ctermbg=233
hi SpecialKey   term=bold ctermfg=234
hi LineNr       term=underline ctermfg=darkgray ctermbg=233
hi CursorLineNr term=underline ctermfg=brown ctermbg=233
hi CursorLine   cterm=none ctermbg=233 
hi CursorColumn cterm=none ctermbg=233 
hi IncSearch    term=reverse cterm=reverse
hi Search       term=reverse ctermfg=black ctermbg=yellow
hi Visual       term=bold,reverse cterm=bold,reverse ctermfg=gray ctermbg=black
hi VisualNOS    term=bold,underline cterm=bold,underline
hi MoreMsg      term=bold ctermfg=green
hi ModeMsg      term=bold cterm=bold
hi Question     term=standout ctermfg=green
hi WarningMsg   term=standout ctermfg=red
hi WildMenu     term=standout ctermfg=black ctermbg=yellow
hi Folded       term=standout ctermfg=blue ctermbg=white
hi FoldColumn   term=standout ctermfg=blue ctermbg=white
hi DiffAdd      term=bold ctermbg=blue
hi DiffChange   term=bold ctermbg=darkmagenta
hi DiffDelete   term=bold cterm=bold ctermfg=lightblue ctermbg=cyan
hi DiffText     term=reverse cterm=bold ctermbg=red
hi StatusLine   term=reverse cterm=reverse ctermfg=237 ctermbg=231
hi StatusLineNC term=reverse cterm=reverse ctermfg=234 ctermbg=231
hi VertSplit    term=reverse cterm=reverse
hi Title        term=bold ctermfg=magenta
hi SignColumn   ctermbg=233

" gitgutter
hi GitGutterAdd          guifg=#009900 guibg=NONE ctermfg=2 ctermbg=233
hi GitGutterChange       guifg=#bbbb00 guibg=NONE ctermfg=3 ctermbg=233
hi GitGutterDelete       guifg=#ff2222 guibg=NONE ctermfg=1 ctermbg=233
hi GitGutterChangeDelete guifg=#bbbb00 guibg=NONE ctermfg=3 ctermbg=233

" syntax highlight colors
hi Comment      term=bold ctermfg=darkcyan
hi PreProc      term=underline ctermfg=darkblue
hi Constant     term=underline ctermfg=darkred
hi Type         term=underline ctermfg=darkgreen
hi Statement    term=bold ctermfg=darkyellow
hi Identifier   term=underline ctermfg=darkgreen
hi Ignore       term=bold ctermfg=darkgray
hi Special      term=underline ctermfg=brown
hi Error        term=reverse ctermfg=gray ctermbg=red
hi Todo         term=standout ctermfg=black ctermbg=yellow
hi Underlined   term=underline cterm=underline ctermfg=darkblue
hi Number       term=underline ctermfg=darkred

" syntax highlight links
hi link String          Constant
hi link Character       Constant
hi link Number          Constant
hi link Boolean         Constant
hi link Float           Number
hi link Function        Identifier
hi link Number          Constant
hi link Conditional     Statement
hi link Repeat          Statement
hi link Label           Statement
hi link Keyword         Statement
hi link Exception       Statement
hi link Operator        Statement
hi link Include         PreProc
hi link Define          PreProc
hi link Macro           PreProc
hi link PreCondit       PreProc
hi link StorageClass    Type
hi link Structure       Type
hi link Typedef         Type
hi link Tag             Special
hi link SpecialChar     Special
hi link Delimiter       Special
hi link SpecialComment  Special
hi link Debug           Special
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
