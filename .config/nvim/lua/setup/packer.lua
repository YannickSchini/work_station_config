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
        'ruifm/gitlinker.nvim',
        as = "gitlinker",
        requires = 'nvim-lua/plenary.nvim',
        config = function()
            require("gitlinker").setup()
        end
    }
    use 'Pocco81/auto-save.nvim'
    use 'lukas-reineke/indent-blankline.nvim'
    use {
        'akinsho/bufferline.nvim',
        tag = "v1.*",
        requires = 'nvim-tree/nvim-web-devicons'
    }
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }
    use {
        'nvim-treesitter/nvim-treesitter',
        config = [[require("setup/treesitter")]]
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
        if bootstrap then
        require("packer").sync()
    end
end)
