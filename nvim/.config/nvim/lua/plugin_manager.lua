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

    -- widget
    {'ibhagwan/fzf-lua',
        requires = {'nvim-tree/nvim-web-devicons'},
        config = function()
            require('fzf-lua').setup()
        end
    };
    {'kyazdani42/nvim-tree.lua', requires = {'nvim-tree/nvim-web-devicons'}};
    {'jiaoshijie/undotree',
        requires = {'nvim-lua/plenary.nvim'},
        config = function()
            require('undotree').setup()
        end
    };
    'sindrets/diffview.nvim';

    -- theme & ui
    {'navarasu/onedark.nvim',
        config = function()
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
    {'yamatsum/nvim-cursorline',
        config = function()
            require('nvim-cursorline').setup()
        end
    };
    {'lukas-reineke/indent-blankline.nvim',
        config = function()
            require('ibl').setup()
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
            require('flash').setup()
        end
    };
    {'kylechui/nvim-surround'};

    -- GTD & notes
    {'nvim-orgmode/orgmode',
        require = {'nvim-orgmode/org-bullets.nvim'},
        config = 'plugins/orgmode'
    };
    {'nvim-orgmode/org-bullets.nvim',
        config = function()
            require('org-bullets').setup({
                concealcursor = true,
            })
        end
    };
}
