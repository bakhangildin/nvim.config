return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      'nvim-treesitter/playground',
      "vrischmann/tree-sitter-templ",
    },
    build = ":TSUpdate",
    lazy = false,
    config = function()
      do return end
      require("nvim-treesitter.configs").setup {
        auto_install = false,
        ensure_installed = {
          "lua",
          "query",
        },
        ignore_install = {},
        modules = {},
        sync_install = false,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
          disable = {
            "lua",
            "vimdoc",
          },
        },
      }
      vim.treesitter.language.register("vimdoc", "")
      -- Hide all semantic highlights
      -- for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
      --   vim.api.nvim_set_hl(0, group, {})
      -- end
    end,
  },
}
