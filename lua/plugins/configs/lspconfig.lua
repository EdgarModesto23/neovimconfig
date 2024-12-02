local config = require("plugins.configs.lspconfig")

local on_attach = config.on_attach
local capabilities = config.capabilities

local lspconfig = require("lspconfig")
local util = require("lspconfig/util")

lspconfig.elixirls.setup({
  cmd = {"elixir-ls"},
  on_attach = on_attach,
  capabilities = capabilities,
})

lspconfig.dockerls.setup({
  on_attach = on_attach,
  capabilities = capabilities
})

lspconfig.docker_compose_language_service.setup({
  on_attach = on_attach,
  capabilities = capabilities
})


lspconfig.intelephense.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"php"}
})

lspconfig.pyright.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"python"},
})

lspconfig.eslint.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

lspconfig.bashls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

lspconfig.tailwindcss.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"html", "css", "javascript", "typescript", "typescriptreact"},
})

lspconfig.tsserver.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

lspconfig.clangd.setup({
  on_attach = function (client, bufnr)
    client.server_capabilities.signatureHelpProvider = false
    on_attach(client,bufnr)
  end,
  capabilities = capabilities,

})

lspconfig.gopls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {"gopls"},
  filetypes = {"go", "gomod", "gowork", "gotmpl"},
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedparams = true,
      },
    },
  },
})
