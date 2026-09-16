-- See https://wiki.hyprland.org/Configuring/Monitors/
-- List current monitors and resolutions possible: hyprctl monitors
-- Format: monitor = [port], resolution, position, scale

-- Optimized for retina-class 2x displays, like 13" 2.8K, 27" 5K, 32" 6K.
hl.env("GDK_SCALE", "1")
hl.monitor({
  output   = "eDP-1",
  mode     = "preferred",
  position = "1980x0",
  scale    = "1.33",
})
hl.monitor({
  output   = "DP-1",
  mode     = "preferred",
  position = "1920x0",
  scale    = "1",
})
hl.monitor({
  output   = "DP-3",
  mode     = "preferred",
  position = "0x0",
  scale    = "1",
})
hl.monitor({
  output   = "DP-4",
  mode     = "preferred",
  position = "1920x0",
  scale    = "1",
})
hl.monitor({
  output   = "DP-2",
  mode     = "preferred",
  position = "0x0",
  scale    = "1",
})
hl.monitor({
  output   = "HDMI-A-1",
  mode     = "preferred",
  position = "auto",
  scale    = "1",
  mirror   = "DP-1",
})

-- Good compromise for 27" or 32" 4K monitors (but fractional!)
-- hl.env("GDK_SCALE", "1.75")
-- hl.monitor({
--   output   = "",
--   mode     = "preferred",
--   position = "auto",
--   scale    = "1.666667",
-- })

-- Straight 1x setup for low-resolution displays like 1080p or 1440p
-- hl.env("GDK_SCALE", "1")
-- hl.monitor({
--   output   = "",
--   mode     = "preferred",
--   position = "auto",
--   scale    = "1",
-- })

-- Example for Framework 13 w/ 6K XDR Apple display
-- hl.monitor({
--   output   = "DP-5",
--   mode     = "6016x3384@60",
--   position = "auto",
--   scale    = "2",
-- })
-- hl.monitor({
--   output   = "eDP-1",
--   mode     = "2880x1920@120",
--   position = "auto",
--   scale    = "2",
-- })
