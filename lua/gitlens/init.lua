local git = require("gitlens.git")
local api = vim.api
local M = {}

function M.setup()
    vim.opt.updatetime = 2000
    api.nvim_create_autocmd({ "CursorHold" }, {
        buffer = 0,
        callback = function()
            git.blame()
        end,
        desc = "Shows the Git Blame virtual text"
    })

    -- this is a bug. We need to pass the line moved from so we can calculate where to clear old text
    api.nvim_create_autocmd({ "CursorMoved" }, {
        buffer = 0,
        callback = function()
            git.clear()
        end,
        desc = "Clears the Git Blame virtual text"
    })
end

return M
