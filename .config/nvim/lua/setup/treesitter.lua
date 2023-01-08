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
    -- highlight = { enable = true },   -- Set to true by default, so not needed anymore
    indent = { enable = true },
})

-- https://github.com/nvim-treesitter/nvim-treesitter/wiki/Installation#packernvim
vim.api.nvim_create_autocmd({'BufEnter','BufAdd','BufNew','BufNewFile','BufWinEnter'}, {
  group = vim.api.nvim_create_augroup('TS_FOLD_WORKAROUND', {}),
  callback = function()
    vim.opt.foldmethod     = 'expr'
    vim.opt.foldexpr       = 'nvim_treesitter#foldexpr()'
  end
})
