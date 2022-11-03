-- Keymaps
vim.keymap.set("n", "<Leader>gf", ":Telescope git_files<CR>")
vim.keymap.set("n", "<Leader>ff", ":Telescope find_files<CR>")
vim.keymap.set("n", "<Leader>rg", ":Telescope live_grep<CR>")

-- Configuration so that find_files gets all the hidden files except for the .git folder
local telescope = require("telescope")

telescope.setup({
	pickers = {
		find_files = {
			-- `hidden = true` will still show the inside of `.git/` as it's not ignored in the `.gitignore` file.
			find_command = { "rg", "--files", "--hidden", "--glob", "!.git/*" }
		},
	},
})
