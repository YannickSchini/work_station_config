local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

local bootstrap = fn.empty(fn.glob(install_path)) > 0 or
    fn.empty(fn.glob(fn.stdpath("config") .. "/plugin/packer_compiled.lua")) > 0
if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd("packadd packer.nvim")
end

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use 'morhetz/gruvbox'

    use 'tpope/vim-surround'

    use 'tpope/vim-commentary'

    use 'tpope/vim-fugitive'

    use {
        'goolord/alpha-nvim',
        requires = { 'nvim-tree/nvim-web-devicons' }
    }

    use {
        'ruifm/gitlinker.nvim',
        as = "gitlinker",
        requires = 'nvim-lua/plenary.nvim',
        config = function()
            require("gitlinker").setup()
        end
    }

    use {
        "Pocco81/auto-save.nvim",
        config = function()
            require("auto-save").setup()
        end
    }

    use 'lukas-reineke/indent-blankline.nvim'

    use {
        'akinsho/bufferline.nvim',
        requires = 'nvim-tree/nvim-web-devicons'
    }

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }

    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
        config = [[require("setup/treesitter")]]
    }

    use {
        'nvim-treesitter/nvim-treesitter-context',
        requires = 'nvim-treesitter'
    }

    use {
        'nvim-telescope/telescope.nvim',
        as = 'telescope',
        tag = '0.1.0',
        requires = {
            { 'nvim-lua/plenary.nvim' },
            { 'nvim-tree/nvim-web-devicons' }
        }
    }

    use {
        'L3MON4D3/LuaSnip',
        as = 'luasnip',
        config = [[require("setup/luasnip")]]
    }

    use {
        "hrsh7th/nvim-cmp",
        as = "cmp",
        requires = {
            { "luasnip" },
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-nvim-lsp" },
            { "hrsh7th/cmp-nvim-lua" },
            { "onsails/lspkind.nvim", as = "lspkind" },
            { "simrat39/rust-tools.nvim", as = "rust-tools" }
        },
        config = [[require("setup/cmp")]],
        after = "lsp-config"
    }

    use {
        "neovim/nvim-lspconfig",
        as = "lsp-config",
        requires = {
            { "williamboman/mason.nvim", as = "mason" },
            { "williamboman/mason-lspconfig.nvim", as = "mason-lspconfig" },
        },
        config = [[require("setup/lsp")]]
    }

    -- use {    -- Unsure about this one, will have to wait until I have a proper codebase to test this on to see if it provides value
    --     'anuvyklack/pretty-fold.nvim',
    --     config = function()
    --         require('pretty-fold').setup()
    --     end
    -- }

        if bootstrap then
        require("packer").sync()
    end
end)
