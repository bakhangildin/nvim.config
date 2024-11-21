return {
  {
    "neovim/nvim-lspconfig",
    tag = "v1.0.0",
    dependencies = {
      { "folke/neodev.nvim",                         tag = "v3.0.0" },

      { "stevearc/conform.nvim",                     tag = "v7.1.0" },

      { "williamboman/mason.nvim",                   tag = "v1.10.0" },
      { "williamboman/mason-lspconfig.nvim",         tag = "v1.31.0" },
      { "WhoIsSethDaniel/mason-tool-installer.nvim", commit = "c5e07b8" },

      -- "b0o/SchemaStore.nvim",
      --"j-hui/fidget.nvim",
    },
    config = function()
      require "custom.lsp"
    end,
  },
}
