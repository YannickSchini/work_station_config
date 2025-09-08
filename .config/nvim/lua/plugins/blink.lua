return {
    "saghen/blink.cmp",
    version = "1.*",
    opts = {
        keymap = {
            preset = "none",

            ["<Tab>"] = { "select_next", "fallback" },
            ["<S-Tab>"] = { "select_prev", "fallback" },
            ["<CR>"] = { "accept", "snippet_forward", "fallback" },
            ["<C-space>"] = { "show_documentation", "hide_documentation", "fallback" },
            ["<C-j>"] = { "scroll_documentation_down", "fallback" },
            ["<C-k>"] = { "scroll_documentation_up", "fallback" },
        },

        sources = {
            default = { "lsp", "path", "buffer", "snippets" },
            providers = {
                cmdline = {
                    min_keyword_length = function(ctx)
                        -- when typing a command, only show when the keyword is 3 characters or longer
                        if ctx.mode == 'cmdline' and string.find(ctx.line, ' ') == nil then return 3 end
                        return 0
                    end
                }
            }
        }
    },

    cmdline = {
        keymap = {
            preset = "inherit",
            ["<CR>"] = { "accept_and_enter", "fallback" },
        },
        completion = { menu = { auto_show = true } },
    },

    signature = { enabled = true },

}
