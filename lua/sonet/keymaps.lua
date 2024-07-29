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
keymap("n", "<leader>a", "<S-@>", {desc='Macros a exicute'})

-- Split window
keymap("n", "<leader>s", "<C-w>s", {desc='Horizontal window split '})
keymap("n", "<leader>v", "<C-w>v", {desc='Vertical split '})

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", {desc='Left Screen '})
keymap("n", "<C-j>", "<C-w>j", {desc='Screen Down '})
keymap("n", "<C-k>", "<C-w>k", {desc='Screen Up'})
keymap("n", "<C-l>", "<C-w>k", {desc='Right ScreenUp'})

--toggle file explorer
keymap("n", "<leader>e", ":Lex 30<cr>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Nvigate ot the end of the line
keymap("n", "9", "<C-$>", opts)

-- Delete the entire content of the file
keymap("n", "da", ":%d<cr>", opts)

-- redo 
keymap("n", "r", "<C-r>", opts)

-- search and replace
keymap("n", "m", ":%s/", opts)

-- delete search highlight
keymap("n", "<leader>h", ":nohlsearch <cr>", opts)
--

-- Insert --
-- Press jj fast to enter
keymap("i", "jj", "<ESC>", opts)


-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)


-- change paste behaviour
keymap("v", "p", '"_dP', opts)


-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<C-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<C-k>", ":move '<-2<CR>gv-gv", opts)


-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)
