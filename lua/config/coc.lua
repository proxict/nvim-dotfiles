vim.g.coc_config_home = '/etc/nvim/coc'

vim.keymap.set('i', '<Tab>', 'coc#pum#visible() ? coc#pum#next(1) : "\\<Tab>"', { noremap = true, silent = true, expr = true })
vim.keymap.set('i', '<S-Tab>', 'coc#pum#visible() ? coc#pum#prev(1) : "\\<S-Tab>"', { noremap = true, silent = true, expr = true })

vim.keymap.set('i', '<down>', 'coc#pum#visible() ? coc#pum#next(1) : "\\<down>"', { noremap = true, silent = true, expr = true })
vim.keymap.set('i', '<up>', 'coc#pum#visible() ? coc#pum#prev(1) : "\\<up>"', { noremap = true, silent = true, expr = true })

vim.keymap.set('i', '<C-j>', 'coc#pum#visible() ? coc#pum#next(1) : "\\<C-j>"', { noremap = true, silent = true, expr = true })
vim.keymap.set('i', '<C-k>', 'coc#pum#visible() ? coc#pum#prev(1) : "\\<C-k>"', { noremap = true, silent = true, expr = true })

vim.keymap.set('i', '<CR>', 'coc#pum#visible() ? coc#pum#confirm() : "\\<CR>"', { noremap = true, silent = true, expr = true })

if vim.fn.isdirectory('/etc/nvim/bundle/coc.nvim/build') == 0 then
    vim.fn['coc#util#install']()
end

