from qutebrowser.api import cmdutils
from qutebrowser.config.configfiles import ConfigAPI  # noqa: F401
from qutebrowser.config.config import ConfigContainer  # noqa: F401
import sys
from qutebrowser.misc import objects

config: ConfigAPI = config
c: ConfigContainer = c

config.load_autoconfig(True)

c.fonts.hints = '8pt FiraCode Nerd Font'
c.fonts.keyhint = '8pt FiraCode Nerd Font'
c.fonts.prompts = '8pt FiraCode Nerd Font'
c.fonts.downloads = '8pt FiraCode Nerd Font'
c.fonts.statusbar = '8pt FiraCode Nerd Font'
c.fonts.contextmenu = '8pt FiraCode Nerd Font'
c.fonts.messages.info = '8pt FiraCode Nerd Font'
c.fonts.debug_console = '8pt FiraCode Nerd Font'
c.fonts.completion.entry = '8pt FiraCode Nerd Font'
c.fonts.completion.category = '8pt FiraCode Nerd Font'

def bind_chained(key, *commands):
    config.bind(key, " ;; ".join(commands))


config.bind(",v", "spawn mpv {url}")

# Search engine and start page
config.set("url.searchengines", {"DEFAULT": "https://google.com/search?q={}"})
config.set("url.start_pages", "https://google.com")
config.set("colors.webpage.darkmode.enabled", True)
