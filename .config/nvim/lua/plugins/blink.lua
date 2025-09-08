return {
    "saghen/blink.cmp",
    version = "1.*",
    opts = {
        keymap = {
            preset = "none",

            -- ["<C-h>"] = { "snippet_backward", "select_prev", "fallback" },
            ["<Tab>"] = { "select_next", "fallback" },
            ["<S-Tab>"] = { "select_prev", "fallback" },
            ["<CR>"] = { "accept", "snippet_forward", "fallback" },
            ["<C-space>"] = { "show_documentation", "hide_documentation", "fallback" },
            ["<C-j>"] = { "scroll_documentation_down", "fallback" },
            ["<C-k>"] = { "scroll_documentation_up", "fallback" },
        },

        sources = {
            default = { "lsp", "path", "buffer", "snippets" },
        },

        cmdline = {
            keymap = { preset = "inherit" },
            completion = { menu = { auto_show = true } },
        },

        signature = { enabled = true },
    },
}
