-- config
local cmd = vim.cmd
local fn = vim.fn
local g = vim.g
local opt = vim.opt
-- general config
opt.number = true
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.mouse = 'a'

local map = vim.api.nvim_set_keymap
local default_opt = {noremap = true, silent = true}

map('t', '<Esc>', [[<C-\><C-n>]], default_opt)
map('t', '<A-h>', [[<C-\><C-N><C-w>h]], default_opt)
map('t', '<A-j>', [[<C-\><C-N><C-w>j]], default_opt)
map('t', '<A-k>', [[<C-\><C-N><C-w>k]], default_opt)
map('t', '<A-l>', [[<C-\><C-N><C-w>l]], default_opt)

map('i', '<A-h>', [[<C-\><C-N><C-w>h]], default_opt)
map('i', '<A-j>', [[<C-\><C-N><C-w>j]], default_opt)
map('i', '<A-k>', [[<C-\><C-N><C-w>k]], default_opt)
map('i', '<A-l>', [[<C-\><C-N><C-w>l]], default_opt)

map('n', '<A-h>', '<C-w>h', default_opt)
map('n', '<A-j>', '<C-w>j', default_opt)
map('n', '<A-k>', '<C-w>k', default_opt)
map('n', '<A-l>', '<C-w>l', default_opt)

-- bracket auto complete
-- inoremap " ""<ESC>i
-- inoremap ' ''<ESC>i
-- inoremap ( ()<ESC>i
-- inoremap [ []<ESC>i
-- inoremap { {}<ESC>i

-- general config
require("bufferline").setup()
opt.termguicolors = true
require('onedark').setup()
cmd [[set noshowmode]]

