return {
  {
    "tpope/vim-fugitive",
    commit = "61b51c09b7c9ce04e821f6cf76ea4f6f903e3cf4",
    config = function()
      vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    commit = "17ab794b6fce6fce768430ebc925347e349e1d60",
    config = function()
      require("gitsigns").setup()
    end,
  },
}
