local M = {}

function M.is_current_line_saved()
    local current_line_number = vim.fn.line(".")
    local current_line_content = vim.api.nvim_get_current_line()
    local current_line_at_last_save = vim.fn.getbufline("%", current_line_number, "u")[1]

    return current_line_content == current_line_at_last_save
end

return M
