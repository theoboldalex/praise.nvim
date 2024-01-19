local api = vim.api
local namespace = api.nvim_create_namespace("typelens")

local function set_extmark(ns, line, chunk)
    local buf = 0
    local col = 0
    local opts = {
        virt_text = { chunk },
    }

    return api.nvim_buf_set_extmark(buf, ns, line - 1, col, opts)
end

local cursor = api.nvim_win_get_cursor(0)
local line = cursor[1]

set_extmark(namespace, line, { "Welcome to TypeLens", "Comment" })
