-- config
local cmd = vim.cmd
local fn = vim.fn
local g = vim.g
local opt = vim.opt

opt.number = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.mouse = 'a'
-- opt.clipboard = "unnamedplus"
opt.termguicolors = true
opt.showmode = false
opt.colorcolumn = '100'
opt.relativenumber = true
opt.conceallevel = 2
opt.concealcursor = 'nc'

g.mapleader = ";"

require('plugin_manager')
require('keymap')
