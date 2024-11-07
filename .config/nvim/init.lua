Bepo = os.execute("lsusb | rg ErgoDox") == 0
if Bepo then require("config.bepo_movement") end
require("config")

vim.cmd("colorscheme tokyonight")
