scriptencoding utf-8

let signColumnBgColor = GetHighlightTerm('SignColumn', 'ctermbg')
exe 'hi BookmarkSign ctermbg=' . signColumnBgColor . ' ctermfg=LightBlue'
exe 'hi BookmarkAnnotationSign ctermbg=' . signColumnBgColor . ' ctermfg=LightBlue'
let g:bookmark_sign = '⚑'
let g:bookmark_annotation_sign = '☰'
let g:bookmark_highlight_lines = 0

