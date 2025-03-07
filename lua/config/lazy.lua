-- Bootstrap lazy.nvim
local confpath = vim.fn.stdpath("config")
local lazypath = confpath .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = ","
vim.g.maplocalleader = "\\"

-- Keep backward f search by remapping it to <Leader>;
vim.keymap.set('n', '<Leader>;', ',', { noremap = true, silent = true })

-- Setup lazy.nvim
require("lazy").setup({
  root = confpath .. "/lazy/lazy-plugins",
  lockfile = confpath .. "/lazy/lazy-lock.json",
  spec = {
    -- import your plugins
    { import = "plugins" },
  },
  pkg = {
    cache = confpath .. "/lazy/pkg-cache.lua",
  },
  rocks = {
    root = confpath .. "/lazy/lazy-rocks",
  },
  readme = {
    root = confpath .. "/lazy/readme",
  },
  state = confpath .. "/lazy/state.json",
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "nordic" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})
