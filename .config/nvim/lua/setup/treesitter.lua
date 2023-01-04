local parsers = {
    "dockerfile",
    "hcl",
    "json",
    "lua",
    "markdown",
    "python",
    "rust",
    "toml",
    "yaml",
    "make",
    "bash",
}

require("nvim-treesitter.configs").setup({
    ensure_installed = parsers,
    highlight = { enable = true },
    indent = { enable = true },
})

