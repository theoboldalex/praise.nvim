local utils = require("gitlens.utils")
local extmark = require("gitlens.extmark")
local M = {}
local api = vim.api

local function exec(cmd)
    local output = vim.fn.system(cmd)
    return utils.trim(output)
end

local function is_tracked_file(file_path)
    return true
end

function M.clear()
    extmark.clear()
end

function M.blame()
    local file = api.nvim_buf_get_name(0)
    local cursor = api.nvim_win_get_cursor(0)
    local line = cursor[1]
    local blame_cmd = string.format(
        "git blame --date=relative -cL %d,%d %s | awk '{ print $2 \": \" $3 \" \" $4 \" \" $5 }' | sed 's/^(//'",
        line,
        line,
        file
    )
    local output = exec(blame_cmd)

    if is_tracked_file("<placeholder_please_replace_me>") then
        extmark.set(line, { output, "Comment" })
    end
end

return M
