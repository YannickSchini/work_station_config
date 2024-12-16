-- Map le changement de buffer sur TAB
-- ———————————————————————————————
local map = vim.keymap.set
local unmap = vim.keymap.unset

-- Use TAB and S-TAB to cycle through open buffers
map("n", "<TAB>", ":bnext<CR>", { desc = "buffer goto next", silent = true })
map("n", "<S-TAB>", ":bprevious<CR>", { desc = "buffer goto prev", silent = true })

-- Use crtl-u to redo a change after an undo
map("n", "<C-u>", ":redo<CR>", { desc = "Redo after undo", silent = true })
