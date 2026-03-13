return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("tokyonight").setup({
      style = "night", -- darkest variant: near-black bg with neon syntax
      transparent = false,
      terminal_colors = true,
      styles = {
        comments = { italic = true },
        keywords = { italic = true, bold = true },
        functions = { bold = true },
        variables = {},
        sidebars = "dark",
        floats = "dark",
      },
      on_highlights = function(hl, c)
        hl.CursorLineNr = { fg = c.orange, bold = true }
        hl.LineNr = { fg = "#3b4261" }
        hl.WinSeparator = { fg = c.blue0, bold = true }
        hl.NvimTreeNormal = { bg = "#13131e" }
        hl.NvimTreeWinSeparator = { fg = "#13131e" }

        -- Comments: white text on bright red bg — high visibility
        local comment_style = { fg = "#ffffff", bg = "#c0392b", italic = true, bold = true }
        hl.Comment                   = comment_style
        hl["@comment"]               = comment_style
        hl["@comment.documentation"] = comment_style
      end,
    })
    vim.cmd("colorscheme tokyonight-night")
  end,
}
