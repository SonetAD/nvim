local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --

--exicute macro saved in a
keymap("n", "<leader>a", "<S-@>", { desc = "Macros a exicute" })

-- Split window
keymap("n", "<leader>s", "<C-w>s", { desc = "Horizontal window split " })
keymap("n", "<leader>v", "<C-w>v", { desc = "Vertical split " })

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", { desc = "Left Screen " })
keymap("n", "<C-j>", "<C-w>j", { desc = "Screen Down " })
keymap("n", "<C-k>", "<C-w>k", { desc = "Screen Up" })
keymap("n", "<C-l>", "<C-w>l", { desc = "Right ScreenUp" })

--tab section
keymap("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
keymap("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
keymap("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
keymap("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })

--toggle file explorer
keymap("n", "<leader>e", ":Lex 30<cr>", { desc = "toggle file explorer" })

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", { desc = "Next Buffer" })
keymap("n", "<S-h>", ":bprevious<CR>", { desc = "Previous Buffer" })

-- move start and end of the line
keymap("n", "0", "^", { desc = "Move to start of the line" })
keymap("n", "9", "$", { desc = "Move Curson end of the line" })

-- Delete the entire content of the file
keymap("n", "da", ":%d<cr>", { desc = "Delete entire file" })

-- redo
keymap("n", "r", "<C-r>", { desc = "Redo" })

-- search and replace
keymap("n", "m", ":%s/", { desc = "Search and replace" })

-- delete search highlight
keymap("n", "<leader>h", ":nohlsearch <cr>", { desc = "Remove selected highlight" })
--

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- change paste behaviour
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "<C-j>", ":move '>+1<CR>gv-gv", { desc = "Move Selected Text Down" })
keymap("x", "<C-k>", ":move '<-2<CR>gv-gv", { desc = "Move Selected Text Up" })
