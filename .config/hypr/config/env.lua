local hl = require("hyprland")

hl.env("NVD_BACKEND", "direct")
hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "NVIDIA")
hl.env("AWT_TOOLKIT", "XToolkit")
hl.env("_JAVA_AWT_WM_NONREPARENTING", "1")
hl.env("OMARCHY_SCREENRECORD_DIR", "$HOME/Videos/ScreenCasts")
