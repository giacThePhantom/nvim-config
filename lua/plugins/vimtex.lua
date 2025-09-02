-- lua/plugins/vimtex.lua
return {
  "lervag/vimtex",
  ft = { "tex" }, -- lazy-load only on TeX files
  config = function()
    -- Disable vimtex syntax (use treesitter instead)
    vim.g.vimtex_syntax_enabled = 0

    -- Use latexmk for compilation
    vim.g.vimtex_compiler_method = "latexmk"

    -- Example: configure latexmk
    vim.g.vimtex_compiler_latexmk = {
      build_dir = "build", -- put aux files in ./build
      options = {
        "-pdf",
        "-interaction=nonstopmode",
        "-synctex=1",
      },
    }

    -- Choose your PDF viewer (forward/inverse search)
		vim.g.vimtex_view_method = "zathura"

    -- Disable vimtex’s indentexpr (let Treesitter handle indent)
    vim.g.vimtex_indent_enabled = 0

    -- Optional: better conceal for math symbols
    vim.g.vimtex_syntax_conceal = {
      accents = 1,
      ligatures = 1,
      cites = 1,
      fancy = 1,
      spacing = 0,
      styles = 0,
    }

    -- Enable motion mappings (e.g. `dse`, `cse` for environments)
    vim.g.vimtex_mappings_enabled = 1
  end,
}
