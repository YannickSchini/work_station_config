local map = vim.keymap.set
local unmap = vim.keymap.unset

-- Remaper la gestion des fenêtres
-- ———————————————————————————————
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-h>", "<C-w>h")
map("n", "<C-l>", "<C-w>l")
