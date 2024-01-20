local git = require("gitlens.git")
local M = {}

function M.setup()
    vim.opt.updatetime = 2000
    vim.api.nvim_create_autocmd({ "CursorHold" }, {
        buffer = 0,
        callback = function()
            git.blame()
        end,
        desc = "Shows the Git Blame virtual text"
    })

    -- we need cursor pos both pre and post move
    local current_line = vim.api.nvim_win_get_cursor(0)
    -- this is a bug. We need to pass the line moved from so we can calculate where to clear old text
    vim.api.nvim_create_autocmd({ "CursorMoved" }, {
        buffer = 0,
        callback = function()
            git.clear(current_line)
        end,
        desc = "Clears the Git Blame virtual text"
    })
end

return M
