return {
    'lambdalisue/vim-suda',
    version = '*',
    lazy = false,
    config = function()
        vim.cmd('command W w suda://%')
    end,
}
