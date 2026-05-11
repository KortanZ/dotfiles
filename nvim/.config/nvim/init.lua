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
g.maplocalleader = ","

vim.g.clipboard = {
  name = 'WslClipboard',
  copy = {
    ['+'] = 'clip.exe',
    ['*'] = 'clip.exe',
  },
  paste = {
    ['+'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
    ['*'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
  },
  cache_enabled = 0,
}

require('plugin_manager')
require('keymap')
