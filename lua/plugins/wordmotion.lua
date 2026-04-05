return {
    'chaoren/vim-wordmotion',
    version = '*',
    init = function()
        vim.g.wordmotion_spaces = { '_' }
        vim.g.wordmotion_uppercase_spaces = { '-', '.', ',', '<', '>', '(', ')', '[', ']', '{', '}', '&', '*', '=', '!', '+', ';', ':', '"' }
    end,
}
