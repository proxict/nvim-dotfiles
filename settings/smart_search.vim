nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set incsearch
set showmatch
set nohlsearch

" clear search results on ESC double press
"nnoremap <silent> <esc> :let @/ = ""<return><esc>
"nnoremap <silent> <esc>^[ <esc>^[

" Case sensitive
nnoremap * /\C\<<C-R>=expand('<cword>')<CR>\><CR>
nnoremap # ?\C\<<C-R>=expand('<cword>')<CR>\><CR>
