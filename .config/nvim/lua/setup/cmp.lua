local cmp = require("cmp")
local luasnip = require("luasnip")
require("table")

local has_words_before = function()
  local cursor = vim.api.nvim_win_get_cursor(0)
  return not vim.api.nvim_get_current_line():sub(1, cursor[2]):match('^%s$')
end

cmp.setup({
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end
    },

    formatting = {
        format = require("lspkind").cmp_format {
            with_text = true,
            menu = {
                luasnip = "[Snip]",
                nvim_lsp = "[LSP]",
                nvim_lua = "[API]",
                buffer = "[Buf]",
                path = "[Path]",
            }
        }
    },

    mapping = cmp.mapping.preset.insert({
        ["<Up>"] = cmp.mapping.scroll_docs(-4),
        ["<Down>"] = cmp.mapping.scroll_docs(4),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),
    }),

    sources = cmp.config.sources({
        { name = "luasnip" },
        { name = "nvim_lsp" },
        { name = "nvim_lua" },
        { name = "buffer", keyword_length = 3 },
        -- { name = "path" },
    }),
    experimental = {
        ghost_text = true
    }
})

cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = "buffer" }
    }
})

cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources(
        { { name = "path" } },
        { { name = "cmdline" } }
    )
})
