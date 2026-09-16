---------------------
--- Hypr Keybinds ---
---------------------

--- Functions ---
-- Helper to have per layout keybinds
local function layout_bind(bind_table)
  return function ()
    local workspace = hl.get_active_special_workspace() or
    hl.get_active_workspace()

    if not workspace then
      return
    end local layout = workspace.tiled_layout

    if bind_table[layout] then
      hl.dispatch(bind_table[layout])
    end
  end
end

------------
--- Keys ---
------------
--- Navigation and Window management ---
hl.bind("SUPER + H", hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER + J", hl.dsp.focus({ direction = "down" }))
hl.bind("SUPER + K", hl.dsp.focus({ direction = "up" }))
hl.bind("SUPER + L", hl.dsp.focus({ direction = "right" }))

hl.bind("escape", hl.dsp.submap("reset"), {submap_universal = true, non_consuming = true})

--- moving windows
hl.bind("SUPER + Z", hl.dsp.submap("move"))
hl.define_submap("move", function()
  hl.bind("SUPER + H", layout_bind({
    dwindle = hl.dsp.window.move({direction = "l", group_aware = true}),
    scrolling = hl.dsp.layout("consume_or_expel prev"),
  }), {repeating = true})
  hl.bind("SUPER + L", layout_bind({
    dwindle = hl.dsp.window.move({direction = "r", group_aware = true}),
    scrolling = hl.dsp.layout("consume_or_expel next"),
  }), {repeating = true})
  hl.bind("SUPER + J", hl.dsp.window.move({ direction = "d", group_aware = true }))
  hl.bind("SUPER + K", hl.dsp.window.move({ direction = "u", group_aware = true }))
end)

--- rezising windows
hl.bind("SUPER + X", hl.dsp.submap("resize"))
hl.define_submap("resize", function()
  hl.bind("SUPER + H", layout_bind({
    dwindle = hl.dsp.window.resize({x = -20, y = 0, relative = true}),
    scrolling = hl.dsp.layout("colresize -0.02"),
  }), {repeating = true})
  hl.bind("SUPER + L", layout_bind({
    dwindle = hl.dsp.window.resize({x = 20, y = 0, relative = true}),
    scrolling = hl.dsp.layout("colresize +0.02"),
  }), {repeating = true})
  hl.bind("SUPER + J", hl.dsp.window.resize({x=0, y=-20, relative=true}), {repeating=true})
  hl.bind("SUPER + K", hl.dsp.window.resize({x=0, y=20, relative=true}), {repeating=true})

  -- layout.scrolling specific
  hl.bind("SUPER + Q", hl.dsp.layout("colresize +conf"), { repeating = true })
  hl.bind("SUPER + SHIFT + Q", hl.dsp.layout("colresize -conf"), { repeating = true })
  hl.bind("SUPER + 0", hl.dsp.layout("fit all"))
  hl.bind("SUPER + 2", hl.dsp.layout("colresize all 0.5"))
  hl.bind("SUPER + 3", hl.dsp.layout("colresize all 0.333"))
end)

--- General binds ---
hl.bind("SUPER + T", hl.dsp.exec_cmd("alacritty"))
hl.bind("SUPER + W", hl.dsp.window.close())
hl.bind("SUPER + R", hl.dsp.exec_cmd("rofi -show combi"))
hl.bind("SUPER + E", hl.dsp.exec_cmd("dolphin"))
hl.bind("SUPER + F", hl.dsp.window.float())
hl.bind("SUPER + F11", hl.dsp.window.fullscreen())
hl.bind("CONTROL + SHIFT + escape", hl.dsp.exec_cmd("alacritty -e btop -p 0"))
hl.bind("CONTROL + ALT + L", hl.dsp.exec_cmd("hyprlock"))
hl.bind("ALT + TAB", hl.dsp.focus({ monitor = "+1" }))

hl.bind("SUPER + C", hl.dsp.exec_cmd("cliphist list | rofi -dmenu | cliphist decode | wl-copy"))
hl.bind("SUPER + B", hl.dsp.exec_cmd("zen-browser"))

hl.bind("SUPER + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })

--- Workspace management---
for i = 1, 10 do
  local key = i % 10
  hl.bind("SUPER + " .. key, hl.dsp.focus({ workspace = i , on_current_monitor = true}))
  hl.bind("SUPER + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

hl.bind("SUPER + S", hl.dsp.workspace.toggle_special("magick"))
hl.bind("SUPER + SHIFT + S ", hl.dsp.window.move({ workspace = "special:magick" }))

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })
hl.bind("XF86PowerOff",         hl.dsp.exec_cmd("~/.config/scripts/shutdown.sh"))

-- Requires playerctl
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })

