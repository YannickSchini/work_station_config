if Bepo then
    keymaps = {
        change = "ls",
        change_line = "lS",
    }
else
    keymaps = {}
end

return {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
        require("nvim-surround").setup({
            keymaps = keymaps,
        })
    end
}
