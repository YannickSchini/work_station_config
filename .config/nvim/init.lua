bepo = os.execute("lsusb | rg ErgoDox") == 0
if bepo then require("config.bepo_movement") end
require("config")
