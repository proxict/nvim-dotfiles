vim.opt.listchars = { eol = '↵', space = '•', tab = '▸ ', extends = '❯', precedes = '❮', nbsp = '±' }
vim.keymap.set('n', '<Leader>lw', ':set list!<CR>', { silent = true, desc = "Toggle whitespaces" })
