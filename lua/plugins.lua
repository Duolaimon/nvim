-- Install Packer automatically if it's not installed(Bootstraping)
-- Hint: string concatenation is done by `..`
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end
local packer_bootstrap = ensure_packer()


-- Reload configurations if we modify plugins.lua
-- Hint
--     <afile> - replaced with the filename of the buffer being manipulated
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])


-- Install plugins here - `use ...`
-- Packer.nvim hints
--     after = string or list,           -- Specifies plugins to load before this plugin. See "sequencing" below
--     config = string or function,      -- Specifies code to run after this plugin is loaded
--     requires = string or list,        -- Specifies plugin dependencies. See "dependencies".
--     ft = string or list,              -- Specifies filetypes which load this plugin.
--     run = string, function, or table, -- Specify operations to be run after successful installs/updates of a plugin
return require('packer').startup(function(use)
        -- Packer can manage itself
        use 'wbthomason/packer.nvim'
        use 'tanvirtin/monokai.nvim'
        use { 'neovim/nvim-lspconfig' }
        use { 'hrsh7th/nvim-cmp' }
        use { 'hrsh7th/cmp-nvim-lsp', after = 'nvim-cmp' }
        use { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' } -- buffer auto-completion
        use { 'hrsh7th/cmp-path', after = 'nvim-cmp' } -- path auto-completion
        use { 'hrsh7th/cmp-cmdline', after = 'nvim-cmp' } -- cmdline auto-completion
        use 'L3MON4D3/LuaSnip'
        use 'saadparwaiz1/cmp_luasnip'
        use { 'williamboman/mason.nvim' }
        use { 'williamboman/mason-lspconfig.nvim'}
        
        use 'simrat39/rust-tools.nvim'
        -- Debugging
        use 'nvim-lua/plenary.nvim'
        use 'mfussenegger/nvim-dap'

        -- theme start
        use 'folke/tokyonight.nvim'
        -- theme end
        
        -- status-line start
        use {
            'nvim-lualine/lualine.nvim',
            requires = { 'kyazdani42/nvim-web-devicons', opt = true }
        }
        -- status-line end
        
        -- navigation start
        use {
            'nvim-tree/nvim-tree.lua',
            requires = {
              'nvim-tree/nvim-web-devicons', -- optional
            }
        }
        use('christoomey/vim-tmux-navigator')
        use('akinsho/bufferline.nvim')
        use('lewis6991/gitsigns.nvim')
        -- navigation end

          -- highlight end
        use {
            'nvim-treesitter/nvim-treesitter',
            run = function()
                local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
                ts_update()
            end,
        }

        use 'p00f/nvim-ts-rainbow'
        use("windwp/nvim-autopairs")
        -- highlight end

        -- telescope start
        use("nvim-lua/popup.nvim")
        use("nvim-lua/plenary.nvim")
        use {
            'nvim-telescope/telescope.nvim', tag = '0.1.1',
        requires = { {'nvim-lua/plenary.nvim'} }
        }
        use({
            "j-hui/fidget.nvim",
            tag = 'legacy',
            config = function()
            require("fidget").setup()
        end
        })
        -- telescope end
        -- cmp start
        use('hrsh7th/nvim-cmp')
        use('hrsh7th/cmp-nvim-lsp')
        use('hrsh7th/cmp-vsnip')
        use('hrsh7th/cmp-path')
        use('hrsh7th/cmp-buffer')
        use('hrsh7th/vim-vsnip')
        use('rafamadriz/friendly-snippets')
        use('saadparwaiz1/cmp_luasnip')
        -- cmp end
        ---------------------------------------
        -- NOTE: PUT YOUR THIRD PLUGIN HERE --
        ---------------------------------------

        -- Automatically set up your configuration after cloning packer.nvim
        -- Put this at the end after all plugins
        if packer_bootstrap then
            require('packer').sync()
        end
    end)