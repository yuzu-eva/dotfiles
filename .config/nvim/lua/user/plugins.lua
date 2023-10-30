require('packer').startup(function()
    use { 'wbthomason/packer.nvim' } -- Let packer manage itself
    use { 'tpope/vim-commentary' }
    use { 'tpope/vim-surround' }
    use { 'tpope/vim-eunuch' }
    use { 'christoomey/vim-tmux-navigator' }

    use {
        'dracula/vim',
        as = 'dracula',
        config = function()
            require('user.plugins.dracula')
        end
    }
    use {
        'windwp/nvim-autopairs',
        config = function()
            require('nvim-autopairs').setup()
        end
    }

    use {
        'windwp/nvim-ts-autotag',
        config = function()
            require('nvim-ts-autotag').setup()
        end
    }

    use {
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function()
            require('user.plugins.nvim-tree')
        end
    }
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        requires = {
            'nvim-treesitter/playground',
            'nvim-treesitter/nvim-treesitter-textobjects',
            'lewis6991/spellsitter.nvim',
            'JoosepAlviste/nvim-ts-context-commentstring',
        },
        config = function()
            require('spellsitter').setup()
            require('user.plugins.treesitter')
        end
    }

    use {
        'neovim/nvim-lspconfig',
        requires = {
            'b0o/schemastore.nvim',
            'folke/lsp-colors.nvim',
            'weilbith/nvim-code-action-menu',
        },
        config = function()
            require('user.plugins.lspconfig')
        end
    }
    use {
        'hrsh7th/nvim-cmp',
        requires = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'jessarcher/cmp-path',
            'hrsh7th/cmp-nvim-lua',
            'L3MON4D3/LuaSnip',
            'onsails/lspkind-nvim',
            'hrsh7th/cmp-nvim-lsp-signature-help',
        },
        config = function()
            require('user.plugins.cmp')
        end
    }
    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            'nvim-lua/popup.nvim',
            'nvim-lua/plenary.nvim',
            'kyazdani42/nvim/nvim-web-devicons',
        },
        config = function()
            require('user.plugins.telescope')
        end
    }
    use {
        'nvim-lualine/lualine.nvim',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function()
            require('user.plugins.lualine')
        end
    }
    use {
        'L3MON4D3/LuaSnip',
        config = function()
            require('user.plugins.luasnip')
        end
    }
end)
