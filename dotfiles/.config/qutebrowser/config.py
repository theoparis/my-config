from qutebrowser.api import cmdutils
from qutebrowser.config.configfiles import ConfigAPI  # noqa: F401
from qutebrowser.config.config import ConfigContainer  # noqa: F401
import sys
from qutebrowser.misc import objects
from qutebrowser.extensions.interceptors import _interceptors
from qutebrowser.extensions.loader import _module_infos, load_extensions

config: ConfigAPI = config
c: ConfigContainer = c

config.load_autoconfig(True)


def bind_chained(key, *commands):
    config.bind(key, " ;; ".join(commands))


@cmdutils.register()
def reload_extensions():
    """Attempt to reload any third party extensions."""
    mod_prefix = "qutebrowser.extensions.third_party"

    # registered commands, including their args
    todel = [
        cmd.name for cmd in objects.commands.values()
        if cmd.handler.__module__.startswith(mod_prefix)
    ]
    for name in todel:
        del objects.commands[name]

    # interceptor functions, could probably del by value too
    todel = [
        idx for idx, func in enumerate(_interceptors)
        if func.__module__.startswith(mod_prefix)
    ]
    for idx in reversed(todel):
        del _interceptors[idx]

    # extension infos with hooks
    todel = [
        idx for idx, modinfo in enumerate(_module_infos)
        if modinfo.module.__name__.startswith(mod_prefix)
    ]
    for idx in reversed(todel):
        del _module_infos[idx]

    # remove from sys.modules to make sure walk_extensions reloads them
    # I didn't test importlib.reload(), it might not work because these aren't real modules.
    todel = [name for name in sys.modules.keys() if name.startswith(mod_prefix)]
    for name in todel:
        del sys.modules[name]

    load_extensions()


config.bind(",v", "spawn mpv {url}")

# Search engine and start page
config.set("url.searchengines", {"DEFAULT": "https://google.com/search?q={}"})
config.set("url.start_pages", "https://google.com")

config.set("colors.webpage.darkmode.enabled", False)
