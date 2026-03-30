function toggle_quickfix()
  for _, win in ipairs(vim.fn.getwininfo()) do
    if win.quickfix == 1 then
      vim.cmd("cclose")
      return
    end
  end
  vim.cmd("copen")
end

vim.keymap.set('n', '<Leader>C', toggle_quickfix, { noremap = true, silent = true, desc = "Toggle quickfix" })

