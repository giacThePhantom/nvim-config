-- Editor behaviour: no plugins involved
local opt = vim.opt

-- No plugins here are written in Python, Ruby, Node or Perl: don't look
-- for those languages' plugin hosts (and don't warn in :checkhealth)
for _, provider in ipairs({ "python3", "ruby", "node", "perl" }) do
  vim.g["loaded_" .. provider .. "_provider"] = 0
end

opt.number = true
opt.relativenumber = true
opt.signcolumn = "yes" -- always there, so diagnostics and git signs don't shift the text
opt.cursorline = true
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.wrap = false
opt.linebreak = true -- when wrap is on (<leader>uw), break between words
opt.list = true
opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
opt.laststatus = 3 -- one statusline for all windows
opt.showmode = false -- the statusline shows it
opt.splitright = true
opt.splitbelow = true
opt.mouse = "a"
opt.confirm = true -- ask to save instead of refusing to quit

opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.smartindent = true
opt.ignorecase = true
opt.smartcase = true

opt.undofile = true -- undo survives closing the file
opt.updatetime = 250
opt.timeoutlen = 400

opt.completeopt = { "menuone", "noselect", "popup", "fuzzy" }
opt.pumheight = 12

-- The system clipboard: wl-clipboard on the desktop; over SSH (the
-- cluster) the terminal's own clipboard, through OSC 52
opt.clipboard = "unnamedplus"
if vim.env.SSH_TTY then
  vim.g.clipboard = "osc52"
end
