local cmp = require('cmp')
cmp.setup({
    mapping = {
        ['<S-Tab]>'] = cmp.mapping.select_prev_item(),
        ['<Tab>'] = cmp.mapping.select_next_item(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
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
