return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    opts = {
        -- Define your formatters
        formatters_by_ft = {
            lua = { "stylua" },
            python = { "ruff_fix" },
        },
        -- Set up format-on-save
        format_on_save = {
            timeout_ms = 500,
            lsp_format = "fallback",
            async      = false,
        },
    },
}
