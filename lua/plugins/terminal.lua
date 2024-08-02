return {
	"akinsho/toggleterm.nvim",
	version = "*",
	opts = {
		open_mapping = [[<c-`>]],
		direction = "float",
		size = { width = 0.8, height = 0.8 },
		terminal = {
			cmd = "bash",
		},
		on_open = function(term)
			-- Disable all keystrokes in all modes
			vim.cmd([[noremap <buffer> <silent> * <Nop>]])
			vim.cmd([[noremap <buffer> <silent> <space> <Nop>]])
			vim.cmd([[inoremap <buffer> <silent> <expr> ""]])
			vim.cmd([[vnoremap <buffer> <silent> <expr> ""]])
			-- Add more keymap disabling as needed

			-- Map essential terminal keys
			vim.api.nvim_set_keymap("t", "<C-l>", "<esc>:clear<CR>", { noremap = true, silent = true }) -- Clear terminal
		end,
	},
}
