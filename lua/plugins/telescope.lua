-- Telescope: find files, grep the project, pick from lists. It is also the
-- menu for anything that asks you to choose (code actions, among others),
-- through telescope-ui-select. Needs ripgrep and fd on PATH.
vim.pack.add({
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/nvim-telescope/telescope.nvim",
  "https://github.com/nvim-telescope/telescope-ui-select.nvim",
}, { confirm = false })

local telescope = require("telescope")
local builtin = require("telescope.builtin")
local themes = require("telescope.themes")

telescope.setup({
  defaults = {
    path_display = { "filename_first" },
    sorting_strategy = "ascending",
    layout_config = { prompt_position = "top" },
  },
  pickers = {
    -- Dotfiles too, but not what git ignores
    find_files = { hidden = true, file_ignore_patterns = { "^.git/" } },
  },
  extensions = {
    ["ui-select"] = themes.get_cursor(),
  },
})
telescope.load_extension("ui-select")

local map = vim.keymap.set
-- Files
map("n", "<leader><space>", builtin.find_files, { desc = "Find files" })
map("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
map("n", "<leader>fr", builtin.oldfiles, { desc = "Recent files" })
map("n", "<leader>fb", builtin.buffers, { desc = "Open buffers" })
map("n", "<leader>fg", builtin.git_files, { desc = "Git files" })
map("n", "<leader>fc", function()
  builtin.find_files({ cwd = vim.fn.stdpath("config") })
end, { desc = "Neovim config files" })
-- Search
map("n", "<leader>/", builtin.live_grep, { desc = "Grep the project" })
map("n", "<leader>sg", builtin.live_grep, { desc = "Grep the project" })
map({ "n", "x" }, "<leader>sw", builtin.grep_string, { desc = "Grep word / selection" })
map("n", "<leader>sb", builtin.current_buffer_fuzzy_find, { desc = "Search this buffer" })
map("n", "<leader>sd", builtin.diagnostics, { desc = "Diagnostics" })
map("n", "<leader>sh", builtin.help_tags, { desc = "Help pages" })
map("n", "<leader>sk", builtin.keymaps, { desc = "Keymaps" })
map("n", "<leader>sr", builtin.resume, { desc = "Resume last search" })
map("n", "<leader>s:", builtin.command_history, { desc = "Command history" })
-- Git
map("n", "<leader>gc", builtin.git_commits, { desc = "Commits" })
map("n", "<leader>gS", builtin.git_status, { desc = "Changed files" })
