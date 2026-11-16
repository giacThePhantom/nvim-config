-- Language servers, through Neovim's built-in LSP client. nvim-lspconfig
-- only supplies the definitions (command, file types, project root) for
-- each server. No server is installed here: each one starts only when its
-- program is on PATH, so a project's dev environment (direnv) decides which
-- languages get one. Start Neovim inside the project for that.
vim.pack.add({ "https://github.com/neovim/nvim-lspconfig" }, { confirm = false })

-- Every server this config knows; add one here when a project needs it
local servers = {
  "bashls", -- bash-language-server; uses shellcheck when present
  "nixd",
  "zk", -- notes: only inside a zk notebook (a folder with .zk)
  "basedpyright", -- Python types (or pyright, below)
  "pyright",
  "ruff", -- Python lint, quick fixes, imports
  "r_language_server", -- R: install.packages("languageserver")
  "texlab",
  "tinymist", -- Typst
  "lua_ls",
  "rust_analyzer",
  "clangd",
}

-- zk only inside a notebook (a folder with .zk): other Markdown is left alone
vim.lsp.config("zk", { root_markers = { ".zk" }, workspace_required = true })

-- Servers that need more than their program on PATH
local extra_check = {
  -- basedpyright is a stricter pyright: never both
  pyright = function()
    return vim.fn.executable("basedpyright") == 0
  end,
  -- R is there in every R project, its languageserver package maybe not
  r_language_server = function()
    local check = vim.system({
      "Rscript",
      "-e",
      "quit(status = !requireNamespace('languageserver', quietly = TRUE))",
    })
    return check:wait().code == 0
  end,
}

for _, name in ipairs(servers) do
  local config = vim.lsp.config[name]
  local cmd = config and config.cmd
  if
    type(cmd) == "table"
    and vim.fn.executable(cmd[1]) == 1
    and (not extra_check[name] or extra_check[name]())
  then
    vim.lsp.enable(name)
  end
end

vim.diagnostic.config({
  severity_sort = true,
  virtual_text = { spacing = 2, source = "if_many" },
  float = { border = "rounded", source = "if_many" },
})

-- LazyVim-style keys; the built-in gr* ones make way for them, so `gr`
-- doesn't wait to see whether more keys follow
for _, key in ipairs({ "grn", "gra", "grr", "gri", "grt", "grx" }) do
  pcall(vim.keymap.del, { "n", "x" }, key)
end

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
  callback = function(args)
    local buf = args.buf
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    local builtin = require("telescope.builtin")
    local function map(mode, lhs, rhs, desc)
      vim.keymap.set(mode, lhs, rhs, { buffer = buf, desc = desc })
    end

    map("n", "gd", builtin.lsp_definitions, "Go to definition")
    map("n", "gr", builtin.lsp_references, "References")
    map("n", "gI", builtin.lsp_implementations, "Go to implementation")
    map("n", "gy", builtin.lsp_type_definitions, "Go to type definition")
    map("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
    map("n", "gK", vim.lsp.buf.signature_help, "Signature help")
    map({ "n", "x" }, "<leader>ca", vim.lsp.buf.code_action, "Code action")
    map("n", "<leader>cA", function()
      vim.lsp.buf.code_action({ context = { only = { "source" }, diagnostics = {} } })
    end, "Source action")
    map("n", "<leader>cr", vim.lsp.buf.rename, "Rename")
    map("n", "<leader>ss", builtin.lsp_document_symbols, "Symbols in file")
    map("n", "<leader>sS", builtin.lsp_dynamic_workspace_symbols, "Symbols in project")

    -- Completion as you type, from the server; Ctrl+Y accepts, Ctrl+E closes
    if client and client:supports_method("textDocument/completion") then
      vim.lsp.completion.enable(true, client.id, buf, { autotrigger = true })
    end
  end,
})
