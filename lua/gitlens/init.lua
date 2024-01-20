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

    vim.api.nvim_create_autocmd({ "CursorMoved" }, {
        buffer = 0,
        callback = function()
            git.clear()
        end,
        desc = "Clears the Git Blame virtual text"
    })
end

return M
