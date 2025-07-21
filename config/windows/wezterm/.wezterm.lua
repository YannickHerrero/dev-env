local wezterm = require("wezterm")

return {
  front_end = "OpenGL",
  font = wezterm.font("JetBrainsMono Nerd Font Mono"),
  color_scheme = "Catppuccin Mocha",
  window_decorations = "RESIZE",
  hide_tab_bar_if_only_one_tab = true,
  colors = {
    background = "transparent",
  },
  wsl_domains = {
    {
      name = "WSL:Ubuntu",
      distribution = "Ubuntu",
    },
  },
  default_domain = "WSL:Ubuntu",
  default_prog = { "wsl.exe", "-d", "Ubuntu" },
}
