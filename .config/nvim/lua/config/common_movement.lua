-- Map le changement de buffer sur TAB
-- ———————————————————————————————
local cur_buf = vim.api.nvim_get_current_buf
local set_buf = vim.api.nvim_set_current_buf

local function buf_index(bufnr)
    local bufs = vim.iter(vim.api.nvim_list_bufs()):filter(vim.api.nvim_buf_is_loaded):totable()
    for i, value in ipairs(bufs) do
        if value == bufnr then
            return i
        end
    end
end

local function next_buf()
    local bufs = vim.iter(vim.api.nvim_list_bufs()):filter(vim.api.nvim_buf_is_loaded):totable()
    local curbufIndex = buf_index(cur_buf())

    if not curbufIndex then
        set_buf(bufs[1])
        return
    end

    set_buf((curbufIndex == #bufs and bufs[1]) or bufs[curbufIndex + 1])
end

local function prev_buf()
    local bufs = vim.iter(vim.api.nvim_list_bufs()):filter(vim.api.nvim_buf_is_loaded):totable()
    local curbufIndex = buf_index(cur_buf())

    if not curbufIndex then
        set_buf(bufs[1])
        return
    end

    set_buf((curbufIndex == 1 and bufs[#bufs]) or bufs[curbufIndex - 1])
end

local map = vim.keymap.set
local unmap = vim.keymap.unset

map("n", "<TAB>", function() next_buf() end, { desc = "buffer goto next" })
map("n", "<S-TAB>", function() prev_buf() end, { desc = "buffer goto prev" })
