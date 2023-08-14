vim.g.pathogen_blacklist = {}
vim.cmd('execute pathogen#infect()')

-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Keep backward f search, remapping it to <Leader>;
vim.g.mapleader = ','
vim.api.nvim_set_keymap('n', '<Leader>;', ',', { noremap = true, silent = true })

require('config.illuminate')
require('config.treesitter')
require('config.kanagawa')
require('config.nvim-tree')
require('config.ale')
require('config.buffer-workflow')
require('config.paste')
require('config.lightline')
require('config.rustfmt')
require('config.telescope')

local set = vim.opt

-- Allow project specific settings via .nvimrc
set.exrc = true
set.ignorecase = true
set.smartcase = true
set.incsearch = true
set.showmatch = true
set.hlsearch = false

-- Disable auto-comment on new line
set.formatoptions = set.formatoptions - { 'c', 'r', 'o' }

set.completeopt = set.completeopt - { 'preview' }

set.listchars = { eol = '↵', space = '•', tab = '▸ ', extends = '❯', precedes = '❮', nbsp = '±' }

vim.api.nvim_set_keymap('i', '<Tab>', 'coc#pum#visible() ? coc#pum#next(1) : "\\<Tab>"', { noremap = true, silent = true, expr = true })
vim.api.nvim_set_keymap('i', '<S-Tab>', 'coc#pum#visible() ? coc#pum#prev(1) : "\\<S-Tab>"', { noremap = true, silent = true, expr = true })

vim.api.nvim_set_keymap('i', '<down>', 'coc#pum#visible() ? coc#pum#next(1) : "\\<down>"', { noremap = true, silent = true, expr = true })
vim.api.nvim_set_keymap('i', '<up>', 'coc#pum#visible() ? coc#pum#prev(1) : "\\<up>"', { noremap = true, silent = true, expr = true })

vim.api.nvim_set_keymap('i', '<C-j>', 'coc#pum#visible() ? coc#pum#next(1) : "\\<C-j>"', { noremap = true, silent = true, expr = true })
vim.api.nvim_set_keymap('i', '<C-k>', 'coc#pum#visible() ? coc#pum#prev(1) : "\\<C-k>"', { noremap = true, silent = true, expr = true })

vim.api.nvim_set_keymap('i', '<CR>', 'coc#pum#visible() ? coc#pum#confirm() : "\\<CR>"', { noremap = true, silent = true, expr = true })

-- augroup CppBuild
-- autocmd FileType c,cpp command! Build :copen | :AsyncRun cmake --build $(VIM_ROOT)/build
-- augroup end
vim.api.nvim_create_autocmd('FileType', {
    pattern = { 'c', 'cpp' },
    group    = vim.api.nvim_create_augroup('CppBuild', {}),
    callback = function()
        vim.cmd[[
            command! Build :copen | :AsyncRun cmake --build $(VIM_ROOT)/build --parallel $(nproc)
        ]]
    end
})

-- Exclude quickfix from buffer list
vim.api.nvim_create_autocmd('FileType', {
    pattern = { 'qf' },
    group    = vim.api.nvim_create_augroup('qf', {}),
    callback = function() set.buflisted = false end
})

-- ESC in these filetypes will close them
vim.api.nvim_create_autocmd('FileType', {
    pattern = { 'qf', 'help', 'NvimTree', 'preview', 'ale-preview', 'ale-preview.message', 'ale-preview-selection' },
    group    = vim.api.nvim_create_augroup('EscFileTypeQuit', {}),
    callback = function()
        local buf_index = vim.api.nvim_get_current_buf()
        vim.api.nvim_buf_set_keymap(buf_index, 'n', '<Esc>', ':quit<CR>', { noremap = true, silent = true })
    end
})

-- Code formatting
local CodeFormatGroup = vim.api.nvim_create_augroup('CodeFormat', {})
vim.api.nvim_create_autocmd('FileType', {
    pattern = { 'c', 'cpp' },
    group    = CodeFormatGroup,
    callback = function()
        local buf_index = vim.api.nvim_get_current_buf()
        vim.api.nvim_buf_set_keymap(buf_index, 'n', '<Leader>cf', ':ClangFormat<CR>', { noremap = true, silent = true })
    end
})
vim.api.nvim_create_autocmd('FileType', {
    pattern = { 'rust' },
    group    = CodeFormatGroup,
    callback = function()
        local buf_index = vim.api.nvim_get_current_buf()
        vim.api.nvim_buf_set_keymap(buf_index, 'n', '<Leader>cf', ':Rustfmt<CR>', { noremap = true, silent = true })
    end
})

-- Use Ag! instead of Ag - disables opening of first result in a new bufer
vim.cmd('ca Ag Ag!')

-- Suda plugin
vim.cmd('command W w suda://%')

-- vim magic search
vim.api.nvim_set_keymap('n', '/', '/\\v', { noremap = true })
vim.api.nvim_set_keymap('v', '/', '/\\v', { noremap = true })

-- Case sensitive
vim.api.nvim_set_keymap('n', '*', '/\\C\\<<C-R>=expand(\'<cword>\')<CR>\\><CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '#', '?\\C\\<<C-R>=expand(\'<cword>\')<CR>\\><CR>', { noremap = true })

-- Switching between split windows
vim.api.nvim_set_keymap('n', '<up>', '<C-w><up>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<down>', '<C-w><down>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<left>', '<C-w><left>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<right>', '<C-w><right>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<C-up>', '<C-w>+', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-down>', '<C-w>-', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-left>', '<C-w><', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-right>', '<C-w>>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<Tab>', '>>_', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-Tab>', '<<_', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<Tab>', '>gv', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<S-Tab>', '<gv', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<Leader>vc', ':execute "!git blame -L " . eval((line(".")-5)) . ",+10 %"<CR>', { noremap = true, silent = true })

vim.g.coc_config_home = '/etc/nvim/settings'

if not vim.fn.isdirectory('/etc/nvim/bundle/coc.nvim/build') then
    vim.fn['coc#util#install']()
end

set.clipboard = 'unnamedplus'
set.termguicolors = true

set.backupdir = vim.env.HOME .. '/.cache/nvim/backup//'
set.directory = vim.env.HOME .. '/.cache/nvim/swap//'

set.wildignore = { '*.o', '*.a', '*.d', '*.so', '*.swp', '*.jpg', '*.png', '*.svg', '*.ttf', '*.pdf', '*.zip', '*.tar.gz', '*.bin' }
set.wildignore = set.wildignore + { '*/CMakeFiles/*', '*/build/*', '*/googletest/*' }

-- vim.o.NERDTreeIgnore = {'.o$', '.a$'}

-- Add <> brackets to the list of matching pairs
set.matchpairs:append('<:>')

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

-- NvimTree
vim.api.nvim_set_keymap('n', '<Leader>f', ':NvimTreeToggle<CR>', { silent = true })

-- Telescope
vim.api.nvim_set_keymap('n', '<Leader>ss', ':Telescope find_files<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<Leader>t', ':Telescope find_files<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<Leader>sb', ':Telescope buffers<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<Leader>sg', ':Telescope live_grep<CR>', { silent = true })

-- w0rp/ale
vim.api.nvim_set_keymap('n', '<Leader>gd', ':ALEGoToDefinition<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<Leader>i', ':ALEDetail<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<Leader>r', ':ALEFindReferences<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<Leader>w', ':ALEHover<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<Leader>e', ':lopen<CR>', { silent = true })

-- Open the terminal with leader + Enter
vim.api.nvim_set_keymap('n', '<Leader><CR>', ':terminal<CR>', { noremap = true, silent = true })

-- Press ESC in terminal to exit the terminal mode
vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', { noremap = true, silent = true })

-- Easier scrolling navigation and back/forward navigation
vim.api.nvim_set_keymap('', '<C-j>', '<C-e>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('', '<C-k>', '<C-y>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('', '<C-h>', '<C-o>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('', '<C-l>', '<C-i>', { noremap = true, silent = true })

-- Toggle whitespaces visibility
vim.api.nvim_set_keymap('n', '<Leader>lw', ':set list!<CR>', { silent = true })

-- Reindent whole file
vim.api.nvim_set_keymap('n', '<Leader>ii', 'gg=G', { silent = true })

vim.g['wordmotion_spaces'] = { '_' }
vim.g['wordmotion_uppercase_spaces'] = { '-', '.', ',', '<', '>', '(', ')', '[', ']', '{', '}', '&', '*', '=', '!', '+', ';', ':', '"' }

-- Start searching in project root instead of in CWD
vim.g['ag_working_path_mode'] = 'r'

-- Disable default Ag mappings
vim.g['ag_apply_qmappings'] = 0


vim.opt.completeopt = { 'menuone', 'noselect', 'noinsert' }

-- a: Decrease message size - avoids the utterly annoying 
-- "Press ENTER or type command to continue" message.
-- I: Also, don't show Vim help message on start.
vim.opt.shortmess = vim.opt.shortmess + { a = true, I = true }

vim.api.nvim_set_option('updatetime', 750)

set.secure = true

-- Helptags
