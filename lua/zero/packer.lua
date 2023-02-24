vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    use({
        'folke/tokyonight.nvim',
        as = 'tokyonight',
        config = function()
            vim.cmd('colorscheme tokyonight')
        end
    })

    use({'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'})

    use 'nvim-treesitter/playground' 
    use 'mbbill/undotree' 
    use 'tpope/vim-fugitive' 

    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'saadparwaiz1/cmp_luasnip'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-nvim-lua'},

            -- Snippets
            {'L3MON4D3/LuaSnip'},
            {'rafamadriz/friendly-snippets'},
        }
    }

    -- NOTE: My stuff is under this comment the rest (what's over this comment) was created ThePrimeagen watch his video here : https://youtu.be/w7i4amO_zaE :)

    use 'tpope/vim-commentary'
    use 'eandrju/cellular-automaton.nvim'
    use 'lervag/vimtex' 
    use 'terryma/vim-multiple-cursors' 
    use 'github/copilot.vim'

    use({
        "glepnir/lspsaga.nvim",
        branch = "main",
        config = function()
            require("lspsaga").setup({})
        end,
        requires = {
            {"nvim-tree/nvim-web-devicons"},
            --Please make sure you install markdown and markdown_inline parser
            {"nvim-treesitter/nvim-treesitter"}
        }
    })

    use {
        "jinzhongjia/LspUI.nvim",
        -- event = 'VimEnter',
        config=function()
            require("LspUI").setup()
        end
    }


    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }

    use {
        'goolord/alpha-nvim',
        requires = { 'nvim-tree/nvim-web-devicons' },
        config = function ()
            require'alpha'.setup(require'alpha.themes.startify'.config)
        end
    }


    use {
        "folke/todo-comments.nvim",
        requires = "nvim-lua/plenary.nvim",
    }

    use {
        'Kasama/nvim-custom-diagnostic-highlight',
        config = function()
            require('nvim-custom-diagnostic-highlight').setup {}
        end
    }

end)
