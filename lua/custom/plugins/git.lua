return {
  {
    "tpope/vim-fugitive",
    commit = "593f831d6f6d779cbabb70a4d1e6b1b1936a88af",
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
