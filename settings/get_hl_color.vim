" Returns a color of an element in a group
function! GetHighlightTerm(group, elem)
   let groupHl = execute('hi ' . a:group)
   return matchstr(groupHl, a:elem.'=\zs\S*')
endfunction

