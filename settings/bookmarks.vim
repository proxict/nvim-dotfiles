scriptencoding utf-8

call CopyHighlightArgs('SignColumn', 'BookmarkSign', 'ctermbg')
call CopyHighlightArgs('SignColumn', 'BookmarkAnnotationSign', 'ctermbg')
highlight BookmarkSign ctermfg=LightBlue
highlight BookmarkAnnotationSign ctermfg=LightBlue

let g:bookmark_sign = '⚑'
let g:bookmark_annotation_sign = '☰'
let g:bookmark_highlight_lines = 0

