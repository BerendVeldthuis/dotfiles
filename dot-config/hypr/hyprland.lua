-- This is an example Hyprland Lua config file.
-- Refer to the wiki for more information.
-- https://wiki.hypr.land/Configuring/Start/

-- Please note not all available settings / options are set here.
-- For a full list, see the wiki

-- You can (and should!!) split this configuration into multiple files
-- Create your files separately and then require them like this:
-- require("myColors")

------------------
---- MONITORS ----
------------------

-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
hl.monitor({
  output = "eDP-1",
  mode = "highres",
  position = "auto",
  scale = "1",
})

hl.monitor({
  output = "DP-1",
  position = "auto-up",
  scale = "1",
})

-------------------
---- AUTOSTART ----
-------------------
-- See https://wiki.hypr.land/Configuring/Basics/Autostart/
hl.on("hyprland.start", function ()
  hl.exec_cmd("systemctl --user start hyprpolkitagent")
  hl.exec_cmd("hyprlock -q -g 0")
  hl.exec_cmd("waybar & hyprpaper & hypridle & mako & nm-applet")
  hl.exec_cmd("solaar -w hide")
  hl.exec_cmd("wl-paste --type text --watch cliphist store")
  hl.exec_cmd("wl-paste --type image --watch cliphist store")
  hl.exec_cmd("XDG_MENU_PREFIX=arch- kbuildsycoca6")
  --hl.exec_cmd("mount /media/qbyte/smb/")
  hl.exec_cmd("com.github.wwmm.easyeffects", { workspace = 8})
  hl.exec_cmd("zen-browser", { workspace = "1" })
end)

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")

-----------------------
---- LOOK AND FEEL ----
-----------------------

local css_gaps = function(top, left, right, bottom) -- Simple utility function
    return {top = top, left = left, right = right, bottom = bottom}
end

-- Refer to https://wiki.hypr.land/Configuring/Basics/Variables/
hl.config({
  general = {
    gaps_in  = 2,
    gaps_out = css_gaps(3, 7, 7, 3),

    border_size = 2,
    col = {
      active_border = "rgb(98971a)",
      inactive_border = "rgb(458588)",
    },

    -- Set to true to enable resizing windows by clicking and dragging on borders and gaps
    resize_on_border = false,

    -- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
    allow_tearing = false,

    layout = "scrolling",
  },

  decoration = {
    rounding       = 0,
    rounding_power = 0,

    -- Change transparency of focused and unfocused windows
    active_opacity   = 1.0,
    inactive_opacity = 1.0,

    shadow = {
      enabled      = false,
      range        = 4,
      render_power = 3,
      color        = 0xee1a1a1a,
    },

    blur = {
      enabled   = true,
      size      = 5,
      passes    = 1,
      vibrancy  = 0.1696,
    },
  },

  animations = {
    enabled = true,
  },
})

-- Default curves and animations, see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/
hl.curve("easeOutQuint",   { type = "bezier", points = { {0.23, 1},    {0.32, 1}    } })
hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1}    } })
hl.curve("linear",         { type = "bezier", points = { {0, 0},       {1, 1}       } })
hl.curve("almostLinear",   { type = "bezier", points = { {0.5, 0.5},   {0.75, 1}    } })
hl.curve("quick",          { type = "bezier", points = { {0.15, 0},    {0.1, 1}     } })

-- Default springs
hl.curve("easy",           { type = "spring", mass = 1, stiffness = 71.2633, dampening = 15.8273644 })

hl.animation({ leaf = "global",        enabled = true,  speed = 10,   bezier = "default" })
hl.animation({ leaf = "border",        enabled = true,  speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows",       enabled = true,  speed = 4.79, spring = "easy" })
hl.animation({ leaf = "windowsIn",     enabled = true,  speed = 4.1,  spring = "easy",         style = "popin 87%" })
hl.animation({ leaf = "windowsOut",    enabled = true,  speed = 1.49, bezier = "linear",       style = "popin 87%" })
hl.animation({ leaf = "fadeIn",        enabled = true,  speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut",       enabled = true,  speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade",          enabled = true,  speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers",        enabled = true,  speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn",      enabled = true,  speed = 4,    bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut",     enabled = true,  speed = 1.5,  bezier = "linear",       style = "fade" })
hl.animation({ leaf = "fadeLayersIn",  enabled = true,  speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true,  speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces",    enabled = true,  speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn",  enabled = true,  speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true,  speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "zoomFactor",    enabled = true,  speed = 7,    bezier = "quick" })

-- Ref https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/
-- "Smart gaps" / "No gaps when only"
hl.workspace_rule({ workspace = "w[tv1]s[false]", gaps_out = 0, gaps_in = 0 })
hl.workspace_rule({ workspace = "f[1]s[false]", gaps_out = 0, gaps_in = 0 })
hl.window_rule({ match = { float = false, workspace = "w[tv1]s[false]" }, border_size = 0 })
hl.window_rule({ match = { float = false, workspace = "w[tv1]s[false]" }, rounding = 0 })
hl.window_rule({ match = { float = false, workspace = "f[1]s[false]" }, border_size = 0 })
hl.window_rule({ match = { float = false, workspace = "f[1]s[false]" }, rounding = 0 })

hl.window_rule({
    name  = "no-gaps-wtv1",
    match = { float = false, workspace = "w[tv1]" },
    border_size = 0,
    rounding    = 0,
})
hl.window_rule({
    name  = "no-gaps-f1",
    match = { float = false, workspace = "f[1]" },
    border_size = 0,
    rounding    = 0,
})

-- See https://wiki.hypr.land/Configuring/Layouts/Dwindle-Layout/ for more
hl.config({
  dwindle = {
    preserve_split = true, -- You probably want this
  },
})

-- See https://wiki.hypr.land/Configuring/Layouts/Scrolling-Layout/ for more
hl.config({
  scrolling = {
    fullscreen_on_one_column = false,
    focus_fit_method = 1, --centering
  },
})

----------------
----  MISC  ----
----------------
hl.config({
  misc = {
    force_default_wallpaper = 0,   -- Set to 0 or 1 to disable the anime mascot wallpapers
    disable_hyprland_logo   = true, -- If true disables the random hyprland logo / anime girl background. :(
    disable_splash_rendering = true,

  },
})


---------------
---- INPUT ----
---------------

hl.config({
  input = {
    kb_layout  = "us",
    kb_variant = "",
    kb_model   = "",
    kb_options = "",
    kb_rules   = "",
    numlock_by_default = true,

    follow_mouse = 1,

    sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.
    accel_profile = "flat",

    scroll_method = "on_button_down",
    scroll_button_lock = false,

    touchpad = {
      natural_scroll = false,
    },
  },
})

---------------------
---- KEYBINDINGS ----
---------------------
require("binds") -- All my binds live in binds.lua
hl.config({
  binds = {
  window_direction_monitor_fallback = false,
  },
})

---------------
---- RULES ----
---------------
-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

local suppressMaximizeRule = hl.window_rule({
  -- Ignore maximize requests from all apps. You'll probably like this.
  name  = "suppress-maximize-events",
  match = { class = ".*" },

  suppress_event = "maximize",
})
suppressMaximizeRule:set_enabled(true)

local workspace_init = function(id, name, layout)
  --- This func is used to set the name and layout of specifiyed workspace
  name = name or ""
  layout = layout or ""
  hl.workspace_rule({
    workspace = id,
    default_name = name,
    layout = layout,
  })
end

workspace_init("7", "tray")
workspace_init("8", "audio")

hl.window_rule({
  -- Fix some dragging issues with XWayland
  name  = "fix-xwayland-drags",
  match = {
    class      = "^$",
    title      = "^$",
    xwayland   = true,
    float      = true,
    fullscreen = false,
    pin        = false,
  },

  no_focus = true,
})

hl.window_rule({
  name = "polkits",
  match = {
    class = "qt-sudo",
  },
  float = true,
  center = true,
})

--- System tray ---
hl.window_rule({
  name = "KeepassXC",
  match = {
    class = "org.keepassxc.KeePassXC"
  },
  workspace = "7 silent",
})

hl.window_rule({
  name = "alacratty col size",
  match = {
    class = "Alacritty",
  },
  scrolling_width = 0.41,
})
hl.window_rule({
  name = "UMG anywhere col size",
  match = {
    class = "Wfica",
  },
  scrolling_width = 1.0,
})
hl.window_rule({
  name = "rpncalc col width",
  match = {
    title = "RCalc",
  },
  scrolling_width = 0.333,
})
--- Special workspace ---
hl.workspace_rule({
  workspace = "s[true]",
  gaps_out = 25,
})

hl.window_rule({
  name = "Styling for special",
  match = {
    workspace = "s[true]",
  },
  border_size = 5,
})

hl.layer_rule({
    name = "Waybar",
    match = {
        namespace = "waybar",
    },
    blur = true,
})
