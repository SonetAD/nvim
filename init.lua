if vim.g.vscode then
	--init keymaps
	require("sonet.vscode.keymaps")

	--init keymaps
	require("sonet.vscode.options")
else
	--
	--init options
	require("sonet.options")

	--init keymaps
	require("sonet.keymaps")

	--init odeium
	require("sonet.codeium_config")

	-- init lazy.nvim
	require("lazy.init")
end
