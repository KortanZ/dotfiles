require('lualine').setup{
    options = {
        theme = 'onedark',
        section_separators = { left = '|', right = '|' },
        component_separators = { left = '|', right = '|' }
    },
    sections = {
        lualine_c = {require('lsp-progress').progress}
    },
    inactive_sections = {
        lualine_c = {require('lsp-progress').progress}
    },
    tabline = {
        lualine_a = {'buffers'},
        lualine_z = {'tabs'}
    },
}

-- listen lsp-progress event and refresh lualine
vim.api.nvim_create_augroup("lualine_augroup", { clear = true })
vim.api.nvim_create_autocmd("User", {
  group = "lualine_augroup",
  pattern = "LspProgressStatusUpdated",
  callback = require("lualine").refresh,
})
