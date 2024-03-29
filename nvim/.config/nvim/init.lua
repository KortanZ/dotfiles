-- config
local cmd = vim.cmd
local fn = vim.fn
local g = vim.g
local opt = vim.opt

opt.number = true
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.mouse = 'a'
opt.clipboard = "unnamedplus"
opt.termguicolors = true
opt.showmode = false
opt.conceallevel = 2
opt.foldlevelstart = 99

g.mapleader = "m"

-- plugins
require('onedark').load()
require("fzf-lua").setup()
require("ibl").setup()
require('Comment').setup()
require('nvim-tree').setup()
require('flash').setup()
require('nvim-cursorline').setup()
require('lsp-progress').setup()
