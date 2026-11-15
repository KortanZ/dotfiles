local function bootstrap_pckr()
    local pckr_path = vim.fn.stdpath("data") .. "/pckr/pckr.nvim"

    if not vim.loop.fs_stat(pckr_path) then
        vim.fn.system({
          'git',
          'clone',
          "--filter=blob:none",
          'https://github.com/lewis6991/pckr.nvim',
          pckr_path
        })
    end

    vim.opt.rtp:prepend(pckr_path)
end

bootstrap_pckr()

require('pckr').add{
    -- lsp & treesitter
    {'neovim/nvim-lspconfig',
        config = 'plugins/nvim-lspconfig'
    };
    {'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = 'plugins/nvim-treesitter'
    };

    -- completion
    {'hrsh7th/nvim-cmp',
        requires = {
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-nvim-lsp'
        },
        config = 'plugins/nvim-cmp'
    };

    -- find & replace
    {'MagicDuck/grug-far.nvim',
        requires = {'nvim-tree/nvim-web-devicons'},
        config = function()
            require('grug-far').setup()
        end
    };

    -- widget
    {'ibhagwan/fzf-lua',
        requires = {'nvim-tree/nvim-web-devicons'},
        config = function()
            require('fzf-lua').setup()
        end
    };
    {'nvim-tree/nvim-tree.lua',
        requires = {'nvim-tree/nvim-web-devicons'},
        config = function()
            require("nvim-tree").setup{
                disable_netrw = true,
            }
        end
    };

    'sindrets/diffview.nvim';

    -- theme & ui
    {'navarasu/onedark.nvim',
        config = function()
            require('onedark').setup {
                -- style = 'light',
                transparent = true,
                cbqr_fglyr = {
                    comments = 'italic',
                    keywords = 'none',
                    functions = 'bold',
                    strings = 'none',
                    variables = 'none'
                },

            }
            require('onedark').load()
        end
    };
    {'linrongbin16/lsp-progress.nvim',
        config = function()
            require('lsp-progress').setup()
        end
    };
    {'nvim-lualine/lualine.nvim',
        requires = {
            'nvim-tree/nvim-web-devicons',
            'linrongbin16/lsp-progress.nvim'
        },
        config = 'plugins/lualine'

    };
    {'ya2s/nvim-cursorline',
        config = function()
            require('nvim-cursorline').setup()
        end
    };
    {'lukas-reineke/indent-blankline.nvim',
        config = function()
            require('ibl').setup({
                scope = {
                    show_start = false,
                    show_end = false,
                }
            })
        end
    };

    -- operation enhancement
    {'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    };
    {'folke/flash.nvim',
        config = function()
            require('flash').setup({
                modes = {
                    char = {
                        jump_labels = true
                    },
                    search = {
                        enabled = true
                    }
                }
            })
        end
    };
    {'kylechui/nvim-surround',
        config = function()
            require('nvim-surround').setup()
        end
    };

    {'akinsho/toggleterm.nvim',
        config = function()
            require('toggleterm').setup{
                open_mapping = [[<c-t>]],
            }
        end
    };

    -- AI
    {'coder/claudecode.nvim',
        requires = {'folke/snacks.nvim'},
        config = function()
            require('claudecode').setup()
        end
    };


    -- KeyMap
    {'folke/which-key.nvim',
        requires = {'nvim-tree/nvim-web-devicons'},
        config = function()
            require('which-key').setup()
        end
    };

    -- Git
    {'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup()
        end
    };

}
