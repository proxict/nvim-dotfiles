nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch

" clear search results on ESC double press
nnoremap <silent> <esc> :let @/ = ""<return><esc>
nnoremap <silent> <esc>^[ <esc>^[

