local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
    install_path })

  -- Ref: https://github.com/wbthomason/packer.nvim/issues/739#issuecomment-1019280631
  vim.o.runtimepath = vim.fn.stdpath('data') .. '/site/pack/*/start/*,' .. vim.o.runtimepath
end

return require('packer').startup({
  function(use)
    use 'wbthomason/packer.nvim'

    -- My plugins
    use 'kyazdani42/nvim-web-devicons'
    use 'kyazdani42/nvim-tree.lua'
    use 'lewis6991/gitsigns.nvim'
    use 'nvim-lualine/lualine.nvim'
    use 'rcarriga/nvim-notify'
    -- use 'romgrk/barbar.nvim'
    use 'sunjon/shade.nvim'
    use { 'akinsho/bufferline.nvim', tag = "v2.*" }
    use 'glepnir/dashboard-nvim'
    use 'windwp/nvim-autopairs'

    -- Colorschemes
    use 'EdenEast/nightfox.nvim'
    use 'sainnhe/edge'
    use 'wojciechkepka/vim-github-dark'
    use 'tiagovla/tokyodark.nvim'
    use 'folke/tokyonight.nvim'
    use 'navarasu/onedark.nvim'

    -- cmp plugins
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-nvim-lsp-signature-help'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'saadparwaiz1/cmp_luasnip'

    -- LSP
    use 'neovim/nvim-lspconfig'
    use 'williamboman/nvim-lsp-installer'
    use 'onsails/lspkind.nvim'
    use 'lukas-reineke/lsp-format.nvim'

    -- snippets
    use 'L3MON4D3/LuaSnip'
    use 'rafamadriz/friendly-snippets'

    -- Treesitter
    use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate',
    }

    -- Telescope
    use {
      'nvim-telescope/telescope.nvim',
      requires = { { 'nvim-lua/plenary.nvim' } }
    }

    -- Tmux
    use 'numToStr/Navigator.nvim'

    if packer_bootstrap then
      require('packer').sync()
    end
  end,
  config = {
    git = {
      default_url_format = "git@github.com:%s",
    },
    display = {
      open_fn = function()
        return require('packer.util').float({ border = 'single' })
      end
    }
  },
})
