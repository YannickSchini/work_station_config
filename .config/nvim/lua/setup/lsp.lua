local lspconfig = require("lspconfig")

local servers = {
    "bashls",
    "dockerls",
    "jsonls",
    "jedi_language_server",
    "rust_analyzer",
    "sumneko_lua",
    "terraformls",
    "yamlls",
}

require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = servers
})

local options = { noremap = true, silent = true }

-- vim.api.nvim_set_keymap('n', "<Leader>e", "<cmd>lua vim.diagnostic.open_float()<CR>", options)
-- vim.api.nvim_set_keymap('n', "<Leader>E", "<cmd>lua vim.diagnostic.setloclist()<CR>", options)
-- vim.api.nvim_set_keymap('n', "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", options)
-- vim.api.nvim_set_keymap('n', "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", options)

local on_attach = function(_, buffer)
    vim.api.nvim_buf_set_keymap(buffer, "n", "<Leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", options)
    vim.api.nvim_buf_set_keymap(buffer, "n", "<Leader>gtd", "<cmd>lua vim.lsp.buf.declaration()<CR>", options)
    vim.api.nvim_buf_set_keymap(buffer, "n", "<Leader>gtD", "<cmd>lua vim.lsp.buf.definition()<CR>", options)
    vim.api.nvim_buf_set_keymap(buffer, "n", "<Leader>i", "<cmd>lua vim.lsp.buf.implementation()<CR>", options)
    vim.api.nvim_buf_set_keymap(buffer, "n", "<Leader>r", "<cmd>lua vim.lsp.buf.rename()<CR>", options)
    vim.api.nvim_buf_set_keymap(buffer, "n", "<Leader>R", "<cmd>lua vim.lsp.buf.references()<CR>", options)
    vim.api.nvim_buf_set_keymap(buffer, "n", "<Leader>f", "<cmd>lua vim.lsp.buf.format{async=true}<CR>", options)
end

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

for _, server in ipairs(servers) do
    if server == 'sumneko_lua' then
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
    -- elseif server == "rust_analyzer" then
    --     require('rust-tools').setup({
    --         server = {
    --             on_attach = on_attach,
    --             capabilities = capabilities
    --         }
    --     })
    else
        lspconfig[server].setup({
            on_attach = on_attach,
            capabilities = capabilities
        })
    end
end
