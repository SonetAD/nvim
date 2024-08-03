--load option_list
local optionsList = require("sonet.vscode.options_list")

--loop and set up options to vim
for key, val in pairs(optionsList) do
	vim.opt[key] = val
end

vim.opt.shortmess:append("c")

vim.cmd("let g:netrw_liststyle = 3")
