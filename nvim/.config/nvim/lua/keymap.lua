local map = vim.keymap.set
local default_opt = {noremap = true, silent = true}
local tags_loaded = vim.fn.tagfiles()

map('t', '<Esc>', [[<C-\><C-n>]], default_opt)
map('t', '<A-h>', [[<C-\><C-N><C-w>h]], default_opt)
map('t', '<A-j>', [[<C-\><C-N><C-w>j]], default_opt)
map('t', '<A-k>', [[<C-\><C-N><C-w>k]], default_opt)
map('t', '<A-l>', [[<C-\><C-N><C-w>l]], default_opt)

map('n', '<leader>h', '<C-w>h', default_opt)
map('n', '<leader>j', '<C-w>j', default_opt)
map('n', '<leader>k', '<C-w>k', default_opt)
map('n', '<leader>l', '<C-w>l', default_opt)
map('n', '<leader>=', '<C-w>=', default_opt)


if next(tags_loaded) ~= nil then
    map('n', 'gd', ':tselect <C-R><C-W><cr>', default_opt)
    map('n', '<C-l>', require("fzf-lua").btags, default_opt)
    map('n', 'gr', require("fzf-lua").grep_cword, default_opt)
end

-- code navigation map
map('n', '<C-p>', require("fzf-lua").files, default_opt)
map('n', '<C-g>', require("fzf-lua").grep_project, default_opt)

map('n', '<leader>b', '<C-w>l', default_opt)
map('n', '<leader>t', '<cmd>NvimTreeToggle<cr>', default_opt)


-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
map('n', '<space>e', vim.diagnostic.open_float)
map('n', '[d', vim.diagnostic.goto_prev)
map('n', ']d', vim.diagnostic.goto_next)
map('n', '<space>q', vim.diagnostic.setloclist)


-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    map('n', 'gD', vim.lsp.buf.declaration, opts)
    map('n', 'gd', vim.lsp.buf.definition, opts)
    map('n', 'K', vim.lsp.buf.hover, opts)
    map('n', 'gi', vim.lsp.buf.implementation, opts)
    map('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    map('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    map('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    map('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    map('n', '<space>D', vim.lsp.buf.type_definition, opts)
    map('n', '<space>rn', vim.lsp.buf.rename, opts)
    map({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    map('n', 'gr', vim.lsp.buf.references, opts)
    map('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})

-- Flash
map({'n', 'x', 'o'}, 's', require("flash").jump, default_opt)
map({'n', 'x', 'o'}, 'S', require("flash").treesitter, default_opt)
-- map( "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
-- map( "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
-- map( "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
