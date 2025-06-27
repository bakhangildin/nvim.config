return {
  {
    "stevearc/oil.nvim",
    tag = "v2.13.0",
    dependencies = {
      { "nvim-tree/nvim-web-devicons", commit = "19d6211c78169e78bab372b585b6fb17ad974e82" },
    },
    config = function()
      require("oil").setup {
        columns = { "icon" },
        keymaps = {
          ["<C-h>"] = false,
          ["<C-l>"] = false,
          ["<C-k>"] = false,
          ["<C-j>"] = false,
          ["<M-h>"] = false,
        },
        view_options = {
          show_hidden = true,
        },
      }

      -- Open parent directory in current window
      vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
      vim.cmd ":command Ex Oil"
    end,
  },
}
