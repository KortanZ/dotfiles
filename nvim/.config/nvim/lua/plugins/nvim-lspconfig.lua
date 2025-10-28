-- Setup language servers.
local tags_loaded = vim.fn.tagfiles()

-- Extend lspconfig's rust_analyzer config
vim.lsp.config('rust_analyzer', {
  settings = {
    ['rust-analyzer'] = {
      diagnostics = {
        enable = true;
      }
    }
  }
  -- on_attach = function(client, bufnr)
  --     vim.lsp.inlay_hint.enable(true, {bufnr})
  -- end
})

-- Only enable clangd when not use ctags
if next(tags_loaded) == nil then
    vim.lsp.enable('clangd')
end

vim.lsp.enable('rust_analyzer')

vim.lsp.enable('pylsp')

