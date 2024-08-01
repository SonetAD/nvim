--open ccodeium chat on key press

vim.keymap.set("n", "<leader>cc", function()
	vim.api.nvim_call_function("codeium#Chat", {})
end)
