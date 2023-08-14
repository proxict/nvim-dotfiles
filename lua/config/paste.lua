vim.opt.pastetoggle='<F2>'
vim.api.nvim_set_keymap('n', '<F2>', ':set invpaste paste?<CR>', { silent = true, noremap = true })
