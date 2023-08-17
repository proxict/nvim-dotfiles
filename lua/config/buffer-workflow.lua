-- Open a new empty buffer
vim.keymap.set('n', '<Leader>T', ':enew<CR>', { noremap = false, silent = true })

-- List open buffers
vim.keymap.set('n', '<Leader>bl', ':CtrlPBuffer<CR>', { noremap = false, silent = true })

-- Move to the next buffer
vim.keymap.set('n', 'L', ':bnext<CR>', { noremap = false, silent = true })

-- Move to the previous buffer
vim.keymap.set('n', 'H', ':bprevious<CR>', { noremap = false, silent = true })

-- Close the current buffer and move to the previous one
vim.keymap.set('n', '<Leader>bd', ':bw<CR>', { noremap = false, silent = true })

-- Switch to a previously active buffer
vim.keymap.set('n', '<Leader>bs', ':b#<CR>', { noremap = false, silent = true })

-- Easier scrolling navigation and back/forward navigation
vim.keymap.set('', '<C-j>', '<C-e>', { noremap = true, silent = true })
vim.keymap.set('', '<C-k>', '<C-y>', { noremap = true, silent = true })
vim.keymap.set('', '<C-h>', '<C-o>', { noremap = true, silent = true })
vim.keymap.set('', '<C-l>', '<C-i>', { noremap = true, silent = true })

-- Move selected lines and automatically indent them
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

-- Indent using tab
vim.keymap.set('n', '<Tab>', '>>_', { noremap = true, silent = true })
vim.keymap.set('n', '<S-Tab>', '<<_', { noremap = true, silent = true })
vim.keymap.set('v', '<Tab>', '>gv', { noremap = true, silent = true })
vim.keymap.set('v', '<S-Tab>', '<gv', { noremap = true, silent = true })
