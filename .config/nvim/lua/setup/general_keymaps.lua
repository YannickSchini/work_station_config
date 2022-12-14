-- Helper pour afficher le chemin complet du fichier courant
vim.keymap.set({"n", "v"}, "<leader>pa", ":echo expand('%:p')<CR>")

-- Mouvement de la fenêtre
-- ------------------------------
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")

if Bepo then
    -- Source: https://bepo.fr/wiki/Vim

    -- Remap la sortie de l’insert mode
    vim.keymap.set("i", "àà", "<ESC>")

    -- {W} -> [É]
    -- ——————————
    -- On remappe W sur É :
    vim.keymap.set({"n", "v", "o"}, "é", "w")
    vim.keymap.set({"n", "v", "o"}, "É", "W")
    -- Corollaire: on remplace les text objects aw, aW, iw et iW
    -- pour effacer/remplacer un mot quand on n’est pas au début (daé / laé).
    vim.keymap.set({"v", "o"}, "aé", "aw")
    vim.keymap.set({"v", "o"}, "ié", "iw")
    vim.keymap.set({"v", "o"}, "aÉ", "aW")
    vim.keymap.set({"v", "o"}, "iÉ", "iW")
    -- Pour faciliter les manipulations de fenêtres, on utilise {W} comme un Ctrl+W :
    -- noremap w <C-w>
    -- noremap W <C-w><C-w>

    -- [HJKL] -> {CTSR}
    -- ————————————————
    -- {cr} = « gauche / droite »
    vim.keymap.set({"n", "v"}, "c", "h")
    vim.keymap.set({"n", "v"}, "r", "l")
    -- {ts} = « haut / bas »
    vim.keymap.set({"n", "v"}, "t", "j")
    vim.keymap.set({"n", "v"}, "s", "k")
    -- {CR} = « haut / bas de l'écran »
    -- vim.keymap.set({"n", "v"}, "C", "H")
    -- vim.keymap.set({"n", "v"}, "R", "L")
    -- {TS} = « joindre / aide »
    vim.keymap.set("n", "T", "J")
    vim.keymap.set("n", "S", "K")
    -- Corollaire : repli suivant / précédent
    vim.keymap.set("n", "zt", "zj")
    vim.keymap.set("n", "zs", "zk")

    -- {HJKL} <- [CTSR]
    -- ————————————————
    -- {J} = « Jusqu'à »            (j = suivant, J = précédant)
    vim.keymap.set({"n", "o"}, "j", "t")
    vim.keymap.set({"n", "o"}, "J", "T")
    -- {L} = « Change »             (l = attend un mvt, L = jusqu'à la fin de ligne)
    vim.keymap.set({"n", "v"}, "l", "c")
    vim.keymap.set({"n", "v"}, "L", "C")
    -- {H} = « Remplace »           (h = un caractère slt, H = reste en « Remplace »)
    vim.keymap.set({"n", "v"}, "h", "r")
    vim.keymap.set({"n", "v"}, "H", "R")
    -- {K} = « Substitue »          (k = caractère, K = ligne)
    vim.keymap.set({"n", "v"}, "k", "s")
    vim.keymap.set({"n", "v"}, "K", "S")

    -- Remaper la gestion des fenêtres
    -- ———————————————————————————————
    vim.keymap.set("n", "wt", "<C-w>j")
    vim.keymap.set("n", "ws", "<C-w>k")
    vim.keymap.set("n", "wc", "<C-w>h")
    vim.keymap.set("n", "wr", "<C-w>l")
    vim.keymap.set("n", "wd", "<C-w>c")
    vim.keymap.set("n", "wo", "<C-w>s")
    -- vim.keymap.set("n", "wp", "<C-w>o")

    -- Remapper è en "début de ligne"
    -- ——————————————————————————————
    vim.keymap.set("n", "è", "^")
    vim.keymap.set("n", "È", "0")

    -- Mouvement dans les buffers
    -- ——————————————————————————————
    vim.keymap.set("n", "<Leader>à", ":bprev<cr>", { silent = true })
    vim.keymap.set("n", "<Leader>y", ":bdelete<CR>", { silent = true })
    vim.keymap.set("n", "<Leader>.", ":bnext<CR>", { silent = true })
else
    vim.keymap.set("n", "<Leader>w", ":bprev<CR>", { silent = true })
    vim.keymap.set("n", "<Leader>x", ":bdelete<CR>", { silent = true })
    vim.keymap.set("n", "<Leader>v", ":bnext<CR>", { silent = true })
end
