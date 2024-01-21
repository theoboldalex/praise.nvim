local git = require("gitlens.git")
local M = {}

function M.setup()
    vim.api.nvim_create_autocmd({ "CursorHold" }, {
        buffer = 0,
        callback = function()
            -- this is a bug. We need to know if the current buffer has a file open
            -- and that the open file is tracked in git
            git.blame()
        end,
        desc = "Shows the Git Blame virtual text"
    })

    vim.api.nvim_create_autocmd({ "CursorMoved" }, {
        buffer = 0,
        callback = function()
            git.clear()
        end,
        desc = "Clears the Git Blame virtual text"
    })
end

return M
