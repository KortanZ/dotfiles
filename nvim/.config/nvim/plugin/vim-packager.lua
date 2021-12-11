require('packager').setup(function(packager)
    local add = packager.add
    add('kristijanhusak/vim-packager')
    add('neovim/nvim-lspconfig')
    add('nvim-treesitter/nvim-treesitter')
    add('justinmk/vim-sneak')
    add('tpope/vim-surround')
    add('lukas-reineke/indent-blankline.nvim')
    add('kyazdani42/nvim-tree.lua')

    add('hrsh7th/nvim-cmp', {
        requires = {'hrsh7th/vim-vsnip', 'hrsh7th/cmp-buffer', 'hrsh7th/cmp-nvim-lsp'}})
    add('nvim-telescope/telescope.nvim',{requires = {'nvim-lua/plenary.nvim'}})
    add("liuchengxu/vista.vim")

    add('famiu/feline.nvim')
    add('akinsho/bufferline.nvim')
    add('kyazdani42/nvim-web-devicons')
    add('navarasu/onedark.nvim')
    add('sindrets/diffview.nvim')
    
end, {dir = vim.env.XDG_DATA_HOME .. '/nvim/site/pack/packager'})
