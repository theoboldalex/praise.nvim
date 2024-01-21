local git = require("gitlens.git")

vim.api.nvim_create_autocmd({ "CursorMoved" } , {
    callback = function()
        git.clear()
    end,
    desc = "Clear the inline Git Blame virtual text"
})

vim.api.nvim_create_autocmd({ "CursorHold", "BufEnter" }, {
    callback = function()
        git.blame()
    end,
    desc = "Renders the Git Blame virtual text"
})
