c = c
config = config

import catppuccin
import subprocess

# Core Settings
config.load_autoconfig()
c.auto_save.session = True

# Tabs Configuration - Display and positioning
c.tabs.show = "multiple"
c.tabs.position = "right"
c.tabs.width = 250
c.tabs.title.format = "{audio}{current_title}"
c.tabs.padding = {'top': 4, 'bottom': 4, 'left': 8, 'right': 8}
c.tabs.indicator.width = 0  # No tab indicators

# Search Engines - DuckDuckGo supports built-in bangs (see https://duckduckgo.com/bangs)
c.url.searchengines = {
    'DEFAULT': 'https://duckduckgo.com/?q={}',
    '!gh': 'https://github.com/search?o=desc&q={}&s=stars',
    '!yt': 'https://www.youtube.com/results?search_query={}',
}

# Completion Settings
c.completion.open_categories = ['searchengines', 'quickmarks', 'bookmarks', 'history', 'filesystem']

# Keybindings - Tab management
config.bind('<Space>e', 'config-cycle tabs.show multiple never')
config.bind('<Space><Space>', 'cmd-set-text -s :tab-select')
config.bind('L', 'tab-next')
config.bind('H', 'tab-prev')
config.bind('<ctrl-shift-l>', 'tab-move +')
config.bind('<ctrl-shift-h>', 'tab-move -')
config.bind('x', 'tab-close')
config.unbind('xo')
config.unbind('xO')

# Navigation
config.bind('<Space>h', 'back')
config.bind('<Space>l', 'forward')

# Interface toggles
config.bind('<Space>wo', 'config-cycle statusbar.show always never')
config.bind('<Space>wi', 'config-cycle window.hide_decoration true false')
config.bind('<Space>wt', 'config-cycle tabs.position top right')

# Layout adjustments
config.bind('<ctrl-y>', 'config-cycle tabs.width 150 250 350')

# Appearance & Theming - Dark mode configuration
c.colors.webpage.darkmode.enabled = True
c.colors.webpage.darkmode.algorithm = 'lightness-cielab'
c.colors.webpage.darkmode.policy.images = 'never'
config.set('colors.webpage.darkmode.enabled', False, 'file://*')

# Catppuccin theme
catppuccin.setup(c, 'mocha', True)

# Custom stylesheets (commented out - uncomment to use)
# c.content.user_stylesheets = ["~/.config/qutebrowser/styles/youtube-tweaks.css"]

# Fonts
c.fonts.default_family = []
c.fonts.default_size = '11pt'
c.fonts.web.family.fixed = 'monospace'
c.fonts.web.family.sans_serif = 'monospace'
c.fonts.web.family.serif = 'monospace'
c.fonts.web.family.standard = 'monospace'

# Privacy & Security Settings - Content blocking
c.content.blocking.enabled = True
c.content.blocking.method = 'adblock'  # Requires python-abp package

# Privacy settings (adjust based on your preferences)
config.set("content.webgl", False, "*")
config.set("content.canvas_reading", False)
config.set("content.geolocation", False)
config.set("content.webrtc_ip_handling_policy", "default-public-interface-only")
config.set("content.cookies.accept", "all")
config.set("content.cookies.store", True)

# Additional privacy options
# config.set("completion.cmd_history_max_items", 0)
# config.set("content.private_browsing", True)

# Ad Blocking Lists (uncomment to enable)
# c.content.blocking.adblock.lists = [
#     "https://github.com/ewpratten/youtube_ad_blocklist/blob/master/blocklist.txt",
#     "https://github.com/uBlockOrigin/uAssets/raw/master/filters/legacy.txt",
#     "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters.txt",
#     "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2020.txt",
#     "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2021.txt",
#     "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2022.txt",
#     "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2023.txt",
#     "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2024.txt",
#     "https://github.com/uBlockOrigin/uAssets/raw/master/filters/badware.txt",
#     "https://github.com/uBlockOrigin/uAssets/raw/master/filters/privacy.txt",
#     "https://github.com/uBlockOrigin/uAssets/raw/master/filters/badlists.txt",
#     "https://github.com/uBlockOrigin/uAssets/raw/master/filters/annoyances.txt",
#     "https://github.com/uBlockOrigin/uAssets/raw/master/filters/annoyances-cookies.txt",
#     "https://github.com/uBlockOrigin/uAssets/raw/master/filters/annoyances-others.txt",
#     "https://github.com/uBlockOrigin/uAssets/raw/master/filters/quick-fixes.txt",
#     "https://github.com/uBlockOrigin/uAssets/raw/master/filters/resource-abuse.txt",
#     "https://github.com/uBlockOrigin/uAssets/raw/master/filters/unbreak.txt"
# ]
