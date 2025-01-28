local lspconfig = require('lspconfig')

local capabilities = require("cmp_nvim_lsp").default_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = false

local servers = { 'clangd', 'rust_analyzer', 'bashls', 'pyright', 'cmake' }
for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
        on_attach = function(client)
            -- :help vim.lsp.semantic_tokens.start()
            client.server_capabilities.semanticTokensProvider = nil
        end,
        capabilities = capabilities,
    }
end

-- Add rounded borders to floating windows
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
    opts = opts or {}
    opts.border = opts.border or 'rounded'
    return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

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
        end
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

vim.fn.sign_define("DiagnosticSignError",  {text = '', texthl = "DiagnosticSignError"})
vim.fn.sign_define("DiagnosticSignWarn",   {text = '',  texthl = "DiagnosticSignWarn"})
vim.fn.sign_define("DiagnosticSignInfo",   {text = '',  texthl = "DiagnosticSignInfo"})
vim.fn.sign_define("DiagnosticSignHint",   {text = '',  texthl = "DiagnosticSignHint"})
vim.fn.sign_define("DiagnosticSignOther",   {text = '',  texthl = "DiagnosticSignOther"})

vim.cmd [[
hi DiagnosticUnderlineError guisp='Red' gui=underline
hi DiagnosticUnderlineWarn guisp='Cyan' gui=undercurl
]]

vim.diagnostic.config({
    update_in_insert = false,
    virtual_text = false,
    float = { border = 'rounded' },
    undercurl = true,
    signs = {
        priority = 30,
    }
})

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

