local git = require("gitlens.git")
local M = {}

function M.setup()
    vim.keymap.set("n", "gb", function()
        git.blame()
    end)
end

return M
