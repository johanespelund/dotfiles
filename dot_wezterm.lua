-- WezTerm, set up to look like the GNOME Terminal profile (Catppuccin, MesloLGS NF 12).
-- Light/dark follows ~/.local/state/theme like tmux and Neovim; `theme` touches this
-- file so open windows reload.
local wezterm = require("wezterm")

local f = io.open(wezterm.home_dir .. "/.local/state/theme")
local theme = f and f:read("*l") or "dark"
if f then
	f:close()
end

return {
	color_scheme = theme == "light" and "Catppuccin Latte" or "Catppuccin Mocha",
	font = wezterm.font("MesloLGS NF"),
	font_size = 12,
	-- tmux has its own tabs and status bar
	hide_tab_bar_if_only_one_tab = true,
	window_padding = { left = 2, right = 2, top = 2, bottom = 2 },
}
