-- https://vim.fandom.com/wiki/Avoid_scrolling_when_switch_buffers

local function AutoSaveWinView()
vim.cmd[[
    if !exists('w:SavedBufView')
        let w:SavedBufView = {}
    endif
    let w:SavedBufView[bufnr('%')] = winsaveview()
]]
end

local function AutoRestoreWinView()
vim.cmd[[
    let buf = bufnr('%')
    if exists('w:SavedBufView') && has_key(w:SavedBufView, buf)
        let v = winsaveview()
        let atStartOfFile = v.lnum == 1 && v.col == 0
        if atStartOfFile && !&diff
            call winrestview(w:SavedBufView[buf])
        endif
        unlet w:SavedBufView[buf]
    endif
]]
end

local view_storage_group = vim.api.nvim_create_augroup('preserve-view', {})

vim.api.nvim_create_autocmd('BufLeave', {
    pattern = '*',
    group    = view_storage_group,
    callback = AutoSaveWinView
})

vim.api.nvim_create_autocmd('BufEnter', {
    pattern = '*',
    group    = view_storage_group,
    callback = AutoRestoreWinView
})
