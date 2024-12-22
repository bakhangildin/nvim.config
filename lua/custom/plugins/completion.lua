return {
  "hrsh7th/nvim-cmp",
  commit = "be7bd4c",
  dependencies = {
    { "L3MON4D3/LuaSnip",             tag = "v2.3.0" },
    { "hrsh7th/cmp-buffer",           commit = "3022dbc" },
    { "hrsh7th/cmp-cmdline",          commit = "d250c63" },
    { "hrsh7th/cmp-nvim-lsp",         commit = "39e2eda" },
    { "hrsh7th/cmp-path",             commit = "91ff86c" },
    { "onsails/lspkind.nvim",         commit = "a700f14" },
    { "saadparwaiz1/cmp_luasnip",     commit = "98d9cb5" },
    { "rafamadriz/friendly-snippets", commit = "de8fce9" },
  },
  config = function()
    vim.opt.completeopt = { "menu", "menuone", "noselect" }
    vim.opt.shortmess:append "c"

    local lspkind = require("lspkind")
    local cmp = require("cmp")
    local luasnip = require("luasnip")

    cmp.setup({
      completion = {
        autocomplete = false,
      },
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = {
        ["<C-space>"] = cmp.mapping.complete {},
        ["<C-n>"] = cmp.mapping.select_next_item {},
        ["<C-p>"] = cmp.mapping.select_prev_item {},
        ["<C-y>"] = cmp.mapping(
          cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          },
          { "i", "c" }
        ),
      },
      sources = cmp.config.sources({
        { name = "nvim_lsp_signature_help" },
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
      }, {
        { name = 'buffer' },
      }),
      ---@diagnostic disable-next-line: missing-fields
      formatting = {
        format = lspkind.cmp_format({
          mode = "text_symbol",
        }),
      },
    })

    vim.keymap.set({ "i", "s" }, "<c-k>", function()
      if luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      end
    end, { silent = true })

    vim.keymap.set({ "i", "s" }, "<c-j>", function()
      if luasnip.jumpable(-1) then
        luasnip.jump(-1)
      end
    end, { silent = true })

    -- require("luasnip.loaders.from_vscode").lazy_load()
  end,
}
