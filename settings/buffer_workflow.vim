" To open a new empty buffer
nmap <leader>T :enew<cr>

" List open buffers
nmap <leader>bl :CtrlPBuffer<cr>

" List most recently used files
nmap <leader>br :CtrlPMRU<cr>

" Move to the next buffer
nmap L :bnext<CR>

" Move to the previous buffer
nmap H :bprevious<CR>

" Close the current buffer and move to the previous one
nmap <leader>bd :bw<CR>

" Switch to a previously active buffer
nmap <leader>bs :b#<CR>

