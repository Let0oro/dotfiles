require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "clangd" }
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing optuions of lsp servers 
