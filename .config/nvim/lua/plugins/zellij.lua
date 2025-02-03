-- NOTE: Ensures that when exiting NeoVim, Zellij returns to normal mode
vim.api.nvim_create_autocmd("VimLeave", {
    pattern = "*",
    command = "silent !zellij action switch-mode normal"
})

if Bepo then
    return {
        "swaits/zellij-nav.nvim",
        lazy = true,
        event = "VeryLazy",
        keys =
        {
            { "<c-c>", "<cmd>ZellijNavigateLeftTab<cr>",  { silent = true, desc = "navigate left or tab" } },
            { "<c-t>", "<cmd>ZellijNavigateDown<cr>",     { silent = true, desc = "navigate down" } },
            { "<c-s>", "<cmd>ZellijNavigateUp<cr>",       { silent = true, desc = "navigate up" } },
            { "<c-r>", "<cmd>ZellijNavigateRightTab<cr>", { silent = true, desc = "navigate right or tab" } },
        },
        opts = {},
    }
else
    return {
        "swaits/zellij-nav.nvim",
        lazy = true,
        event = "VeryLazy",
        keys =
        {
            { "<c-h>", "<cmd>ZellijNavigateLeftTab<cr>",  { silent = true, desc = "navigate left or tab" } },
            { "<c-j>", "<cmd>ZellijNavigateDown<cr>",     { silent = true, desc = "navigate down" } },
            { "<c-k>", "<cmd>ZellijNavigateUp<cr>",       { silent = true, desc = "navigate up" } },
            { "<c-l>", "<cmd>ZellijNavigateRightTab<cr>", { silent = true, desc = "navigate right or tab" } },
        },
        opts = {},
    }
end
