local M = {}
local api = vim.api

function M.setup()
    local file = api.nvim_buf_get_name(0)
    local cursor = api.nvim_win_get_cursor(0)
    local line = cursor[1]
    local cmd = string.format("git blame -L %d,%d %s", line, line, file)

    local output = vim.fn.system(cmd)
    print(output)
end

M.setup()
local function set_extmark(ns, line, chunk)
    local buf = 0
    local col = 0
    local opts = {
        virt_text = { chunk },
    }

    return api.nvim_buf_set_extmark(buf, ns, line - 1, col, opts)
end

return M
