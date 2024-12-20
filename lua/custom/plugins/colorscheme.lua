return {
  {
    "tjdevries/colorbuddy.nvim",
    commit = "8b968581e5c19d22a861d5f3fe5dbd83394fa681",
    enabled = false,
    config = function()
      vim.cmd.colorscheme "gruvbuddy"

      local bg = "#222222"
      vim.api.nvim_set_hl(0, "Normal", { bg = bg, fg = "#dddddd" })
      vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#303030" })
      vim.api.nvim_set_hl(0, "LineNr", { bg = bg })
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#181818" })
      vim.api.nvim_set_hl(0, "DiagnosticUnnecessary", { link = "DiagnosticUnnecessary" })
    end,
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        style = "storm",
        transparent = true,
        terminal_colors = true,
        styles = {
          comments = { italic = false },
          keywords = { italic = false },
        },
      })
      vim.cmd([[colorscheme tokyonight]])
    end,
  },
}
