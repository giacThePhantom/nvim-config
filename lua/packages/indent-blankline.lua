local highlight = {
    "RainbowGray",
    "RainbowAqua",
    "RainbowYellow",
    "RainbowGreen",
    "RainbowBlue",
    "RainbowOrange",
    "RainbowPurple",
}

local hooks = require "ibl.hooks"
-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    vim.api.nvim_set_hl(0, "RainbowGray", { fg = "#928374" })
    vim.api.nvim_set_hl(0, "RainbowAqua", { fg = "#8ec07c" })
    vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#fabd2f" })
    vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#b8bb26" })
    vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#83a598" })
    vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#fe8019" })
    vim.api.nvim_set_hl(0, "RainbowPurple", { fg = "#d3869b" })
end)

require("ibl").setup({ 
  indent = {highlight = highlight}, 
  scope = {highlight = "RainbowPurple"}
})
