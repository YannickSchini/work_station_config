return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"neovim/nvim-lspconfig",
		{ "VonHeikemen/lsp-zero.nvim", branch = "v4.x" },
	},
	config = function()
		local options = { noremap = true, silent = true }

		local function lsp_attach(_, buffer)
			vim.api.nvim_buf_set_keymap(buffer, "n", "<Leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", options)
			vim.api.nvim_buf_set_keymap(buffer, "n", "<Leader>gd", "<cmd>lua vim.lsp.buf.definition()<CR>", options)
			vim.api.nvim_buf_set_keymap(buffer, "n", "<Leader>gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", options)
			vim.api.nvim_buf_set_keymap(buffer, "n", "<Leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", options)
		end

		require("lsp-zero").extend_lspconfig({
			sign_text = true,
			lsp_attach = lsp_attach,
			capabilities = require("cmp_nvim_lsp").default_capabilities(),
		})
	end,
}
