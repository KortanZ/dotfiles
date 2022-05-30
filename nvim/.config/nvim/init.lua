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
opt.clipboard = "unnamedplus"

g.mapleader = "m"

-- general config
require("bufferline").setup()
opt.termguicolors = true
require('onedark').load()
cmd [[set noshowmode]]

require('Comment').setup()
require('nvim-tree').setup()
require('hop').setup()
require('nvim-cursorline').setup()
