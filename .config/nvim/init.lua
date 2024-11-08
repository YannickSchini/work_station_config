Bepo = os.execute("lsusb | rg ErgoDox") == 0
require("config.common_movement")
if Bepo then require("config.bepo_movement") else require("config.azerty_movement") end
require("config")

vim.cmd("colorscheme tokyonight")
