local sorters = require('telescope.sorters')

require("telescope").setup({
    defaults = {
        vimgrep_arguments = {
            'rg',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case',
            '--trim'
        },
        sorter = sorters.get_generic_fuzzy_sorter(),
    },
    pickers = {
        find_files = {
            hidden = false,
            find_command = { 'fd', '--type', 'file', '--strip-cwd-prefix', '--max-depth=15' },
            -- previewer = false,
        }
    }
})

