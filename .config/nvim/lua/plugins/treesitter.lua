return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local configs = require("nvim-treesitter.configs")

        configs.setup({
            auto_install = true,
            ensure_installed = {
                "lua",
                "hcl",
                "markdown",
                "dockerfile",
                "json",
                "toml",
                "make",
                "markdown_inline",
                "python",
                "terraform",
                "yaml",
                "bash",
                "kdl",
            },
            sync_install = false,
            highlight = { enable = true },
        })
    end,
}
