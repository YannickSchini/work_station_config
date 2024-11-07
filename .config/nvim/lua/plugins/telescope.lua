return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function()
        local telescope = require("telescope")

        telescope.setup({
            defaults = {
                vimgrep_arguments = {
                    "rg",
                    "--follow",        -- Follow symbolic links
                    "--hidden",        -- Search for hidden files
                    "--no-heading",    -- Don't group matches by each file
                    "--with-filename", -- Print the file path with the matched lines
                    "--line-number",   -- Show line numbers
                    "--column",        -- Show column numbers
                    "--smart-case",    -- Smart case search,
                },
            },
            pickers = {
                buffers = {
                    show_all_buffers = true,
                    sort_lastused = true,
                },
                find_files = {
                    hidden = true,
                    find_command = {
                        "rg",
                        "--files",          -- Search for files (respects .gitignore by default)
                        "--hidden",         -- Include hidden files
                        "--glob=!**/.git/*" -- Do not search for files in the .git folder
                    },
                },
            },
        })
    end,
    keys = {
        {
            "<Leader><Leader>",
            function()
                require("telescope.builtin").buffers()
            end,
            desc = "Telescope buffers",
        },

        {
            "<Leader>tg",
            function()
                require("telescope.builtin").git_files()
            end,
            desc = "Telescope git files",
        },

        {
            "<Leader>tf",
            function()
                require("telescope.builtin").find_files()
            end,
            desc = "Telescope find files",
        },

        {
            "<Leader>tr",
            function()
                require("telescope.builtin").lsp_references()
            end,
            desc = "Telescope LSP references",
        },

        {
            "<Leader>tg",
            function()
                require("telescope.builtin").live_grep()
            end,
            desc = "Telescope live grep",
        },

        {
            "<Leader>ts",
            function()
                require("telescope.builtin").grep_string()
            end,
            desc = "Telescope grep selection or under cursor",
            mode = { "n", "v" },
        },
    }
}
