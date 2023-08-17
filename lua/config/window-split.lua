-- Switching between split windows
vim.keymap.set('n', '<up>', '<C-w><up>', { noremap = true, silent = true })
vim.keymap.set('n', '<down>', '<C-w><down>', { noremap = true, silent = true })
vim.keymap.set('n', '<left>', '<C-w><left>', { noremap = true, silent = true })
vim.keymap.set('n', '<right>', '<C-w><right>', { noremap = true, silent = true })

-- Resizing split windows
vim.keymap.set('n', '<C-up>', '<C-w>+', { noremap = true, silent = true })
vim.keymap.set('n', '<C-down>', '<C-w>-', { noremap = true, silent = true })
vim.keymap.set('n', '<C-left>', '<C-w><', { noremap = true, silent = true })
vim.keymap.set('n', '<C-right>', '<C-w>>', { noremap = true, silent = true })
