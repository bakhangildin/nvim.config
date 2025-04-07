require("neodev").setup {}
require("mason").setup {}

local conform = require("conform")
conform.setup {
  formatters_by_ft = {
    go = { "goimports" },

    templ = { "prettierd", "templ" },

    javascript = { "prettierd" },
    typescript = { "prettierd" },
    javascriptreact = { "prettierd" },
    typescriptreact = { "prettierd" },

    markdown = { "prettierd" },

    python = { "isort", "autopep8" },
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
    { "lua-language-server",         version = "3.13.0" },

    { "gopls",                       version = "v0.16.2" },
    { "goimports",                   version = "v0.27.0" },

    { "templ",                       version = "v0.2.793" },

    { "html-lsp",                    version = "4.10.0" },
    { "emmet-language-server",       version = "2.6.0" },
    { "tailwindcss-language-server", version = "0.0.27" },
    { "htmx-lsp",                    version = "0.1.0" },

    { "typescript-language-server",  version = "4.3.3" },
    { "prettierd",                   version = "0.25.4" },

    { "basedpyright",                version = "1.12.3" },
    { "isort",                       version = "5.13.2" },
    { "autopep8",                    version = "2.3.1" },

    { "jsonls",                      version = "4.10.0" },

    { "clangd",                      version = "19.1.2" },
  },
  auto_update = false,
}

local lspconfig = require("lspconfig")
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig.lua_ls.setup {
  capabilities = capabilities,
}

lspconfig.gopls.setup {
  capabilities = capabilities,
}

lspconfig.templ.setup {
  capabilities = capabilities,
}

lspconfig.html.setup {
  capabilities = capabilities,
}

lspconfig.emmet_language_server.setup {
  capabilities = capabilities,
  filetypes = vim.list_extend(require("lspconfig.server_configurations.emmet_language_server").default_config.filetypes, { "templ" }),
}
lspconfig.tailwindcss.setup {
  capabilities = capabilities,
}
-- lspconfig.htmx.setup {
--   capabilities = capabilities,
-- }

lspconfig.ts_ls.setup {
  capabilities = capabilities,
}

lspconfig.basedpyright.setup {
  capabilities = capabilities,
}

lspconfig.jsonls.setup {
  capabilities = capabilities,
  settings = {
    json = {
      schemas = require("schemastore").json.schemas(),
      validate = { enable = true },
    },
  },
}

lspconfig.clangd.setup {
  capabilities = capabilities,
}
