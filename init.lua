vim.g.pathogen_blacklist = {}
vim.cmd('execute pathogen#infect()')

local set = vim.opt

-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

set.backupdir = vim.env.HOME .. '/.cache/nvim/backup//'
set.directory = vim.env.HOME .. '/.cache/nvim/swap//'

-- Keep backward f search by remapping it to <Leader>;
vim.g.mapleader = ','
vim.keymap.set('n', '<Leader>;', ',', { noremap = true, silent = true })

-- Plugin settings
require('config.illuminate')
require('config.treesitter')
require('config.kanagawa')
require('config.nvim-tree')
require('config.lightline')
require('config.rustfmt')
require('config.telescope')
require('config.blankline')
require("config.treesitter-indent")
require("config.wordmotion")
require("config.lsp-config")

-- Other mappings and specific configuration
require("config.ag")
require("config.esc")
require('config.paste')
require('config.buffer-workflow')
require("config.code-format")
require("config.cppbuild")
require("config.window-split")

-- Allow project specific settings
set.exrc = true
set.ignorecase = true
set.smartcase = true
set.incsearch = true
set.showmatch = true
set.hlsearch = false

-- Disable auto-comment on new line for 'o' (:h fo-table)
vim.api.nvim_create_autocmd('FileType', {
    pattern = { '*' },
    group    = vim.api.nvim_create_augroup('FormatOptionsOverride', {}),
    callback = function() set.formatoptions = set.formatoptions - { 'o' } end
})

set.clipboard = 'unnamedplus'
set.termguicolors = true

set.wildignore = { '*.o', '*.a', '*.d', '*.so', '*.swp', '*.jpg', '*.png', '*.svg', '*.ttf', '*.pdf', '*.zip', '*.tar.gz', '*.bin' }
set.wildignore = set.wildignore + { '*/CMakeFiles/*', '*/build/*', '*/googletest/*' }

-- Add <> brackets to the list of matching pairs
set.matchpairs:append('<:>')
-- vim.g.loaded_matchparen = 1 -- consider setting this for some filetypes
vim.g.matchparen_timeout = 20 --ms
vim.g.matchparen_insert_timeout = 20 --ms

set.mouse = ""
set.background='dark'
set.showmode = true

-- vim's commandline autocompletion
set.wildmenu = true
set.wildmode = { 'longest', 'list' }
set.wildoptions = {}

-- Expands tabs to spaces
set.expandtab = true
-- 4 spaces for the \t character
set.tabstop = 4
-- 4 spaces for <Tab> key
set.softtabstop = 4
-- 4 spaces for >> key
set.shiftwidth = 4
set.shiftround = true

vim.wo.relativenumber = true
vim.wo.number = true
vim.wo.linebreak = true

-- When opening new file, don't close the current buffer, just hide it
set.hidden = true

-- Set the height of vim command line
set.cmdheight = 1

-- Always report changed lines (e.g. "1 line yanked")
set.report = 0

-- Always show statusline
set.laststatus = 2

-- Don't jump at the line start when moving around
set.startofline = false

set.splitright = true
set.cursorline = true

-- Set the number of suggestions in completion-menu
set.pumheight = 10

-- Keep cursor 5 lines above/below when scrolling
set.scrolloff = 5
set.sidescrolloff = 5

-- a: Decrease message size - avoids the utterly annoying 
-- "Press ENTER or type command to continue" message.
-- I: Also, don't show Vim help message on start.
vim.opt.shortmess = vim.opt.shortmess + { a = true, I = true }

vim.api.nvim_set_option('updatetime', 750)

-- Exclude quickfix from buffer list
vim.api.nvim_create_autocmd('FileType', {
    pattern = { 'qf' },
    group    = vim.api.nvim_create_augroup('qf', {}),
    callback = function() set.buflisted = false end
})

-- Use Ag! instead of Ag - disables opening of first result in a new bufer
vim.cmd('ca Ag Ag!')

-- Suda plugin
vim.cmd('command W w suda://%')

-- vim magic search
vim.keymap.set('n', '/', '/\\v', { noremap = true })
vim.keymap.set('v', '/', '/\\v', { noremap = true })

-- Case sensitive
vim.keymap.set('n', '*', '/\\C\\<<C-R>=expand(\'<cword>\')<CR>\\><CR>', { noremap = true })
vim.keymap.set('n', '#', '?\\C\\<<C-R>=expand(\'<cword>\')<CR>\\><CR>', { noremap = true })

-- Delete highlighted text into the void register, keeping the copy register untouched
vim.keymap.set('x', '<Leader>p', '"_dP', { noremap = true, silent = true })
vim.keymap.set('n', '<Leader>d', '"_d', { noremap = true, silent = true })
vim.keymap.set('v', '<Leader>d', '"_d', { noremap = true, silent = true })

vim.keymap.set('n', '<Leader>vc', ':execute "!git blame -L " . eval((line(".")-5)) . ",+10 %"<CR>', { noremap = true, silent = true })

-- Open the terminal with leader + Enter
vim.keymap.set('n', '<Leader><CR>', ':terminal<CR>', { noremap = true, silent = true })

-- Press ESC in terminal to exit the terminal mode
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { noremap = true, silent = true })

-- Reindent whole file
vim.keymap.set('n', '<Leader>ii', 'gg=G', { silent = true })

set.secure = true

-- Helptags
