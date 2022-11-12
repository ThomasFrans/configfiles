local api = vim.api;

api.nvim_create_augroup("General", { clear = true })
api.nvim_create_autocmd(
    { "TextYankPost" },
    {
        group = "General",
        command = "silent! lua vim.highlight.on_yank({higroup=\"IncSearch\", timeout=200})"
    }
)

-- FUUUUUCK this wasted so much of my time. Almost switched back to VS****!
api.nvim_create_autocmd(
    { "BufRead", "BufNewFile" },
    {
        pattern = { "*.php", "*.hbs" },
        group = "General",
        command = "silent! set filetype=html"
    }
)
