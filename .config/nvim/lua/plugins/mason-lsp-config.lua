return {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
        "williamboman/mason.nvim",
        "neovim/nvim-lspconfig",
    },
    config = function()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "jsonls",
                "lua_ls",
                "terraformls",
                "pyright",
                "ruff",
            },

            handlers = {
                function(server_name)
                    require("lspconfig")[server_name].setup({})
                end,

                lua_ls = function()
                    require("lspconfig").lua_ls.setup({
                        settings = {
                            Lua = {
                                diagnostics = {
                                    globals = { "vim" },
                                },
                            },
                        },
                    })
                end,

                pyright = function()
                    require('lspconfig').pyright.setup {
                        settings = {
                            pyright = {
                                -- Using Ruff's import organizer
                                disableOrganizeImports = true,
                            },
                            python = {
                                analysis = {
                                    -- Ignore all files for analysis to exclusively use Ruff for linting
                                    ignore = { '*' },
                                },
                            },
                        },
                    }
                end,

            },
        })
    end,
}
