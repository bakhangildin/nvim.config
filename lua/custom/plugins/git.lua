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
    commit = "1b0350ab707713b2bc6c236151f1a324175347b1",
    config = function()
      require("gitsigns").setup()
    end,
  },
}
