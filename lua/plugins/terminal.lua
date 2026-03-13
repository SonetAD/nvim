return {
  "akinsho/toggleterm.nvim",
  version = "*",
  keys = { { "<leader>t", desc = "Toggle terminal" } },
  opts = {
    open_mapping = [[<leader>t]],
    direction = "float",
    float_opts = {
      border = "rounded",
      width = math.floor(vim.o.columns * 0.85),
      height = math.floor(vim.o.lines * 0.85),
    },
    shell = vim.o.shell,
  },
}
