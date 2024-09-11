-- Setup language servers.
local lspconfig = require('lspconfig')
local tags_loaded = vim.fn.tagfiles()
local map = vim.keymap.set

-- Only setup clangd when not use ctags
if next(tags_loaded) == nil then
    lspconfig.clangd.setup {}
end

lspconfig.rust_analyzer.setup {}
lspconfig.pylsp.setup {}
