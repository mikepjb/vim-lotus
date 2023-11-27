" set background=dark
hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "lotus"

let s:color_names = {
      \'base03':      8,
      \'base02':      0,
      \'base01':      10,
      \'base00':      11,
      \'base0':       12,
      \'base1':       14,
      \'base2':       7,
      \'base3':       15,
      \'red':         1,
      \'dark-red':    9,
      \'green':       2,
      \'yellow':      3,
      \'blue':        4,
      \'dark-yellow': 5,
      \'dark-green':  13,
      \'cyan':        6,
      \'NONE':        16,
      \}

let s:gui_colors = [
      \'#3e3e3e',
      \'#ca7272',
      \'#95ff53',
      \'#ffd918',
      \'#0076ac',
      \'#ff7fff',
      \'#b2fff5',
      \'#f2f2f2',
      \'#2c2c2c',
      \'#ff934b',
      \'#505050',
      \'#707070',
      \'#959595',
      \'#7e7eff',
      \'#b2b2b2',
      \'#ffffff',
      \'NONE',
      \]

""""""""""""""""""""""""""""""""""""""""""""""""""""
" color section
""""""""""""""""""""""""""""""""""""""""""""""""""""

function! s:ac(name, fgcolor, bgcolor, style) " a.k.a apply color
  let fgn = s:color_names[a:fgcolor]
  let bgn = s:color_names[a:bgcolor]
  execute "hi " . a:name 
      \ . " guifg="   . s:gui_colors[fgn]
      \ . " guibg="   . s:gui_colors[bgn]
      \ . " gui="     . a:style
      \ . " ctermfg=" . (fgn >= 16? s:gui_colors[fgn] : fgn)
      \ . " ctermbg=" . (bgn >= 16? s:gui_colors[bgn] : bgn)
      \ . " cterm="   . a:style
endfunction

hi link Character       Constant
hi link Boolean         Constant
hi link Float           Number
hi link Repeat          Statement
hi link Label           Statement
hi link Exception       Statement
hi link Include         PreProc
hi link Define          PreProc
hi link Macro           PreProc
hi link PreCondit       PreProc
hi link StorageClass    Type
hi link Structure       Type
hi link Typedef         Type
hi link Tag             Special
hi link SpecialChar     Special
hi link SpecialComment  Special
hi link Debug           Special
hi link vimFuncBody     Normal
" Special for XML
hi link xmlTag          Keyword 
hi link xmlTagName      Conditional 
hi link xmlEndTag       Identifier 
" Special for HTML
hi link htmlTag         Keyword 
hi link htmlTagName     Conditional 
hi link htmlEndTag      Identifier 
" Special for JavaScript
hi link javaScriptNumber      Number 
" Special for Ruby
hi link rubyClass             Keyword 
hi link rubyModule            Keyword 
hi link rubyKeyword           Keyword 
hi link rubyOperator          Operator
hi link rubyIdentifier        Identifier
hi link rubyInstanceVariable  Identifier
hi link rubyGlobalVariable    Identifier
hi link rubyClassVariable     Identifier
hi link rubyConstant          Type  
" Special for Java
hi link javaScopeDecl         Identifier 
hi link javaCommentTitle      javaDocSeeTag 
hi link javaDocTags           javaDocSeeTag 
hi link javaDocParam          javaDocSeeTag 
hi link javaDocSeeTagParam    javaDocSeeTag 
hi link diffAdded             DiffAdd
hi link diffRemoved           DiffDelete
hi link diffFile              DiffText
hi link diffLine              DiffText
hi link diffIndexLine         DiffChange

if &background == "dark"
  " base
  call s:ac('Normal', 'base3', 'base03', 'NONE')
  call s:ac('NonText', 'base3', 'base03', 'NONE')
  call s:ac('Comment', 'base1', 'base03', 'NONE')
  call s:ac('TODO', 'yellow', 'NONE', 'NONE')
  " syntax
  call s:ac('Type', 'green', 'NONE', 'NONE')
  call s:ac('Special', 'green', 'NONE', 'NONE')
  call s:ac('Delimiter', 'cyan', 'NONE', 'NONE')
  call s:ac('Operator', 'green', 'NONE', 'NONE')
  call s:ac('String', 'base2', 'NONE', 'NONE')
  call s:ac('Statement', 'green', 'NONE', 'NONE')
  call s:ac('Keyword', 'cyan', 'NONE', 'NONE')
  call s:ac('PreProc', 'cyan', 'NONE', 'NONE')
  call s:ac('Conditional', 'cyan', 'NONE', 'NONE')
  call s:ac('Identifier', 'cyan', 'NONE', 'NONE')
  call s:ac('Number', 'yellow', 'NONE', 'NONE')
  call s:ac('Constant', 'red', 'NONE', 'NONE')
  call s:ac('Function', 'yellow', 'NONE', 'NONE')
  call s:ac('DiffAdd', 'green', 'NONE', 'NONE')
  call s:ac('DiffChange', 'yellow', 'NONE', 'NONE')
  call s:ac('DiffText', 'base2', 'NONE', 'NONE')
  call s:ac('DiffDelete', 'red', 'NONE', 'NONE')
  call s:ac('javaDocSeeTag', 'yellow', 'NONE', 'NONE')
  if version >= 700 " Vim 7.x specific colors
    call s:ac('MatchParen', 'yellow', 'NONE', 'BOLD')
  endif
  " UI
  call s:ac('Error', 'red', 'NONE', 'NONE')
  call s:ac('ErrorMsg', 'red', 'NONE', 'NONE')
  call s:ac('WarningMsg', 'red', 'NONE', 'NONE')
  call s:ac('SpellBad', 'red', 'NONE', 'NONE')
  call s:ac('VertSplit', 'base02', 'base02', 'NONE')
  call s:ac('StatusLine', 'cyan', 'base02', 'BOLD')
  call s:ac('StatusLineNC', 'cyan', 'base02', 'NONE')
  call s:ac('Visual', 'NONE', 'base02', 'NONE')
  call s:ac('Cursor', 'base01', 'base03', 'NONE')
  call s:ac('LineNr', 'base01', 'base03', 'NONE')
  if version >= 700 " Vim 7.x specific colors
    call s:ac('CursorLine', 'NONE', 'base02', 'BOLD')
    call s:ac('CursorColumn', 'cyan', 'base02', 'BOLD')
    call s:ac('CursorLineNr', 'cyan', 'base02', 'BOLD')
    call s:ac('Pmenu', 'cyan', 'base02', 'BOLD')
    call s:ac('PmenuSel', 'cyan', 'base02', 'BOLD')
    call s:ac('Search', 'cyan', 'base02', 'BOLD')
    call s:ac('TabLineFill', 'base01', 'base02', 'NONE')
    call s:ac('TabLine', 'base3', 'base02', 'NONE')
    call s:ac('TabLineSel', 'base0', 'base03', 'NONE')
  endif
else " light
  " base
  call s:ac('Normal', 'base03', 'base3', 'NONE')
  call s:ac('NonText', 'base03', 'base3', 'NONE')
  call s:ac('Comment', 'base02', 'base3', 'NONE')
  call s:ac('TODO', 'dark-yellow', 'NONE', 'NONE')
  " syntax
  call s:ac('Type', 'dark-green', 'NONE', 'NONE')
  call s:ac('Special', 'dark-green', 'NONE', 'NONE')
  call s:ac('Delimiter', 'dark-green', 'NONE', 'NONE')
  call s:ac('Operator', 'dark-green', 'NONE', 'NONE')
  call s:ac('String', 'base02', 'NONE', 'NONE')
  call s:ac('Statement', 'dark-green', 'NONE', 'NONE')
  call s:ac('Keyword', 'blue', 'NONE', 'NONE')
  call s:ac('PreProc', 'blue', 'NONE', 'NONE')
  call s:ac('Conditional', 'blue', 'NONE', 'NONE')
  call s:ac('Identifier', 'blue', 'NONE', 'NONE')
  call s:ac('Number', 'dark-yellow', 'NONE', 'NONE')
  call s:ac('Constant', 'dark-red', 'NONE', 'NONE')
  call s:ac('Function', 'dark-yellow', 'NONE', 'NONE')
  call s:ac('DiffAdd', 'dark-green', 'NONE', 'NONE')
  call s:ac('DiffChange', 'dark-yellow', 'NONE', 'NONE')
  call s:ac('DiffText', 'base02', 'NONE', 'NONE')
  call s:ac('DiffDelete', 'dark-red', 'NONE', 'NONE')
  call s:ac('javaDocSeeTag', 'dark-yellow', 'NONE', 'NONE')
  if version >= 700 " Vim 7.x specific colors
    call s:ac('MatchParen', 'yellow', 'NONE', 'BOLD')
  endif
  " UI
  call s:ac('Error', 'dark-red', 'NONE', 'NONE')
  call s:ac('ErrorMsg', 'dark-red', 'NONE', 'NONE')
  call s:ac('WarningMsg', 'dark-red', 'NONE', 'NONE')
  call s:ac('SpellBad', 'dark-red', 'NONE', 'NONE')
  call s:ac('VertSplit', 'base2', 'base2', 'NONE')
  call s:ac('StatusLine', 'blue', 'base2', 'BOLD')
  call s:ac('StatusLineNC', 'blue', 'base2', 'NONE')
  call s:ac('Visual', 'NONE', 'base2', 'NONE')
  call s:ac('Cursor', 'base1', 'base3', 'NONE')
  call s:ac('LineNr', 'base1', 'base3', 'NONE')
  if version >= 700 " Vim 7.x specific colors
    call s:ac('CursorLine', 'NONE', 'base2', 'BOLD')
    call s:ac('CursorColumn', 'blue', 'base2', 'BOLD')
    call s:ac('CursorLineNr', 'blue', 'base2', 'BOLD')
    call s:ac('Pmenu', 'base02', 'base2', 'BOLD')
    call s:ac('PmenuSel', 'blue', 'base1', 'BOLD')
    call s:ac('Search', 'blue', 'base2', 'BOLD')
    call s:ac('TabLineFill', 'base1', 'base2', 'NONE')
    call s:ac('TabLine', 'base01', 'base2', 'NONE')
    call s:ac('TabLineSel', 'base02', 'base3', 'NONE')
  endif
endif

" Common Rules
call s:ac('Title', 'base00', 'NONE', 'BOLD')
call s:ac('ModeMsg', 'base00', 'NONE', 'BOLD')

" rarely used
call s:ac('Folded', 'base00', 'NONE', 'NONE')
call s:ac('SpecialKey', 'blue', 'NONE', 'NONE')

call s:ac('WildMenu', 'blue', 'base02', 'NONE')
call s:ac('PmenuSbar', 'blue', 'base02', 'NONE')
