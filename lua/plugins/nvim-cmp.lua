return {
    "hrsh7th/nvim-cmp",
    -- load cmp on InsertEnter
    event = "InsertEnter",
    -- these dependencies will only be loaded when cmp loads
    -- dependencies are always lazy-loaded unless specified otherwise
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-nvim-lsp-signature-help",
    },
    config = function()
        local cmp = require 'cmp'
        cmp.setup {
            formatting = {
                format = function(entry, vim_item)
                    local icons = {
                        Text = '',
                        Method = '󰊕',
                        Function = '󰊕',
                        Constructor = '󰊕',
                        Field = '',
                        Variable = '',
                        Class = '',
                        Interface = '',
                        Module = '󰅩',
                        Property = '',
                        Unit = '󰕤',
                        Value = '',
                        Enum = '',
                        Keyword = '',
                        Snippet = '',
                        Color = '',
                        File = '',
                        Reference = '󰪍',
                        Folder = '',
                        EnumMember = '',
                        Constant = '',
                        Struct = '',
                        Event = '',
                        Operator = '',
                        TypeParameter = ''
                    }

                    vim_item.kind = string.format('%s %s', icons[vim_item.kind], vim_item.kind)

                    vim_item.menu = ({
                        path = '',
                        buffer = '󰈙',
                        nvim_lsp = '',
                    })[entry.source.name]

                    return vim_item
                end,
            },
            window = {
                completion = cmp.config.window.bordered({
                    border = 'rounded',
                    scrollbar = '║',
                }),
                documentation = cmp.config.window.bordered({
                    border = 'rounded',
                    scrollbar = '║',
                }),
            },
            snippet = {},
            mapping = cmp.mapping.preset.insert({
                ['<C-u>'] = cmp.mapping.scroll_docs(-4), -- Up
                ['<C-d>'] = cmp.mapping.scroll_docs(4), -- Down
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<CR>'] = cmp.mapping.confirm {
                    behavior = cmp.ConfirmBehavior.Replace,
                    select = false,
                },
                ['<C-j>'] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    else
                        fallback()
                    end
                end, { 'i', 's' }),
                ['<C-K>'] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    else
                        fallback()
                    end
                end, { 'i', 's' }),
            }),
            sources = {
                { name = 'nvim_lsp' },
                { name = 'buffer' },
                { name = 'path' },
                { name = 'nvim_lsp_signature_help' },
            },
        }

        vim.opt.completeopt = { 'menuone', 'noselect', 'noinsert' }

        vim.api.nvim_create_autocmd('LspAttach', {
            group = vim.api.nvim_create_augroup('UserLspConfig', {}),
            callback = function(ev)
                -- Enable completion triggered by <c-x><c-o>
                vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

                -- Buffer local mappings.
                -- See `:help vim.lsp.*` for documentation on any of the below functions
                local opts = { buffer = ev.buf }
                --vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
                vim.keymap.set('n', '<Leader>gd', vim.lsp.buf.definition, opts)
                vim.keymap.set('n', '<Leader>w', vim.lsp.buf.hover, opts)
                vim.keymap.set('n', '<Leader>rf', vim.lsp.buf.references, opts)
                vim.keymap.set('n', '<Leader>rn', vim.lsp.buf.rename, opts)
                vim.keymap.set('n', '<Leader>e', function()
                    local float = vim.diagnostic.config().float
                    if float then
                        local config = type(float) == "table" and float or {}
                        config.scope = "line"
                        vim.diagnostic.open_float(config)
                    end
                end, opts)
                vim.keymap.set('n', '<Leader>E', function() require("trouble").toggle() end, opts)

                --vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
                --vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
                --vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
                --vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
                --vim.keymap.set('n', '<space>wl', function()
                --    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                --end, opts)
                --vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
                --vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
                --vim.keymap.set('n', '<space>f', function()
                --    vim.lsp.buf.format { async = true }
                --end, opts)
            end,
        })
    end,
}
