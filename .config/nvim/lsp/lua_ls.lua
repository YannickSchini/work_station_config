return {
	cmd = { "lua-language-server" },
	filetypes = { "lua" },
    root_markers = { ".git" },
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
	single_file_support = true,
}
