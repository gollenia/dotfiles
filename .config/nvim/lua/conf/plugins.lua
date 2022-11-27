
local status, packer = pcall(require, "packer")
if not status then
		print("Packer is not installed")
			return
		end

vim.api.nvim_create_autocmd('BufWritePost', {
    group = vim.api.nvim_create_augroup('PACKER', { clear = true }),
    pattern = 'plugins.lua',
    command = 'source <afile> | PackerCompile',
})

return require('packer').startup(function(use)
  -- Packer can manage itself
  use('wbthomason/packer.nvim')

  -- Theme
  use({ 'folke/tokyonight.nvim', config = function()
    require('contexis.plugins.theme')
    end,
  })

  -- TreeSitter
  use { 'nvim-treesitter/nvim-treesitter', config = function()
    require('contexis.plugins.treesitter')
    end,
  }

  use { 
    'nvim-tree/nvim-tree.lua', 
    requires =  'nvim-tree/nvim-web-devicons',
    event = 'CursorHold',
    config = function()
      require('contexis.plugins.nvim-tree')
    end,
  }

  -- Bufferline
  use { 
    'akinsho/bufferline.nvim', 
    tag = "v3.*", 
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require('contexis.plugins.bufferline')
    end,
  }
  use { 
	  'nvim-lualine/lualine.nvim',  
	  requires = { 'kyazdani42/nvim-web-devicons', opt = true },
	  config = function() require('contexis.plugins.lualine') end, 
  } 
  use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP
  use({
            {
                'hrsh7th/nvim-cmp',
                event = 'InsertEnter',
                config = function()
                    require('contexis.plugins.lsp.cmp')
                end,
                requires = {
                    {
                        'L3MON4D3/LuaSnip',
                        event = 'InsertEnter',
                        config = function()
                            require('contexis.plugins.lsp.luasnip')
                        end,
                        requires = {
                            {
                                'rafamadriz/friendly-snippets',
                                event = 'CursorHold',
                            },
                        },
                    },
                },
            },
            { 'saadparwaiz1/cmp_luasnip', after = 'nvim-cmp' },
            { 'hrsh7th/cmp-path', after = 'nvim-cmp' },
            { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
        })

  if packer_bootstrap then
     packer.sync()
  end
end)
