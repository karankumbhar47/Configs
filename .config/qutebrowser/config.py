# Change the argument to True to still load settings configured via autoconfig.yml
config.load_autoconfig(False)

# Which cookies to accept. With QtWebEngine, this setting also controls
# other features with tracking capabilities similar to those of cookies;
# including IndexedDB, DOM storage, filesystem API, service workers, and
# AppCache. Note that with QtWebKit, only `all` and `never` are
# `all`. If this setting is used with URL patterns, the pattern gets
# applied to the origin/first party URL of the page making the request,
# not the request URL. With QtWebEngine 5.15.0+, paths will be stripped
# from URLs, so URL patterns using paths will not match. With
# QtWebEngine 5.15.2+, subdomains are additionally stripped as well, so
# you will typically need to set this setting for `example.com` when the
# cookie is set on `somesubdomain.example.com` for it to work properly.
# To debug issues with this setting, start qutebrowser with `--debug
# --logfilter network --debug-flag log-cookies` which will show all
# cookies being set.
# Type: String
# Valid values:
#   - all: Accept all cookies.
#   - no-3rdparty: Accept cookies from the same origin only. This is known to break some sites, such as GMail.
#   - no-unknown-3rdparty: Accept cookies from the same origin only, unless a cookie is already set for the domain. On QtWebEngine, this is the same as no-3rdparty.
#   - never: Don't accept cookies at all.
config.set('content.cookies.accept', 'all', 'chrome-devtools://*')

# Which cookies to accept. With QtWebEngine, this setting also controls
# other features with tracking capabilities similar to those of cookies;
# including IndexedDB, DOM storage, filesystem API, service workers, and
# AppCache. Note that with QtWebKit, only `all` and `never` are
# supported as per-domain values. Setting `no-3rdparty` or `no-
# unknown-3rdparty` per-domain on QtWebKit will have the same effect as
# `all`. If this setting is used with URL patterns, the pattern gets
# applied to the origin/first party URL of the page making the request,
# not the request URL. With QtWebEngine 5.15.0+, paths will be stripped
# from URLs, so URL patterns using paths will not match. With
# QtWebEngine 5.15.2+, subdomains are additionally stripped as well, so
# you will typically need to set this setting for `example.com` when the
# cookie is set on `somesubdomain.example.com` for it to work properly.
# To debug issues with this setting, start qutebrowser with `--debug
# --logfilter network --debug-flag log-cookies` which will show all
# cookies being set.
# Type: String
# Valid values:
#   - all: Accept all cookies.
#   - no-3rdparty: Accept cookies from the same origin only. This is known to break some sites, such as GMail.
#   - no-unknown-3rdparty: Accept cookies from the same origin only, unless a cookie is already set for the domain. On QtWebEngine, this is the same as no-3rdparty.
#   - never: Don't accept cookies at all.
config.set('content.cookies.accept', 'all', 'devtools://*')

# Value to send in the `Accept-Language` header. Note that the value
# read from JavaScript is always the global value.
# Type: String
config.set('content.headers.accept_language', '', 'https://matchmaker.krunker.io/*')

# User agent to send.  The following placeholders are defined:  *
# `{os_info}`: Something like "X11; Linux x86_64". * `{webkit_version}`:
# The underlying WebKit version (set to a fixed value   with
# QtWebEngine). * `{qt_key}`: "Qt" for QtWebKit, "QtWebEngine" for
# QtWebEngine. * `{qt_version}`: The underlying Qt version. *
# `{upstream_browser_key}`: "Version" for QtWebKit, "Chrome" for
# QtWebEngine. * `{upstream_browser_version}`: The corresponding
# Safari/Chrome version. * `{qutebrowser_version}`: The currently
# running qutebrowser version.  The default value is equal to the
# unchanged user agent of QtWebKit/QtWebEngine.  Note that the value
# read from JavaScript is always the global value. With QtWebEngine
# between 5.12 and 5.14 (inclusive), changing the value exposed to
# JavaScript requires a restart.
# Type: FormatString
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}) AppleWebKit/{webkit_version} (KHTML, like Gecko) {upstream_browser_key}/{upstream_browser_version} Safari/{webkit_version}', 'https://web.whatsapp.com/')

# User agent to send.  The following placeholders are defined:  *
# `{os_info}`: Something like "X11; Linux x86_64". * `{webkit_version}`:
# The underlying WebKit version (set to a fixed value   with
# QtWebEngine). * `{qt_key}`: "Qt" for QtWebKit, "QtWebEngine" for
# QtWebEngine. * `{qt_version}`: The underlying Qt version. *
# `{upstream_browser_key}`: "Version" for QtWebKit, "Chrome" for
# QtWebEngine. * `{upstream_browser_version}`: The corresponding
# Safari/Chrome version. * `{qutebrowser_version}`: The currently
# running qutebrowser version.  The default value is equal to the
# unchanged user agent of QtWebKit/QtWebEngine.  Note that the value
# read from JavaScript is always the global value. With QtWebEngine
# between 5.12 and 5.14 (inclusive), changing the value exposed to
# JavaScript requires a restart.
# Type: FormatString
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}; rv:90.0) Gecko/20100101 Firefox/90.0', 'https://accounts.google.com/*')

# User agent to send.  The following placeholders are defined:  *
# `{os_info}`: Something like "X11; Linux x86_64". * `{webkit_version}`:
# The underlying WebKit version (set to a fixed value   with
# QtWebEngine). * `{qt_key}`: "Qt" for QtWebKit, "QtWebEngine" for
# QtWebEngine. * `{qt_version}`: The underlying Qt version. *
# `{upstream_browser_key}`: "Version" for QtWebKit, "Chrome" for
# QtWebEngine. * `{upstream_browser_version}`: The corresponding
# Safari/Chrome version. * `{qutebrowser_version}`: The currently
# running qutebrowser version.  The default value is equal to the
# unchanged user agent of QtWebKit/QtWebEngine.  Note that the value
# read from JavaScript is always the global value. With QtWebEngine
# between 5.12 and 5.14 (inclusive), changing the value exposed to
# JavaScript requires a restart.
# Type: FormatString
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99 Safari/537.36', 'https://*.slack.com/*')

# Load images automatically in web pages.
# Type: Bool
config.set('content.images', True, 'chrome-devtools://*')

# Load images automatically in web pages.
# Type: Bool
config.set('content.images', True, 'devtools://*')

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'chrome-devtools://*')

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'devtools://*')

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'chrome://*/*')

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'qute://*/*')

# Allow websites to show notifications.
# Type: BoolAsk
# Valid values:
#   - true
#   - false
#   - ask
config.set('content.notifications.enabled', False, 'https://www.reddit.com')

# Allow websites to register protocol handlers via
# `navigator.registerProtocolHandler`.
# Type: BoolAsk
# Valid values:
#   - true
#   - false
#   - ask
config.set('content.register_protocol_handler', True, 'https://mail.google.com?extsrc=mailto&url=%25s')

# Enable smooth scrolling for web pages. Note smooth scrolling does not
# work with the `:scroll-px` command.
# Type: Bool
c.scrolling.smooth = True

# Position of the tab bar.
# Type: Position
# Valid values:
#   - top
#   - bottom
#   - left
#   - right
c.tabs.position = 'top'

# Minimum width (in pixels) of tabs (-1 for the default minimum size
# behavior). This setting only applies when tabs are horizontal. This
# setting does not apply to pinned tabs, unless `tabs.pinned.shrink` is
# False.
# Type: Int
c.tabs.min_width = 100

# Maximum width (in pixels) of tabs (-1 for no maximum). This setting
# only applies when tabs are horizontal. This setting does not apply to
# pinned tabs, unless `tabs.pinned.shrink` is False. This setting may
# not apply properly if max_width is smaller than the minimum size of
# tab contents, or smaller than tabs.min_width.
# Type: Int
c.tabs.max_width = 150

# Search engines which can be used via the address bar.  Maps a search
# engine name (such as `DEFAULT`, or `ddg`) to a URL with a `{}`
# placeholder. The placeholder will be replaced by the search term, use
# `{{` and `}}` for literal `{`/`}` braces.  The following further
# placeholds are defined to configure how special characters in the
# search terms are replaced by safe characters (called 'quoting'):  *
# `{}` and `{semiquoted}` quote everything except slashes; this is the
# most   sensible choice for almost all search engines (for the search
# term   `slash/and&amp` this placeholder expands to `slash/and%26amp`).
# * `{quoted}` quotes all characters (for `slash/and&amp` this
# placeholder   expands to `slash%2Fand%26amp`). * `{unquoted}` quotes
# nothing (for `slash/and&amp` this placeholder   expands to
# `slash/and&amp`). * `{0}` means the same as `{}`, but can be used
# multiple times.  The search engine named `DEFAULT` is used when
# `url.auto_search` is turned on and something else than a URL was
# entered to be opened. Other search engines can be used by prepending
# the search engine name to the search term, e.g. `:open google
# qutebrowser`.
# Type: Dict
c.url.searchengines = {'b': 'https://search.brave.com/search?q={}', 'ddg': 'https://duckduckgo.com/?q{}', 'aw': 'https://wiki.archlinux.org/?search={}', 'DEFAULT': 'https://www.google.com/search?hl=en&q={}', 'github': 'https://github.com/search?q={}', 'yt': 'https://www.youtube.com/results?search_query={}', 'man': ' https://www.die.net/search/?q={}'}

# Setting color scheme
# Type: QssColor
c.colors.completion.odd.bg = '#100520'
c.colors.completion.even.bg = '#100520'
c.colors.completion.item.selected.fg = '#100520'
c.colors.completion.item.selected.bg = '#e7a927'
c.colors.completion.category.bg = '#2787e7'

c.colors.tabs.odd.bg = '#100520'
c.colors.tabs.even.bg = '#100520'
c.colors.tabs.selected.odd.fg = '#301560'
c.colors.tabs.selected.even.fg = '#301560'
c.colors.tabs.selected.odd.bg = '#e7a927'
c.colors.tabs.selected.odd.bg = '#e7a927'
c.colors.tabs.selected.odd.bg = 'black'
c.colors.tabs.selected.even.bg = '#000000'
c.tabs.padding = {"bottom": 2, "left": 5, "right": 5, "top":2}

c.completion.scrollbar.padding = 1
c.completion.scrollbar.width = 7
c.tabs.show = 'multiple'
c.content.javascript.can_open_tabs_automatically = True

c.editor.command = ["alacritty", "--class", "Alacritty:Floating", "-o", "font.size=9.0", "-e", "nvim", "-f", "{file}", "-c", "normal {line}G{column0}l"]

# Bindings for normal mode
config.bind('J', 'tab-prev')
config.bind('K', 'tab-next')
config.bind(',e', 'edit-text')
config.bind(',r', 'spawn dmenuread web {url}')
config.bind(',m', 'hint links spawn linkhandler_mpd {hint-url}')
config.bind(',M', 'spawn linkhandler_mpd {url}')
#  config.bind(',v', 'hint links spawn --detach mpv {hint-url}')
#  config.bind(',V', 'spawn --detach mpv {url}')
#  Added temporarily till no audio bug is fixed
config.bind(',v', 'hint links spawn --detach mpv --force-window=yes --ytdl=no --script-opts=ytdl_hooks-all_formats="yes" {hint-url}')
config.bind(',V', 'spawn --detach mpv --ytdl=no --force-window=yes --script-opts=ytdl_hooks-all_formats="yes" {url}')   


c.url.start_pages = ['~/.config/qutebrowser/homepage/index.html']
c.url.default_page = '~/.config/qutebrowser/homepage/index.html'

# load dracula
import dracula.draw

# Load existing settings made via :set
config.load_autoconfig()

dracula.draw.blood(c, {
    'spacing': {
        'vertical': 6,
        'horizontal': 8
    }
})



# load theme
config.source('qutebrowser-themes/themes/onedark.py')

c.downloads.open_dispatcher = "~/Templates/music.sh {}"
c.content.autoplay = False
c.content.user_stylesheets = ['~/.config/qutebrowser/loadingScreen.css']


# Enable session auto-saving
c.auto_save.session = True
# Restore session lazily to avoid performance issues on startup
c.session.lazy_restore = True

# Toggle the status bar with Ctrl+b
config.bind('xb', 'config-cycle statusbar.show always never')

# Toggle the tab bar with Ctrl+t
config.bind('xt', 'config-cycle tabs.show always never')

# Toggle both the status bar and tab bar with Ctrl+Shift+b
config.bind('xx', 'config-cycle statusbar.show always never;; config-cycle tabs.show always never')


# Set the JetBrains Mono Nerd Font for web content
#c.fonts.web.family.standard = 'JetBrainsMono Nerd Font'
# c.fonts.web.family.fixed = 'JetBrainsMono Nerd Font'
# c.fonts.web.family.serif = 'JetBrainsMono Nerd Font'
# c.fonts.web.family.sans_serif = 'JetBrainsMono Nerd Font'
# c.fonts.web.family.cursive = 'JetBrainsMono Nerd Font'
# c.fonts.web.family.fantasy = 'JetBrainsMono Nerd Font'
#
# # Set the JetBrains Mono Nerd Font for UI elements
# c.fonts.default_family = 'JetBrainsMono Nerd Font'
# c.fonts.default_size = '11pt'

# Customize specific UI element fonts
# c.fonts.statusbar = '12pt JetBrainsMono Nerd Font'
# c.fonts.tabs = '12pt JetBrainsMono Nerd Font'
# c.fonts.hints = 'bold 12pt JetBrainsMono Nerd Font'
# c.fonts.messages.info = '12pt JetBrainsMono Nerd Font'
# c.fonts.debug_console = '12pt JetBrainsMono Nerd Font'
# c.fonts.completion.entry = '12pt JetBrainsMono Nerd Font'
# c.fonts.completion.category = 'bold 12pt JetBrainsMono Nerd Font'


c.content.blocking.adblock.lists = [
    "https://www.youtube.com/"
]
