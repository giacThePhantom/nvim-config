-- Syntax highlighting and indentation from tree-sitter grammars. Grammars are
-- compiled on this machine the first time (they need the `tree-sitter` CLI
-- and a C compiler on PATH; NixOS gives them to Neovim) and then kept in
-- ~/.local/share/nvim/site/parser.
local languages = {
  "bash",
  "csv",
  "diff",
  "git_config",
  "gitcommit",
  "gitignore",
  "json",
  "lua",
  "make",
  "markdown",
  "markdown_inline",
  "nix",
  "python",
  "r",
  "regex",
  "snakemake",
  "toml",
  "typst",
  "vim",
  "vimdoc",
  "yaml",
}

-- After an update, rebuild the grammars to match the new version
vim.api.nvim_create_autocmd("PackChanged", {
  callback = function(ev)
    if ev.data.spec.name == "nvim-treesitter" and ev.data.kind == "update" then
      vim.schedule(function()
        vim.cmd("TSUpdate")
      end)
    end
  end,
})

vim.pack.add(
  { { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" } },
  { confirm = false }
)

-- Installs only what's missing, in the background
if vim.fn.executable("tree-sitter") == 1 then
  require("nvim-treesitter").install(languages)
end

vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("treesitter", { clear = true }),
  callback = function(args)
    -- Only where a grammar is installed; other files keep the regex syntax
    if pcall(vim.treesitter.start, args.buf) then
      vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end
  end,
})
