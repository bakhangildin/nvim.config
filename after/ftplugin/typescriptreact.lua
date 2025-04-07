vim.opt_local.tabstop = 4
vim.opt_local.shiftwidth = 4

vim.api.nvim_create_user_command("TSOrganizeImports", function()
  vim.lsp.buf.execute_command({
    command = "_typescript.organizeImports",
    arguments = {
      vim.api.nvim_buf_get_name(0),
    }
  })
end, { nargs = "?" })
