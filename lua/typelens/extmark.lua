local M = {}
local api = vim.api

function M.set(ns, line, chunk)
    local buf = 0
    local col = 0
    local opts = {
        virt_text = { chunk },
    }

    return api.nvim_buf_set_extmark(buf, ns, line - 1, col, opts)
end


return M
