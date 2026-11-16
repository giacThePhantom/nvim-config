# Neovim configuration

Plain Lua, a handful of plugins, no distribution. Plugins are managed by
Neovim's built-in `vim.pack` and pinned in `nvim-pack-lock.json`, so a clone
gives the same setup on any machine.

## Install

```sh
git clone REPOSITORY ~/.config/nvim
nvim   # the first start installs the plugins at the locked versions
```

Needs Neovim 0.12+, `git`, `ripgrep` and `fd`; for tree-sitter grammars also
a C compiler and the `tree-sitter` CLI (without them, Neovim falls back to
regex highlighting). On NixOS, `~/.config/nixos` (`modules/editor.nix`)
provides these and the desktop palette as `nixos_palette.lua`.

## Layout

```
init.lua               leader keys, then everything below in order
lua/config/            options, keymaps, autocmds (no plugins)
lua/plugins/           one file per plugin: vim.pack.add + setup + its keys
  colors.lua           mini.base16 with nixos_palette, else the default scheme
  statusline.lua       mini.statusline
  treesitter.lua       nvim-treesitter (main): grammars, highlighting, indent
  telescope.lua        files, grep, pickers; telescope-ui-select for menus
  lsp.lua              nvim-lspconfig definitions; servers start if on PATH
  format.lua           conform.nvim: format on save
  gitsigns.lua         changes in the margin, hunk actions
  render-markdown.lua  Markdown drawn in the buffer (Space u m toggles)
  zellij-nav.lua       Ctrl+H/J/K/L across windows, then zellij panes
  which-key.lua        key hints
```

## Language servers

None are installed by this config. `lua/plugins/lsp.lua` lists the servers
it knows and enables each one whose program is on PATH, so a project's
environment (direnv / `nix develop`) decides. Start `nvim` inside the
project. To support a new language, add the server's lspconfig name to
the `servers` list.

## Updating plugins

`:lua vim.pack.update()`, review, `:write` to confirm, commit
`nvim-pack-lock.json`. To undo: `git checkout HEAD -- nvim-pack-lock.json`
and restart.

Keys are listed in `~/.config/nixos/docs/15-editor.md` (or press Space and
wait).
