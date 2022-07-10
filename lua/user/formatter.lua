local formatter = require("formatter")

local function clang_format()
    return {
        exe = "clang-format",
        args = {
            "--assume-filename",
            vim.fn.shellescape(vim.api.nvim_buf_get_name(0)),
        },
        stdin = true,
        cwd = vim.fn.expand("%:p:h"),
    }
end

formatter.setup({
    filetype = {
        c = { clang_format },
        cpp = { clang_format },
    },
})

vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = "*",
    command = "silent! FormatWrite",
})
