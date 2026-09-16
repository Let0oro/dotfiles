config.load_autoconfig(True)

c.qt.force_software_rendering = "chromium"
c.url.searchengines = {
    "DEFAULT": "https://www.ecosia.org/search?q={}",
    "g": "https://www.google.com/search?q={}",
    "ddg": "https://duckduckgo.com/?q={}",
    "gh": "https://github.com/search?q={}",
}
