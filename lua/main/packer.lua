vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'theprimeagen/vim-be-good'
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.2',
    requires = {
      { 'nvim-lua/plenary.nvim' },
      { "nvim-telescope/telescope-live-grep-args.nvim" },
      { 'nvim-lua/popup.nvim' },
      { 'nvim-telescope/telescope-media-files.nvim' },
    }
  }
  use 'sindrets/diffview.nvim'
  use "xiyaowong/transparent.nvim"

  use { "catppuccin/nvim", as = "catppuccin" }
  use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
  use('nvim-treesitter/playground')
  use('theprimeagen/harpoon')
  use('mbbill/undotree')
  use('tpope/vim-fugitive')
  use { 'nvim-tree/nvim-tree.lua', requires = { 'nvim-tree/nvim-web-devicons' } }
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },       -- Required
      {                                  -- Optional
        'williamboman/mason.nvim',
        run = function()
          pcall(vim.cmd, 'MasonUpdate')
        end,
      },
      { 'williamboman/mason-lspconfig.nvim' },       -- Optional

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },           -- Required
      { 'hrsh7th/cmp-nvim-lsp' },       -- Required
      { 'L3MON4D3/LuaSnip' },           -- Required
    }
  }
  use { 'nvimdev/lspsaga.nvim' }
  use('nvim-lualine/lualine.nvim')

  use('kyazdani42/nvim-web-devicons')   -- OPTIONAL: for file icons
  use('lewis6991/gitsigns.nvim')        -- OPTIONAL: for git status
  use { 'akinsho/toggleterm.nvim', tag = 'v2.*' }
  use('ryanoasis/vim-devicons')
  use {
    "goolord/alpha-nvim",
    requires = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require 'alpha'.setup(require 'alpha.themes.startify'.config)
    end
  }
end)
