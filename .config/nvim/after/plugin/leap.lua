local leap = require('leap')
if Bepo then
    vim.api.nvim_set_keymap('n', '’', "<Plug>(leap-forward-to)", {});
    vim.api.nvim_set_keymap('n', '?', "<Plug>(leap-backward-to)", {});
    -- vim.api.nvim_set_keymap('n', '’', "<Plug>leap-forward-till", {});
    -- vim.api.nvim_set_keymap('n', '’', "<Plug>leap-backward-till", {});
else
    leap.add_default_mappings()
end
