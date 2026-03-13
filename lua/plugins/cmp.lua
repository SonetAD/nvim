return {
  "saghen/blink.cmp",
  version = "*",
  dependencies = {
    {
      "L3MON4D3/LuaSnip",
      version = "v2.*",
      build = "make install_jsregexp",
      dependencies = { "rafamadriz/friendly-snippets" },
    },
  },
  opts = {
    keymap = {
      preset = "none",
      ["<C-Space>"] = { "show", "fallback" },
      ["<C-e>"] = { "hide" },
      ["<Tab>"] = { "select_and_accept", "fallback" },
      ["<C-k>"] = { "select_prev", "fallback" },
      ["<C-j>"] = { "select_next", "fallback" },
      ["<C-b>"] = { "scroll_documentation_up", "fallback" },
      ["<C-f>"] = { "scroll_documentation_down", "fallback" },
    },
    appearance = {
      nerd_font_variant = "mono",
      kind_icons = {
        Text = "󰉿",
        Method = "󰆧",
        Function = "󰊕",
        Constructor = "",
        Field = "󰜢",
        Variable = "󰀫",
        Class = "󰠱",
        Interface = "",
        Module = "",
        Property = "󰜢",
        Unit = "󰑭",
        Value = "󰎠",
        Enum = "",
        Keyword = "󰌋",
        Snippet = "",
        Color = "󰏘",
        File = "󰈙",
        Reference = "󰈇",
        Folder = "󰉋",
        EnumMember = "",
        Constant = "󰏿",
        Struct = "󰙅",
        Event = "",
        Operator = "󰆕",
        TypeParameter = "",
      },
    },
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
      providers = {
        lsp = {
          -- only show LSP items with a score boost, never fall back to low-confidence items
          min_keyword_length = 0,
          score_offset = 5,
        },
        buffer = {
          -- show buffer words only when LSP gives nothing
          min_keyword_length = 3,
          score_offset = -5,
          max_items = 5,
        },
        path = {
          score_offset = 3,
        },
      },
    },
    snippets = {
      preset = "luasnip",
    },
    completion = {
      -- start completing immediately
      trigger = {
        show_on_insert_on_trigger_character = true,
        show_on_keyword = true,
        show_on_accept_on_trigger_character = true,
      },
      -- accept the completion and expand snippet in one step
      accept = {
        auto_brackets = { enabled = true },
      },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 50,
        update_delay_ms = 50,
        window = {
          border = "rounded",
          max_width = 80,
          max_height = 20,
        },
      },
      ghost_text = {
        enabled = true,
        show_with_selection = true,
      },
      menu = {
        min_width = 15,
        max_height = 12,
        border = "rounded",
        draw = {
          gap = 1,
          columns = {
            { "kind_icon", width = { fixed = 2 } },
            { "label", "label_description", gap = 1 },
            { "kind" },
          },
          components = {
            kind_icon = {
              ellipsis = false,
              text = function(ctx)
                return ctx.kind_icon .. ctx.icon_gap
              end,
              highlight = function(ctx)
                return "BlinkCmpKind" .. ctx.kind
              end,
            },
          },
        },
      },
    },
    signature = {
      enabled = true,
      trigger = {
        show_on_insert_on_trigger_character = true,
      },
      window = {
        border = "rounded",
        max_height = 10,
      },
    },
    fuzzy = {
      use_typo_resistance = true,
      use_proximity = true,
      frecency = { enabled = true },
      prebuilt_binaries = { download = true },
    },
  },
  opts_extend = { "sources.default" },
}
