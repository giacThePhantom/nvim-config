-- Formatting with the project's own formatters, on save. A formatter that
-- isn't on PATH is skipped, and then the language server formats if it can.
vim.pack.add({ "https://github.com/stevearc/conform.nvim" }, { confirm = false })

-- Files kept formatted by hand, never formatted on save (<leader>cf still
-- formats them on request)
local by_hand = {
  "settings.nix", -- ~/.config/nixos: `nix fmt` skips it too
}

require("conform").setup({
  formatters_by_ft = {
    nix = { "nixfmt" },
    sh = { "shfmt" },
    bash = { "shfmt" },
    python = { "ruff_organize_imports", "ruff_format" },
    lua = { "stylua" },
    toml = { "taplo" },
  },
  formatters = {
    -- Two spaces, indented case branches; an .editorconfig wins
    shfmt = { prepend_args = { "-i", "2", "-ci" } },
  },
  default_format_opts = { lsp_format = "fallback" },
  format_on_save = function(buf)
    if vim.g.autoformat == false or vim.b[buf].autoformat == false then
      return nil
    end
    if vim.tbl_contains(by_hand, vim.fs.basename(vim.api.nvim_buf_get_name(buf))) then
      return nil
    end
    return { timeout_ms = 1000 }
  end,
})

vim.keymap.set({ "n", "x" }, "<leader>cf", function()
  require("conform").format()
end, { desc = "Format" })
vim.keymap.set("n", "<leader>uf", function()
  vim.g.autoformat = vim.g.autoformat == false
  vim.notify("Format on save: " .. (vim.g.autoformat and "on" or "off"))
end, { desc = "Toggle format on save" })
