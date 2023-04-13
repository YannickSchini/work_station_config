local lspconfig = require("lspconfig")

local servers = {
    "bashls",
    "dockerls",
    "jsonls",
    "pyright",
    "rust_analyzer",
    "lua_ls",
    "terraformls",
    "yamlls",
    "ruff_lsp",
}

require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = servers
})

local options = { noremap = true, silent = true }

vim.api.nvim_set_keymap('n', "<Leader>dD", "<cmd>lua vim.diagnostic.open_float()<CR>", options)
-- vim.api.nvim_set_keymap('n', "<Leader>E", "<cmd>lua vim.diagnostic.setloclist()<CR>", options)
vim.api.nvim_set_keymap('n', "<Leader>dp", "<cmd>lua vim.diagnostic.goto_prev()<CR>", options)
vim.api.nvim_set_keymap('n', "<Leader>dn", "<cmd>lua vim.diagnostic.goto_next()<CR>", options)

local on_attach = function(_, buffer)
    vim.api.nvim_buf_set_keymap(buffer, "n", "<Leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", options)
    vim.api.nvim_buf_set_keymap(buffer, "n", "<Leader>gd", "<cmd>lua vim.lsp.buf.definition()<CR>", options)
    vim.api.nvim_buf_set_keymap(buffer, "n", "<Leader>i", "<cmd>lua vim.lsp.buf.implementation()<CR>", options)
    vim.api.nvim_buf_set_keymap(buffer, "n", "<Leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", options)
    vim.api.nvim_buf_set_keymap(buffer, "n", "<Leader>f", "<cmd>lua vim.lsp.buf.format(){async=true}<CR>", options)
end

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

local get_root_dir = function(filename, _)
	local root_files = {
		"pyproject.toml",
	}
	local fallback_root_files = {
		".git",
	}
	local primary = lspconfig.util.root_pattern(unpack(root_files))(filename)
	local fallback = lspconfig.util.root_pattern(unpack(fallback_root_files))(filename)
	return primary or fallback
end

for _, server in ipairs(servers) do

    if server == 'lua_ls' then
        lspconfig[server].setup({
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim" },
                    },
                },
            },
            on_attach = on_attach,
            capabilities = capabilities
        })

    elseif server == "rust_analyzer" then
        require('rust-tools').setup({
            server = {
                on_attach = on_attach,
                capabilities = capabilities
            }
        })

    elseif server == "pyright" then
		server_opts = {
			root_dir = get_root_dir,
			capabilities = capabilities,
			on_attach = on_attach,
            settings = {
                python = {
                    pythonPath = vim.fn.trim(vim.fn.system 'pyenv which python3')
                }
            }
    }
		lspconfig[server].setup(server_opts)

    else
        lspconfig[server].setup({
            on_attach = on_attach,
            capabilities = capabilities
        })
    end
end
