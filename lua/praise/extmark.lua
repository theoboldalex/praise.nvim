local api = vim.api
local M = {
    namespace = api.nvim_create_namespace("praise"),
    id = nil,
    buf = 0
}

function M.set(line, chunk)
    local opts = {
        virt_text = { chunk }
    }

    local id = api.nvim_buf_set_extmark(M.buf, M.namespace, line - 1, 0, opts)
    M.id = id
end

function M.clear()
    api.nvim_buf_clear_namespace(M.buf, M.namespace, 0, vim.fn.line("$"))
end

return M
