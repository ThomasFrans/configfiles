

local function run()
    vim.cmd("!marker -p % &")
end

vim.keymap.set('n', "<leader>gr", run, {noremap=true, silent=true, buffer=0})

