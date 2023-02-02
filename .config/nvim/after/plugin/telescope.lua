-- Keymaps
vim.keymap.set("n", "<Leader>gf", ":Telescope git_files<CR>")
vim.keymap.set("n", "<Leader>ff", ":Telescope find_files<CR>")
vim.keymap.set("n", "<Leader>rg", ":Telescope live_grep<CR>")
vim.keymap.set("n", "<Leader>R", ":Telescope lsp_references<CR>")
vim.keymap.set("n", "<Leader>dd", ":Telescope diagnostics<CR>")
vim.keymap.set("n", "<Leader>h", ":Telescope help_tags<CR>")

if Bepo then
    vim.keymap.set("n", "<Leader>x", ":Telescope buffers<CR>")
else
    vim.keymap.set("n", "<Leader>c", ":Telescope buffers<CR>")
end

-- Configuration so that find_files gets all the hidden files except for the .git folder
local telescope = require("telescope")
local telescopeConfig = require("telescope.config")

-- Clone the default Telescope configuration
local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }

-- I want to search in hidden/dot files.
table.insert(vimgrep_arguments, "--hidden")
-- I don't want to search in the `.git` directory.
table.insert(vimgrep_arguments, "--glob")
table.insert(vimgrep_arguments, "!.git/*")

telescope.setup({
	defaults = {
		-- `hidden = true` is not supported in text grep commands.
		vimgrep_arguments = vimgrep_arguments,
	},
	pickers = {
		find_files = {
			-- `hidden = true` will still show the inside of `.git/` as it's not ignored in the `.gitignore` file.
			find_command = { "rg", "--files", "--hidden", "--glob", "!.git/*" }
		},
	},
})
