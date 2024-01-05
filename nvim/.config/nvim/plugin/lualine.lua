require('lualine').setup{
    options = {
        theme = 'onedark',
        section_separators = { left = '|', right = '|' },
        component_separators = { left = '|', right = '|' }
    },
    sections = {
        lualine_c = {'lsp_progress'},
    },
    inactive_sections = {
        lualine_c = {'lsp_progress'},
        lualine_x = {'location'},
    },
    tabline = {
        lualine_a = {'buffers'},
        lualine_z = {'tabs'}
    },
}
