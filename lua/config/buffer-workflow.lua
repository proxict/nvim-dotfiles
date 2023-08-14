-- Open a new empty buffer
vim.api.nvim_set_keymap('n', '<Leader>T', ':enew<CR>', { noremap = false, silent = true })

-- List open buffers
vim.api.nvim_set_keymap('n', '<Leader>bl', ':CtrlPBuffer<CR>', { noremap = false, silent = true })

-- Move to the next buffer
vim.api.nvim_set_keymap('n', 'L', ':bnext<CR>', { noremap = false, silent = true })

-- Move to the previous buffer
vim.api.nvim_set_keymap('n', 'H', ':bprevious<CR>', { noremap = false, silent = true })

-- Close the current buffer and move to the previous one
vim.api.nvim_set_keymap('n', '<Leader>bd', ':bw<CR>', { noremap = false, silent = true })

-- Switch to a previously active buffer
vim.api.nvim_set_keymap('n', '<Leader>bs', ':b#<CR>', { noremap = false, silent = true })
