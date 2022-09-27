
local api = vim.api;

api.nvim_create_augroup("General", {});

-- Delete all tabs and spaces at the end of all lines.
api.nvim_create_autocmd({"BufWritePre"}, {
    command = "silent! %s/[\\ \\t]*$//g|norm!``"
})
