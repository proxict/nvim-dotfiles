" git blame around cursor
nnoremap <silent> <Leader>vc :execute "!git blame -L " . eval((line(".")-5)) . ",+10 %"<CR>
