local set = vim.keymap.set

set("i", "jj", "<ESC>")

set("v", "J", ":m '>+1<CR>gv=gv")
set("v", "K", ":m '<-2<CR>gv=gv")

set("n", "J", "mzJ`z")

set("n", "n", "nzzzv")
set("n", "N", "Nzzzv")

set("n", "<C-j>", "<cmd>cnext<CR>zz")
set("n", "<C-k>", "<cmd>cprev<CR>zz")

-- Toggle hlsearch if it's on, otherwise just do "enter"
set("n", "<CR>", function()
  ---@diagnostic disable-next-line: undefined-field
  if vim.v.hlsearch == 1 then
    vim.cmd.nohl()
    return ""
  else
    return 13
  end
end, { expr = true })

set("n", "<M-j>", "<c-w><c-j>")
set("n", "<M-k>", "<c-w><c-k>")
set("n", "<M-l>", "<c-w><c-l>")
set("n", "<M-h>", "<c-w><c-h>")
set("n", "<M-q>", "<c-w><c-q>")
set("n", "<M-,>", "<c-w>5<")
set("n", "<M-.>", "<c-w>5>")
set("n", "<M-+>", "<C-W>+")
set("n", "<M-->", "<C-W>-")
set("n", "<M-=>", "<C-W>=")

set("n", "<leader>bd", function()
  local bufnr = vim.api.nvim_get_current_buf()
  local bufs = vim.api.nvim_list_bufs()
  local opts = { force = false, unload = false }
  for i = 1, #bufs do
    if bufs[i] ~= bufnr then
      local _ = pcall(vim.api.nvim_buf_delete, bufs[i], opts)
    end
  end
end)

-- Terminal setup
vim.api.nvim_create_autocmd("TermOpen", {
  group = vim.api.nvim_create_augroup("custom-term-open", {}),
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.opt_local.scrolloff = 0
    vim.bo.filetype = "terminal"
  end,
})

set("t", "<esc><esc>", "<c-\\><c-n>")
set("t", "jj", "<c-\\><c-n>")
set("t", "<M-j>", "<c-\\><c-n><c-w><c-j>")
set("t", "<M-k>", "<c-\\><c-n><c-w><c-k>")
set("t", "<M-l>", "<c-\\><c-n><c-w><c-l>")
set("t", "<M-h>", "<c-\\><c-n><c-w><c-h>")
set("t", "<M-q>", "<c-\\><c-n><c-w><c-q>")


vim.keymap.set("n", "<leader>t", function()
  vim.cmd.new()
  vim.cmd.wincmd "J"
  vim.api.nvim_win_set_height(0, 14)
  vim.wo.winfixheight = true
  vim.cmd.term()
end)
