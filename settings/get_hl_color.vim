" Returns a dictionary of colors for the specified group
function! GetHighlight(group)
  let output = execute('hi ' . a:group)
  let list = split(output, '\s\+')
  let dict = {}
  for item in list
    if match(item, '=') > 0
      let splited = split(item, '=')
      let dict[splited[0]] = splited[1]
    endif
  endfor
  return dict
endfunction

" Copies the highlight settings from one group to another
function! CopyHighlight(from, to)
    for [key, value] in items(GetHighlight(a:from))
        exe 'hi ' . a:to . ' ' . key . '=' . value
    endfor
endfunction

function! CopyHighlightArgs(from, to, arg, ...)
    let highlightDict = GetHighlight(a:from)
    for key in a:000 + [a:arg]
        exe 'hi ' . a:to . ' ' . key . '=' . highlightDict[key]
    endfor
endfunction
