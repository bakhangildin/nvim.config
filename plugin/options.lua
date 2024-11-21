vim.filetype.add({
  extension = {
    templ = "templ"
  }
})

local opt = vim.opt

opt.tabstop = 4
opt.shiftwidth = 4
opt.smarttab = true
opt.smartindent = true

opt.list = true
opt.wrap = false
opt.number = true
opt.relativenumber = true

opt.signcolumn = "yes"
opt.colorcolumn = "80"

opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true

opt.splitbelow = true
opt.splitright = true

opt.swapfile = false
opt.backup = false
opt.undofile = true

vim.opt.cursorline = true
opt.termguicolors = true
opt.scrolloff = 4

vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("HighlightYank", {}),
  pattern = "*",
  callback = function()
    vim.highlight.on_yank {
      higroup = "IncSearch",
      timeout = 150,
    }
  end,
})
