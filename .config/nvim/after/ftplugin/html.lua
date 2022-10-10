local function run()
    vim.cmd("!firefox %")
end

vim.keymap.set('n', "<leader>gr", run, {noremap=true, buffer=0})
vim.opt_local.shiftwidth = 2

