local cmp = require('cmp')
cmp.setup({
    mapping = {
        ['<S-Tab]>'] = cmp.mapping.select_prev_item(),
        ['<Tab>'] = cmp.mapping.select_next_item(),
    },
    sources = {
        {name = 'nvim_lsp'},
        {name = 'path'},
        {name = 'orgmode'},
        {
            name = 'buffer',
            options = {
                get_bufnrs = function()
                    return vim.api.nvim_list_bufs()
                end
            }
        },
    }
})
