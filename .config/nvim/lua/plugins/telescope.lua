return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local telescope = require("telescope")

		telescope.setup({
			pickers = {
				buffers = {
					show_all_buffers = true,
					sort_lastused = true,
				},
			},
			find_files = {
				-- `hidden = true` will still show the inside of `.git/` as it's not ignored in the `.gitignore` file.
				find_command = { "rg", "--files", "--hidden", "--glob", "!.git/*" }
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
			"<Leader>gf",
			function()
				require("telescope.builtin").git_files()
			end,
			desc = "Telescope git files",
		},

		{
			"<Leader>ff",
			function()
				require("telescope.builtin").find_files()
			end,
			desc = "Telescope find files",
		},

		{
			"<Leader>r",
			function()
				require("telescope.builtin").lsp_references()
			end,
			desc = "Telescope LSP references",
		},

		{
			"<Leader>rg",
			function()
				require("telescope.builtin").live_grep()
			end,
			desc = "Telescope live grep",
		},

		{
			"<Leader>*",
			function()
				require("telescope.builtin").grep_string()
			end,
			desc = "Telescope grep selection or under cursor",
			mode = { "n", "v" },
		},
	}
}
