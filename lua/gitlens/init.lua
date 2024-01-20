local git = require("gitlens.git")
local M = {}

function M.setup()
    -- TODO: create an autocmd which fires after last cursor move
    -- TODO: clear any previous virtual text from buffer on cursor move
    vim.keymap.set("n", "gb", function()
        git.blame()
    end)
    vim.keymap.set("n", "gx", function()
        git.clear()
    end)
end

return M
