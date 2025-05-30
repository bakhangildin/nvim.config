local cmd = "MakeTerminals"
pcall(vim.api.nvim_del_user_command, cmd)
vim.api.nvim_create_user_command("MakeTerminals", function(args)
  local str = args.args
  if str == "" then
    str = "3"
  end
  -- print("got args" .. vim.inspect(args))
  local n = tonumber(str)
  print("got n", n)

  vim.cmd(":tabnew +:term")
  for _ = 1, n - 1 do
    vim.cmd(":sp +:term")
  end
end, { nargs = "?" })
