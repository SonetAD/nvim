return {
  "rachartier/tiny-inline-diagnostic.nvim",
  event = "LspAttach",
  priority = 1000,
  config = function()
    -- disable default virtual text — tiny-inline-diagnostic replaces it
    vim.diagnostic.config({ virtual_text = false })

    require("tiny-inline-diagnostic").setup({
      preset = "powerline",
      options = {
        show_source = true,
        throttle = 20,
        softwrap = 30,
        multilines = true,
        show_all_diags_on_cursorline = true,
        enable_on_insert = false,
      },
    })
  end,
}
