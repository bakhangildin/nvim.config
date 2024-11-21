vim.g.mapleader = " "

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", "--branch=v11.14.2", lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup(
  {
    import = "custom/plugins",
  },
  {
    change_detection = {
      notify = false,
    },
  })
