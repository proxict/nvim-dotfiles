require("vgit").setup({
    keymaps = {
        ['n <Leader>vg'] = function() require('vgit').buffer_diff_preview() end,
    },
    settings = {
        scene = {
            diff_preference = 'split',
        },
    },
})
