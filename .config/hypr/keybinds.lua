local Mod = "ALT"
local terminal = "kitty"
local ipc = "qs -c noctalia-shell ipc call "
local browser = "firefox"

hl.bind(Mod .. " + Space", hl.dsp.exec_cmd(ipc .. "launcher toggle"))
hl.bind(Mod .. " + Semicolon", hl.dsp.exec_cmd(terminal))
hl.bind(Mod .. " + Apostrophe", hl.dsp.exec_cmd(browser))
hl.bind(Mod .. " + c", hl.dsp.exec_cmd(ipc .. "launcher clipboard"))

hl.bind(Mod .. " + q", hl.dsp.window.close())
hl.bind(Mod .. " + v", hl.dsp.window.float())
hl.bind(Mod .. " + f", hl.dsp.window.fullscreen())
hl.bind(Mod .. " + c", hl.dsp.window.center())

hl.bind(Mod .. " + h", hl.dsp.focus({ direction = "l" }))
hl.bind(Mod .. " + l", hl.dsp.focus({ direction = "r" }))
hl.bind(Mod .. " + j", hl.dsp.focus({ direction = "d" }))
hl.bind(Mod .. " + k", hl.dsp.focus({ direction = "u" }))

hl.bind(Mod .. " + CTRL" .. " + h", hl.dsp.window.move({ direction = "l" }))
hl.bind(Mod .. " + CTRL" .. " + l", hl.dsp.window.move({ direction = "r" }))
hl.bind(Mod .. " + CTRL" .. " + j", hl.dsp.window.move({ direction = "d" }))
hl.bind(Mod .. " + CTRL" .. " + k", hl.dsp.window.move({ direction = "u" }))

hl.bind(Mod .. "+ SHIFT" .. " + h", hl.dsp.window.swap({ direction = "l" }))
hl.bind(Mod .. "+ SHIFT" .. " + l", hl.dsp.window.swap({ direction = "r" }))
hl.bind(Mod .. "+ SHIFT" .. " + j", hl.dsp.window.swap({ direction = "d" }))
hl.bind(Mod .. "+ SHIFT" .. " + k", hl.dsp.window.swap({ direction = "u" }))

for i = 1, 10 do
    local key = i % 10
    hl.bind(Mod .. " + " .. key, hl.dsp.focus({ workspace = i }))
    hl.bind(Mod .. " + CTRL + " .. key, hl.dsp.window.move({ workspace = i }))
end

hl.bind(Mod .. " + u", hl.dsp.focus({ workspace = "+1" }))
hl.bind(Mod .. " + i", hl.dsp.focus({ workspace = "-1" }))

hl.bind(Mod .. " + CTRL" .. " + u", hl.dsp.window.move({ workspace = "+1" }))
hl.bind(Mod .. " + CTRL" .. " + i", hl.dsp.window.move({ workspace = "-1" }))

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd(ipc .. "volume increase"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd(ipc .. "volume decrease"), { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd(ipc .. "volume muteOutput"), { locked = true })

hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd(ipc .. "brightness increase"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd(ipc .. "brightness decrease"), { locked = true, repeating = true })

hl.bind("SUPER + L", hl.dsp.exec_cmd(ipc .. "sessionMenu toggle"))

hl.bind("SUPER + p", hl.dsp.exec_cmd("hyprshot -m region -o ~/Pictures/Screenshots"))
hl.bind("SUPER + CTRL + p", hl.dsp.exec_cmd("hyprshot -m window -o ~/Pictures/Screenshots"))
