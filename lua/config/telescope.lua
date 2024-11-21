local sorters = require('telescope.sorters')

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
    if vim.fn.executable("fd") == 0 then
        print("Command `fd` not found")
        return nil
    end

    local result = vim.system({ "fd", "--version", }, { text = true }):wait()
    if result.code ~= 0 then
        print("Command `fd --version` failed")
        return nil
    end

    local version = vim.version.parse(vim.split(result.stdout or "", " ")[2])
    if not version then
        return nil
    end

    return version.major, version.minor, version.minor
end

local major, minor, _patch = get_fd_version()
if major ~= nil and minor ~= nil and major >= 8 and minor >= 3 then
    table.insert(fd_command, '--strip-cwd-prefix')
end

require("telescope").setup({
    defaults = {
        scroll_strategy = 'limit',
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
        mappings = {
            n = {
                ['p'] = require('telescope.actions.layout').toggle_preview
            },
            i = {
                ["<C-q>"] = require('telescope.actions').send_to_qflist + require('telescope.actions').open_qflist
            }
        },
        preview = {
            hide_on_startup = true,
            treesitter = true,
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

local function LoadFzfExtension()
    require("telescope").setup({
        extensions = {
            fzf = {
                fuzzy = true,                    -- false will only do exact matching
                override_generic_sorter = true,  -- override the generic sorter
                override_file_sorter = true,     -- override the file sorter
                case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                -- the default case_mode is "smart_case"
            }
        }
    })
    require('telescope').load_extension('fzf')
end

if vim.fn.isdirectory('/etc/nvim/bundle/telescope-fzf-native.nvim/build') == 0 then
    local job = vim.fn.jobstart('cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build', {
        cwd = '/etc/nvim/bundle/telescope-fzf-native.nvim/',
        on_exit = LoadFzfExtension,
    })
    -- TODO: Make this async
    vim.fn.jobwait({ job })
else
    LoadFzfExtension()
end

vim.keymap.set('n', '<Leader>t', ':Telescope find_files<CR>', { silent = true })
vim.keymap.set('n', '<Leader>B', ':Telescope buffers<CR>', { silent = true })
vim.keymap.set('n', '<Leader>S', ':Telescope live_grep<CR>', { silent = true })
