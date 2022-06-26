
local function run()
    vim.cmd("!latexmk -pdf")
    vim.cmd("!evince *.pdf &")
end

local function build()
    vim.cmd("!latexmk -pdf")
end

vim.keymap.set('n', "<leader>gr", run, {noremap=true, silent=true, buffer=0})
vim.keymap.set('n', "<leader>gb", build, {noremap=true, buffer=0})

