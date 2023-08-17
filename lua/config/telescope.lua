local sorters = require('telescope.sorters')
local utils = require("telescope.utils")

local fd_command = { 'fd', '--type', 'file', '--max-depth=15' }

local function split(inputstr, sep)
    if sep == nil then
        sep = "%s"
    end
    local t={}
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        table.insert(t, str)
    end
    return t
end

local function get_fd_version()
    local stdout, ret, _ = utils.get_os_command_output({ "fd", "--version", })
    
    if ret ~= 0 or #stdout ~= 1 then
        print("Command `fd --version` failed")
        return nil
    end

    fd_version = split(stdout[1], ' ')
    if #fd_version ~= 2 then
        return nil
    end

    local version_parts = split(fd_version[2], '.')
    if #version_parts ~= 3 then
        return nil
    end

    return tonumber(version_parts[1]), tonumber(version_parts[2]), tonumber(version_parts[3])
end

local major, minor, patch = get_fd_version()
if major ~= nil and minor ~= nil and major >= 8 and minor >= 3 then
    table.insert(fd_command, '--strip-cwd-prefix')
end

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
            find_command = fd_command,
            -- previewer = false,
        }
    }
})

vim.keymap.set('n', '<Leader>ss', ':Telescope find_files<CR>', { silent = true })
vim.keymap.set('n', '<Leader>t', ':Telescope find_files<CR>', { silent = true })
vim.keymap.set('n', '<Leader>sb', ':Telescope buffers<CR>', { silent = true })
vim.keymap.set('n', '<Leader>sg', ':Telescope live_grep<CR>', { silent = true })
