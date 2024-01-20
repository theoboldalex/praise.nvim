local api = vim.api
local M = {
    namespace = api.nvim_create_namespace("gitlens"),
    id = nil
}

function M.set(line, chunk)
    local buf = 0
    local col = 0
    local opts = {
        virt_text = { chunk }
    }

    local id = api.nvim_buf_set_extmark(buf, M.namespace, line - 1, col, opts)
    M.id = id
end

function M.clear(line)
    local buf = 0
    api.nvim_buf_clear_namespace(buf, M.namespace, line - 1, line)
end

return M
