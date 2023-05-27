require('packager').setup(function(packager)
    local add = packager.add
    add('kristijanhusak/vim-packager')
    add('neovim/nvim-lspconfig')
    add('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'})

    add('tpope/vim-surround')
    add('lukas-reineke/indent-blankline.nvim')
    add('kyazdani42/nvim-tree.lua',{requires = { 'nvim-tree/nvim-web-devicons'}})

    add('hrsh7th/nvim-cmp', {
        requires = {'hrsh7th/vim-vsnip', 'hrsh7th/cmp-buffer', 'hrsh7th/cmp-nvim-lsp'}})
    add('ibhagwan/fzf-lua',{requires = { 'nvim-tree/nvim-web-devicons'}})
    add("liuchengxu/vista.vim")

    add('nvim-lualine/lualine.nvim',{requires = { 'nvim-tree/nvim-web-devicons'}})
    add('akinsho/bufferline.nvim',{requires = { 'nvim-tree/nvim-web-devicons'}})
    add('navarasu/onedark.nvim')
    add('sindrets/diffview.nvim')
    add('numToStr/Comment.nvim')
    add('yamatsum/nvim-cursorline')
    add('phaazon/hop.nvim')
    
end, {dir = vim.env.XDG_DATA_HOME .. '/nvim/site/pack/packager'})
