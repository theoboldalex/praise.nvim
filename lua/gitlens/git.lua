local extmark = require("gitlens.extmark")
local M = {}
local api = vim.api

local function trim(s)
    return s:match("^%s*(.-)%s*$")
end

local function exec(cmd)
    local output = vim.fn.system(cmd)
    return trim(output)
end

function M.is_tracked_file(file_path)
    if file_path == "" then
        return false
    end

    local cmd = string.format("git ls-files --error-unmatch %s", file_path)
    local result = exec(cmd)

    return not string.match(result, "^error") and not string.match(result, "^fatal")
end

function M.clear()
    extmark.clear()
end

function M.blame()
    local file = api.nvim_buf_get_name(0)
    local cursor = api.nvim_win_get_cursor(0)
    local line = cursor[1]
    local blame_cmd = string.format(
    -- TODO: remove dependencies on awk and sed (as wonderful as they are)
        "git blame --date=relative -cL %d,%d %s | awk -F\\t '{ print $2 \": \" $3 }' | sed 's/^(//'",
        line,
        line,
        file
    )
    local output = exec(blame_cmd)

    extmark.set(line, { output, "Comment" })
end

return M
