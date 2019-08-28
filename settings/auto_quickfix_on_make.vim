" Automatically open, but do not go to (if there are errors) the quickfix /
" location list window, or close it when is has become empty.
"
" Note: Must allow nesting of autocmds to enable any customizations for quickfix
" buffers.
" Note: Normally, :cwindow jumps to the quickfix window if the command opens it
" (but not if it's already open). However, as part of the autocmd, this doesn't
" seem to happen.
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

" see the current error
nmap <leader>cc :cc<CR>

" jump to next error
nmap <leader>cn :cn<CR>

" jump to previous error
nmap <leader>cp :cp<CR>

" list all errors
nmap <leader>cl :clist<CR>

