local utils = require("gitlens.utils")
local extmark = require("gitlens.extmark")
local M = {}
local api = vim.api

local function exec(cmd)
    local output = vim.fn.system(cmd)
    return utils.trim(output)
end

function M.blame()
    local file = api.nvim_buf_get_name(0)
    local cursor = api.nvim_win_get_cursor(0)
    local line = cursor[1]
    local cmd = string.format(
        "git blame --date=relative -cL %d,%d %s | awk '{ print $2 \": \" $3 \" \" $4 \" \" $5 }' | sed 's/^(//'",
        line,
        line,
        file
    )
    local output = exec(cmd)

    extmark.set(line, { output, "Comment" })
end

function M.clear()
    extmark.clear()
end

return M
