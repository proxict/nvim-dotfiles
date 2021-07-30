" set clipboard^=unnamed,unnamedplus
set clipboard=unnamedplus
" Use Ctrl-C to yank selection to clipboard
vnoremap <C-c> "+y
map <C-p> "+P

let g:clipboard = {
      \   'name': 'xsel_override',
      \   'copy': {
      \      '+': 'xsel --input --clipboard',
      \      '*': 'xsel --input --primary',
      \    },
      \   'paste': {
      \      '+': 'xsel --output --clipboard',
      \      '*': 'xsel --output --primary',
      \   },
      \   'cache_enabled': 1,
      \ }

autocmd VimLeave * call system("xsel -ib", getreg('+'))
