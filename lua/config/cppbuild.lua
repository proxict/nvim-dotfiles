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

vim.opt.listchars = { eol = '↵', space = '•', tab = '▸ ', extends = '❯', precedes = '❮', nbsp = '±' }
