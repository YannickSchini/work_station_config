local map = vim.keymap.set
local unmap = vim.keymap.unset

-- Source: https://bepo.fr/wiki/Vim

-- {W} -> [É]
-- ——————————
-- On remappe W sur É :
map({ "n", "v", "o" }, "é", "w")
map({ "n", "v", "o" }, "É", "W")
-- Corollaire: on remplace les text objects aw, aW, iw et iW
-- pour effacer/remplacer un mot quand on n’est pas au début (daé / laé).
map({ "v", "o" }, "aé", "aw")
map({ "v", "o" }, "ié", "iw")
map({ "v", "o" }, "aÉ", "aW")
map({ "v", "o" }, "iÉ", "iW")

-- [HJKL] -> {CTSR}
-- ————————————————
-- {cr} = « gauche / droite »
map({ "n", "v" }, "c", "h")
map({ "n", "v" }, "r", "l")
-- {ts} = « haut / bas »
map({ "n", "v" }, "t", "j")
map({ "n", "v" }, "s", "k")
-- {CR} = « haut / bas de l'écran »
map({ "n", "v" }, "C", "H")
map({ "n", "v" }, "R", "L")
-- {TS} = « joindre / aide »
map("n", "T", "J")
map("n", "S", "K")
-- Corollaire : repli suivant / précédent
map("n", "zt", "zj")
map("n", "zs", "zk")

-- {HJKL} <- [CTSR]
-- ————————————————
-- {J} = « Jusqu'à »            (j = suivant, J = précédant)
map({ "n", "o" }, "j", "t")
map({ "n", "o" }, "J", "T")
-- {L} = « Change »             (l = attend un mvt, L = jusqu'à la fin de ligne)
map({ "n", "v" }, "l", "c")
map({ "n", "v" }, "L", "C")
-- {H} = « Remplace »           (h = un caractère slt, H = reste en « Remplace »)
map({ "n", "v" }, "h", "r")
map({ "n", "v" }, "H", "R")
-- {K} = « Substitue »          (k = caractère, K = ligne)
map({ "n", "v" }, "k", "s")
map({ "n", "v" }, "K", "S")

-- Remapper è en "début de ligne"
-- ——————————————————————————————
map("n", "è", "^")
map("n", "È", "0")

-- Remaper la gestion des fenêtres
-- ———————————————————————————————
map("n", "<C-c>", "<C-w>j")
map("n", "<C-t>", "<C-w>k")
map("n", "<C-s>", "<C-w>h")
map("n", "<C-r>", "<C-w>l")
