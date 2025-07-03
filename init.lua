vim.cmd("colorscheme habamax")

vim.g.mapleader = " "

if true then
  local nvim_venv_path = "/home/hangildin/.pyenv/versions/nvim_venv"
  if vim.loop.fs_stat(nvim_venv_path) then
    vim.env.PYENV_VERSION = "nvim_venv"
    vim.env.PYENV_ACTIVATE_SHELL = 1
    vim.env.PYENV_VIRTUAL_ENV = "/home/hangildin/.pyenv/versions/3.8.9/envs/nvim_venv"
    vim.env.VIRTUAL_ENV = "/home/hangildin/.pyenv/versions/3.8.9/envs/nvim_venv"
  end
end

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
