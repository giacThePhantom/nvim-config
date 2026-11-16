-- Colours: on NixOS the desktop's palette, which the system writes to
-- ~/.local/share/nvim/site/lua/nixos_palette.lua (base00..base0F, as
-- "#rrggbb"); anywhere else Neovim's own default scheme.
local ok, palette = pcall(require, "nixos_palette")
if ok then
  vim.pack.add({ "https://github.com/nvim-mini/mini.base16" }, { confirm = false })
  require("mini.base16").setup({ palette = palette })
else
  vim.cmd.colorscheme("default")
end
