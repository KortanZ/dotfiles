local map = vim.api.nvim_set_keymap
local default_opt = {noremap = true, silent = true}

map('t', '<Esc>', [[<C-\><C-n>]], default_opt)
map('t', '<A-h>', [[<C-\><C-N><C-w>h]], default_opt)
map('t', '<A-j>', [[<C-\><C-N><C-w>j]], default_opt)
map('t', '<A-k>', [[<C-\><C-N><C-w>k]], default_opt)
map('t', '<A-l>', [[<C-\><C-N><C-w>l]], default_opt)

map('n', '<leader>h', '<C-w>h', default_opt)
map('n', '<leader>j', '<C-w>j', default_opt)
map('n', '<leader>k', '<C-w>k', default_opt)
map('n', '<leader>l', '<C-w>l', default_opt)

-- bracket auto complete
-- inoremap " ""<ESC>i
-- inoremap ' ''<ESC>i
-- inoremap ( ()<ESC>i
-- inoremap [ []<ESC>i
-- inoremap { {}<ESC>i

map('n', '<C-p>', ':FzfLua files<CR>', default_opt)

map('n', '<leader>b', '<C-w>l', default_opt)
map('n', '<leader>t', ':NvimTreeToggle<CR>', default_opt)

-- hop
map('n', 'f', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>", default_opt)
map('n', 'F', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>", default_opt)
map('o', 'f', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, inclusive_jump = true })<cr>", default_opt)
map('o', 'F', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, inclusive_jump = true })<cr>", default_opt)
map('n', '<leader>e', "<cmd> lua require'hop'.hint_words({ hint_position = require'hop.hint'.HintPosition.END })<cr>", default_opt)
map('v', '<leader>e', "<cmd> lua require'hop'.hint_words({ hint_position = require'hop.hint'.HintPosition.END })<cr>", default_opt)
map('o', '<leader>e', "<cmd> lua require'hop'.hint_words({ hint_position = require'hop.hint'.HintPosition.END, inclusive_jump = true })<cr>", default_opt)
map('n', '<leader>g', "<cmd> lua require'hop'.hint_words({ hint_position = require'hop.hint'.HintPosition.END })<cr>", default_opt)
map('v', '<leader>g', "<cmd> lua require'hop'.hint_words({ hint_position = require'hop.hint'.HintPosition.END })<cr>", default_opt)
map('o', '<leader>g', "<cmd> lua require'hop'.hint_words({ hint_position = require'hop.hint'.HintPosition.END, inclusive_jump = true })<cr>", default_opt)

