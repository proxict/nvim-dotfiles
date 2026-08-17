local function search_rg(options, ...)
    local args = { ... }

    if #args == 0 then
        print("No arguments provided")
        return
    end

    local rg_args = {
        "rg",
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--column",
        "--trim",
    }

    -- Smart-case unless explicitly requesting case-sensitive search.
    if not options.case_sensitive then
        table.insert(rg_args, "--smart-case")
    else
        table.insert(rg_args, "--case-sensitive")
    end

    if options.raw then
        -- Raw mode: pass every argument separately to rg.
        -- This allows things like:
        -- :Sr -g !tests/* mypattern
        vim.list_extend(rg_args, args)
    else
        -- Normal mode: treat all arguments as one search pattern.
        --
        -- `--` tells rg that the following argument is the pattern,
        -- even if it starts with a dash.
        table.insert(rg_args, "--")
        table.insert(rg_args, table.concat(args, " "))
    end

    local result = vim.system(rg_args, {
        text = true,
    }):wait()

    -- rg returns:
    --   0 = matches found
    --   1 = no matches
    --   2 = error
    if result.code ~= 0 and result.code ~= 1 then
        vim.notify(
            "rg error: " .. (result.stderr or ""),
            vim.log.levels.ERROR
        )
        return
    end

    local lines = {}

    for line in (result.stdout or ""):gmatch("[^\r\n]+") do
        table.insert(lines, line)
    end

    vim.fn.setqflist({}, 'r', {
        title = 'Search results',
        lines = lines,
    })

    vim.api.nvim_command('copen')
end


-- Quick recursive search.
--
-- Everything after :S is treated as one search pattern.
--
-- Examples:
--   :S hello world
--   :S "hello world"
--   :S 'hello world'
--   :S foo "bar" 'baz'
vim.api.nvim_create_user_command('S', function(opts)
    search_rg({
        raw = false,
    }, unpack(opts.fargs))
end, {
    nargs = '+',
})


-- Case-sensitive version.
vim.api.nvim_create_user_command('Sc', function(opts)
    search_rg({
        raw = false,
        case_sensitive = true,
    }, unpack(opts.fargs))
end, {
    nargs = '+',
})


-- Raw search: arguments are passed directly to rg.
--
-- Examples:
--   :Sr -g !tests/* mypattern
--   :Sr -g '*.lua' "foo bar"
vim.api.nvim_create_user_command('Sr', function(opts)
    search_rg({
        raw = true,
    }, unpack(opts.fargs))
end, {
    nargs = '+',
})
