function! s:TogBG()
    let &background = ( &background == "dark"? "light" : "dark" )
    if exists("g:colors_name")
        exe "colorscheme " . g:colors_name
    endif
endfunction

if !exists(":ToggleBG")
    command ToggleBG :call s:TogBG()
endif

function! s:CheckStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

if !exists(":CheckStack")
    command CheckStack :call s:CheckStack()
endif
