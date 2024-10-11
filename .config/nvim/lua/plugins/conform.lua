return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    opts = {
        formatters_by_ft = {
            lua = { "stylua" },
            python = { "ruff" },
        },
        format_on_save = {
            lsp_format = "fallback",
            timeout_ms = 1000,
            async = false,
        },
    },
    keys = {
        {
            "<Leader>f",
            function()
                require("conform").format({
                    lsp_format = "fallback",
                    timeout_ms = 1000,
                    async = true,
                })
            end,
            mode = { "n", "v" },
            desc = "Format file or range",
        },
    },
}
