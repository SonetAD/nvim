# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this repo is

Personal Neovim configuration using **lazy.nvim** as the plugin manager. All config is written in Lua.

## How to apply changes

There is no build step. Changes take effect by:
- Reloading a single file inside Neovim: `:source %`
- Reloading the colorscheme: `:colorscheme tokyonight-night`
- Installing/updating/removing plugins: `:Lazy sync`
- Checking plugin status: `:Lazy`
- Restarting LSP after lsp changes: `<leader>rs`

## Architecture

```
init.lua                  ← entry point: loads options → keymaps → lazy
lua/
  sonet/
    options_list.lua      ← table of vim.opt settings (key/value pairs)
    options.lua           ← loops over options_list and applies them
    keymaps.lua           ← all global keymaps (leader = Space)
  lazy/
    init.lua              ← bootstraps lazy.nvim, imports plugins/ and plugins/lsp/
  plugins/
    lsp/
      mason.lua           ← installs LSP servers + formatters/linters via Mason
      lsp_config.lua      ← configures each LSP server, all LSP keymaps live here
    colorscheme.lua       ← tokyonight-night; comment highlights overridden here
    indent_blank_line.lua ← rainbow-delimiters + ibl rainbow indent guides
    error_lens.lua        ← tiny-inline-diagnostic (VSCode Error Lens equivalent)
    *.lua                 ← one file per plugin, auto-imported by lazy
```

**Key pattern:** Every file under `lua/plugins/` returns a lazy.nvim plugin spec (a table). Lazy auto-imports all of them. Adding a plugin = creating a new file there.

**Options pattern:** `options_list.lua` returns a plain table. `options.lua` applies it with `vim.opt[key] = val`. Add new vim options to `options_list.lua` only.

**Keymaps pattern:** Global keymaps go in `sonet/keymaps.lua`. Plugin-specific keymaps are defined inside that plugin's config function (e.g. telescope keymaps are in `telescope.lua`). LSP keymaps are in `lsp/lsp_config.lua` inside the `LspAttach` autocmd.

## LSP / Tooling

- **LSP servers** managed by Mason: `tsserver`, `html`, `cssls`, `tailwindcss`, `lua_ls`, `emmet_ls`, `swift_mesonls`
- **Formatters**: prettier (JS/TS/HTML/CSS), stylua (Lua), black + isort (Python) — via `conform.nvim`
- **Linters**: eslint_d (JS/TS), pylint (Python) — via `nvim-lint`
- To add a new LSP server: add to `mason.lua` `ensure_installed` list AND add a handler in `lsp_config.lua` `setup_handlers` if non-default config is needed

## Key bindings reference

| Key | Action |
|-----|--------|
| `Space` | Leader |
| `jj` | Exit insert + save |
| `<leader>f` | Find files (Telescope) |
| `<leader>fs` | Live grep project |
| `<leader>/` | Search current buffer |
| `<leader>e` | File explorer (netrw) |
| `<leader>lg` | LazyGit |
| `<leader>1-4` | Harpoon marks |
| `<C-/>` | Toggle comment (line in normal, block in visual multi-line) |
| `<S-h>` / `<S-l>` | Previous / next buffer |
| `gd`, `gR`, `gi`, `gt` | LSP: definition, references, implementations, type def |
| `<leader>ca` | Code actions |
| `<leader>rn` | Rename symbol |
| `[d` / `]d` | Previous / next diagnostic |

## Theme

`tokyonight-night`. Comment highlight overrides (`hl.Comment`, `hl["@comment"]`) are set inside `on_highlights` in `colorscheme.lua` — edit there to change comment colors.
