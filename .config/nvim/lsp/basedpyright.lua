return {
    cmd = { "basedpyright-langserver", "--stdio" },
    filetypes = { "python" },
    root_markers = { ".git", ".jj", "pyproject.toml" },
    settings = {
        -- Using Ruff's import organizer
        disableOrganizeImports = true,
        python = {
            pythonPath = vim.fn.trim(vim.fn.system 'which python3'),
            analysis = {
                -- Ignore all files for analysis to exclusively use Ruff for linting
                ignore = { '*' },
            },
        },
    }
}
