return {
  "hrsh7th/nvim-cmp",
  commit = "be7bd4c",
  dependencies = {
    { "L3MON4D3/LuaSnip",         tag = "v2.3.0" },
    { "hrsh7th/cmp-buffer",       commit = "3022dbc" },
    { "hrsh7th/cmp-cmdline",      commit = "d250c63" },
    { "hrsh7th/cmp-nvim-lsp",     commit = "39e2eda" },
    { "hrsh7th/cmp-path",         commit = "91ff86c" },
    { "onsails/lspkind.nvim",     commit = "a700f14" },
    { "saadparwaiz1/cmp_luasnip", commit = "98d9cb5" },
  },
  config = function()
    require "custom.completion"
  end,
}
