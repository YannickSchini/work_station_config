local luasnip = require "luasnip"

luasnip.config.set_config {
    history = true,
    updateevents = "TextChanged,TextChangedI",
    enable_autosnippets = true,
}

vim.keymap.set({ "i", "s" }, "<c-l>", function() -- Redundant with cmp keymap to Tab ?
    if luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
    end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<c-h>", function() -- Redundant with cmp keymap to S-Tab ?
    if luasnip.jumpable(-1) then
        luasnip.jump(-1)
    end
end, { silent = true })

vim.keymap.set("i", "<c-j>", function()
    if luasnip.choice_active() then
        luasnip.change_choice(1)
    end
end, { silent = true })

vim.keymap.set("i", "<c-k>", function()
    if luasnip.choice_active() then
        luasnip.change_choice(-1)
    end
end, { silent = true })
