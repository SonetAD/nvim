return {
  -- Smear cursor: animated cursor movement across the screen
  {
    "sphamba/smear-cursor.nvim",
    event = "VeryLazy",
    opts = {
      stiffness = 0.8,
      trailing_stiffness = 0.5,
      distance_stop_animating = 0.5,
      hide_target_hack = true,
    },
  },

  -- Mini animate: smooth scrolling, window open/close/resize animations
  {
    "echasnovski/mini.animate",
    version = "*",
    event = "VeryLazy",
    opts = {
      scroll = {
        enable = true,
        timing = function(_, n) return math.max(150 / n, 10) end,
      },
      cursor = { enable = false }, -- handled by smear-cursor
      resize = { enable = true },
      open = { enable = true },
      close = { enable = true },
    },
  },
}
