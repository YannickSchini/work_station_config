if Bepo then
    vim.api.nvim_del_keymap('n', 'cs')
    vim.api.nvim_del_keymap('n', 'cS')
    vim.api.nvim_set_keymap('n', 'ls', "<Plug>Csurround", {});
    vim.api.nvim_set_keymap('n', 'lS', "<Plug>CSurround", {});
end
