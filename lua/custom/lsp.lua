require("neodev").setup {}
require("mason").setup {}

local conform = require("conform")
conform.setup {
  formatters_by_ft = {
    go = { "goimports" },
    python = { "isort", "autopep8" },
    javascript = { "prettierd" },
    typescript = { "prettierd" },
    javascriptreact = { "prettierd" },
    typescriptreact = { "prettierd" },
  }
}

vim.diagnostic.config {
  float = {
    focusable = false,
    style = "minimal",
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
  },
}

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("LspGroup", {}),
  callback = function(args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id), "must have valid client")
    client.server_capabilities.semanticTokensProvider = nil

    vim.opt_local.omnifunc = "v:lua.vim.lsp.omnifunc"

    local set = vim.keymap.set

    set("n", "gd", vim.lsp.buf.definition)
    set("n", "gr", vim.lsp.buf.references)
    set("n", "gD", vim.lsp.buf.declaration)
    set("n", "gT", vim.lsp.buf.type_definition)
    set("n", "K", vim.lsp.buf.hover)
    set("i", "<C-h>", vim.lsp.buf.signature_help)

    set("n", "[d", vim.diagnostic.goto_next)
    set("n", "]d", vim.diagnostic.goto_prev)
    set("n", "<leader>dq", vim.diagnostic.setqflist)

    set("n", "<space>rn", vim.lsp.buf.rename)
    set("n", "<space>ca", vim.lsp.buf.code_action)
    set("n", "<leader>f", function()
      conform.format {
        lsp_format = "first",
        quiet = true,
      }
    end)
  end,
})

--[[
vim.api.nvim_create_autocmd("BufWritePre", {
  group = vim.api.nvim_create_augroup("FormatOnSaveGroup", {}),
  pattern = { "*.ts", "*.tsx" },
  callback = function(args)
    vim.lsp.buf.execute_command {
      command = "_typescript.organizeImports",
      title = "",
      arguments = { args.match },
    }
  end,
})
]]

vim.api.nvim_create_autocmd("BufWritePre", {
  group = vim.api.nvim_create_augroup("FormatOnSaveGroup", {}),
  callback = function()
    conform.format {
      lsp_format = "first",
      quiet = true,
    }
  end,
})

require("mason-tool-installer").setup {
  ensure_installed = {
    { "lua-language-server", version = "3.13.0" },

    { "goimports",           version = "v0.27.0" },

    { "prettierd",           version = "0.25.4" },

    { "basedpyright",        version = "1.12.3" },
    { "isort",               version = "5.13.2" },
    { "autopep8",            version = "2.3.1" },
  },
  auto_update = false,
}

local lspconfig = require("lspconfig")

lspconfig.lua_ls.setup {}
lspconfig.basedpyright.setup {}
