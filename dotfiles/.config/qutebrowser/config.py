from qutebrowser.config.configfiles import ConfigAPI  # noqa: F401
from qutebrowser.config.config import ConfigContainer  # noqa: F401

config: ConfigAPI = config
c: ConfigContainer = c

config.load_autoconfig(True)


def bind_chained(key, *commands):
    config.bind(key, " ;; ".join(commands))


config.bind(",v", "spawn mpv {url}")

# Search engine and start page
config.set("url.searchengines", {"DEFAULT": "https://google.com/search?q={}"})
config.set("url.start_pages", "https://google.com")

config.set("colors.webpage.darkmode.enabled", False)
