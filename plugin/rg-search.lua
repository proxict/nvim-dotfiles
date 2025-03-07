local function search_rg(raw, ...)
    local args = {...}
    if #args == 0 then
        print("No arguments provided for the S command")
        return
    end

    local rg_args = table.concat(args, " ")

    local handle = raw and
        io.popen("rg --color=never --no-heading --with-filename --column --smart-case --trim " .. rg_args) or
        io.popen("rg --color=never --no-heading --with-filename --column --smart-case --trim '" .. rg_args .. "'")

    local result = handle:read("*a")
    handle:close()

    local lines = {}
    for line in result:gmatch("[^\r\n]+") do
        table.insert(lines, line)
    end

    vim.fn.setqflist({}, 'r', {
        title = 'Search results',
        lines = lines,
    })

    vim.api.nvim_command('copen')
end

-- Quick recursive search (escaped pattern)
vim.api.nvim_create_user_command('S', function(opts)
    search_rg(false, unpack(opts.fargs))
end, { nargs = '*' })

-- Quick recursive search (raw, unescaped pattern, allowing passing additional flags to rg: `:Sr -g !tests/* mypattern`)
vim.api.nvim_create_user_command('Sr', function(opts)
    search_rg(true, unpack(opts.fargs))
end, { nargs = '*' })


