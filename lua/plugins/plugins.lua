return {

	{
		'nvim-telescope/telescope.nvim', tag = '0.1.0',
		-- or                            , branch = '0.1.x',
		dependencies = { {'nvim-lua/plenary.nvim'} }
	},

	{'folke/tokyonight.nvim'},

	{
		'folke/trouble.nvim',
		config = function()
			require('trouble').setup {
				icons = false,
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			}
		end
	},


	{'nvim-treesitter/nvim-treesitter', build = ':TSUpdate'},
	'nvim-treesitter/playground',
	'theprimeagen/harpoon',
	'theprimeagen/refactoring.nvim',
	'mbbill/undotree',
	'tpope/vim-fugitive',
	'nvim-treesitter/nvim-treesitter-context',

	{
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v1.x',
		dependencies = {
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
	},

	'folke/zen-mode.nvim',
	'github/copilot.vim',
	'eandrju/cellular-automaton.nvim',
	'laytan/cloak.nvim',

	--NOTE: Everything that's above this comment has been made by ThePrimeagen he is a fantastic youtuber here is the link to watch his video

	'vim-airline/vim-airline',
	'vim-airline/vim-airline-themes',
	'tpope/vim-commentary',
	'lervag/vimtex',
	'terryma/vim-multiple-cursors',

	{
		'glepnir/lspsaga.nvim',
		branch = 'main',
		config = function()
			require('lspsaga').setup({})
		end,
		dependencies = {
			{'nvim-tree/nvim-web-devicons'},
			--Please make sure you install markdown and markdown_inline parser
			{'nvim-treesitter/nvim-treesitter'}
		}
	},

	{
		'jinzhongjia/LspUI.nvim',
		-- event = 'VimEnter',
		config=function()
			require('LspUI').setup()
		end
	},

	{
		'windwp/nvim-autopairs',
		config = function() require('nvim-autopairs').setup {} end
	},

	{
		'goolord/alpha-nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		config = function ()
			require'alpha'.setup(require'alpha.themes.startify'.config)
		end
	},

	{
		'folke/todo-comments.nvim',
		dependencies = 'nvim-lua/plenary.nvim',
	},

	{
		'Kasama/nvim-custom-diagnostic-highlight',
		config = function()
			require('nvim-custom-diagnostic-highlight').setup {}
		end
	},

	{
		'christoomey/vim-tmux-navigator'
	},
}
