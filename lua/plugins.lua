-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		error("Error cloning lazy.nvim:\n" .. out)
	end
end

---@type vim.Option
local rtp = vim.opt.rtp
rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]

-- 1. bare list from plugins.lua
local bare_plugins = require("plugins.list")

-- 2. full configs from lua/plugins/*
local configs = {}
local config_dir = vim.fn.stdpath("config") .. "/lua/plugins"
for _, file in ipairs(vim.fn.readdir(config_dir, [[v:val =~ '\.lua$']])) do
	local name = file:gsub("%.lua$", "")
	-- don’t re-load plugins.lua itself
	if name ~= "plugins" then
		local ok, spec = pcall(require, "plugins." .. name)
		if ok then
			table.insert(configs, spec)
		else
			vim.notify("Error loading " .. name .. ": " .. spec, vim.log.levels.ERROR)
		end
	end
end

-- 3. combine bare + configs
--    lazy.nvim will merge duplicate specs by plugin name
local final_specs = {}
for _, p in ipairs(bare_plugins) do
	table.insert(final_specs, p)
end
for _, p in ipairs(configs) do
	table.insert(final_specs, p)
end

require("lazy").setup(
	final_specs,
	{
		ui = {
			-- If you are using a Nerd Font: set icons to an empty table which will use the
			-- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
			icons = vim.g.have_nerd_font and {} or {
				cmd = "⌘",
				config = "🛠",
				event = "📅",
				ft = "📂",
				init = "⚙",
				keys = "🗝",
				plugin = "🔌",
				runtime = "💻",
				require = "🌙",
				source = "📄",
				start = "🚀",
				task = "📌",
				lazy = "💤 ",
			},
		},
	}
)
