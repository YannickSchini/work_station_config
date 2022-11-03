local api = vim.api

-- Open all folds because they are closed by default when enable TS-based folding
api.nvim_create_autocmd(
    { "BufReadPost", "FileReadPost" },
    { command = "normal zx zR" } -- "zx" part is necessary only due to a bug in Telescope: https://github.com/nvim-telescope/telescope.nvim/issues/699
)
