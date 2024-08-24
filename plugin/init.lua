local git = require("praise.git")

vim.api.nvim_create_autocmd({ "CursorMoved" }, {
    callback = function()
        git.clear()
    end,
    desc = "Clear the inline Git Blame virtual text"
})

vim.api.nvim_create_autocmd({ "CursorHold", "BufEnter" }, {
    callback = function()
        if git.is_tracked_file(vim.fn.expand('%:p')) then
            git.clear()
            git.blame()
        end
    end,
    desc = "Renders the Git Blame virtual text"
})
