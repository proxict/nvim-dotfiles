-- Open a new empty buffer
vim.keymap.set('n', '<Leader>T', ':enew<CR>', { noremap = false, silent = true, desc = "New empty buffer" })

local function alternate_buffers()
    vim.cmd('buffer ' .. vim.fn.bufnr('#'))
end

local function close_buffer()
    local current_buffer_index = vim.api.nvim_get_current_buf()
    alternate_buffers()
    vim.cmd('bdelete ' .. current_buffer_index)
end

-- Close the current buffer and move to the previous one
vim.keymap.set('n', '<Leader>bd', close_buffer, { noremap = false, silent = true, desc = "Close buffer" })

-- Switch to a previously active buffer
vim.keymap.set('n', '<Leader>bs', alternate_buffers, { noremap = false, silent = true, desc = "Last buffer" })

-- Easier scrolling navigation and back/forward navigation
vim.keymap.set('', '<C-j>', '<C-e>', { noremap = true, silent = true, desc = "Scroll down" })
vim.keymap.set('', '<C-k>', '<C-y>', { noremap = true, silent = true, desc = "Scroll up" })
vim.keymap.set('', '<C-h>', '<C-o>', { noremap = true, silent = true, desc = "Back" })
vim.keymap.set('', '<C-l>', '<C-i>', { noremap = true, silent = true, desc = "Forward" })

-- Move selected lines and automatically indent them
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { noremap = true, silent = true, desc = "Move selected line down and indent" })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { noremap = true, silent = true, desc = "Move selected line up and indent" })
vim.keymap.set('n', '<A-j>', ":m .+1<CR>==", { noremap = true, silent = true, desc = "Move line under cursor down and indent" })
vim.keymap.set('n', '<A-k>', ":m .-2<CR>==", { noremap = true, silent = true, desc = "Move line under cursor up and indent" })

-- Indent using tab
vim.keymap.set('n', '<Tab>', '>>_', { noremap = true, silent = true, desc = "Increase indent" })
vim.keymap.set('n', '<S-Tab>', '<<_', { noremap = true, silent = true, desc = "Decrease indent" })
vim.keymap.set('v', '<Tab>', '>gv', { noremap = true, silent = true, desc = "Increase indent" })
vim.keymap.set('v', '<S-Tab>', '<gv', { noremap = true, silent = true, desc = "Decrease indent" })
