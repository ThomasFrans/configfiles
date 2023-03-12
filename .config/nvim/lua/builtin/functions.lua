---Function for easy setup of buffer local options.
---@param textwidth integer?
---@param tabwidth integer?
function SetupBuffer(textwidth, tabwidth)
    if tabwidth ~= nil then
        vim.opt_local.textwidth = textwidth
    end
    if tabwidth ~= nil then
        vim.opt_local.shiftwidth = tabwidth
        vim.opt_local.tabstop = tabwidth
        vim.opt_local.softtabstop = tabwidth
    end
end
