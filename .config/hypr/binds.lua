local Mod = "ALT"
local terminal = "foot"
local ipc = "noctalia msg "

hl.bind(Mod .. " + Space", hl.dsp.exec_cmd(ipc .. "panel-toggle launcher"))
hl.bind(Mod .. " + t", hl.dsp.exec_cmd(terminal))
hl.bind(Mod .. " + c", hl.dsp.exec_cmd(ipc .. "panel-toggle clipboard"))

hl.bind(Mod .. " + q", hl.dsp.window.close())
hl.bind(Mod .. " + v", hl.dsp.window.float())

-- Scrolling Layout
hl.bind(Mod .. " + r", hl.dsp.layout("colresize +conf"))

-- fullscreen
hl.bind(Mod .. " + f", hl.dsp.window.fullscreen({ layout_aware = true, mode = "maximized" }))
hl.bind(Mod .. " + CTRL" .. " + f", hl.dsp.window.fullscreen({ layout_aware = true }))

hl.bind(Mod .. " + h", hl.dsp.focus({ direction = "l" }))
hl.bind(Mod .. " + j", hl.dsp.focus({ direction = "d" }))
hl.bind(Mod .. " + k", hl.dsp.focus({ direction = "u" }))
hl.bind(Mod .. " + l", hl.dsp.focus({ direction = "r" }))

hl.bind(Mod .. " + CTRL" .. " + h", hl.dsp.window.move({ direction = "l" }))
hl.bind(Mod .. " + CTRL" .. " + j", hl.dsp.window.move({ direction = "d" }))
hl.bind(Mod .. " + CTRL" .. " + k", hl.dsp.window.move({ direction = "u" }))
hl.bind(Mod .. " + CTRL" .. " + l", hl.dsp.window.move({ direction = "r" }))

hl.bind(Mod .. "+ SHIFT" .. " + h", hl.dsp.window.swap({ direction = "l" }))
hl.bind(Mod .. "+ SHIFT" .. " + j", hl.dsp.window.swap({ direction = "d" }))
hl.bind(Mod .. "+ SHIFT" .. " + k", hl.dsp.window.swap({ direction = "u" }))
hl.bind(Mod .. "+ SHIFT" .. " + l", hl.dsp.window.swap({ direction = "r" }))

for i = 1, 10 do
	local key = i % 10
	hl.bind(Mod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(Mod .. " + CTRL + " .. key, hl.dsp.window.move({ workspace = i }))
end

hl.bind(Mod .. " + u", hl.dsp.focus({ workspace = "+1" }))
hl.bind(Mod .. " + i", hl.dsp.focus({ workspace = "-1" }))

hl.bind(Mod .. " + CTRL" .. " + u", hl.dsp.window.move({ workspace = "+1" }))
hl.bind(Mod .. " + CTRL" .. " + i", hl.dsp.window.move({ workspace = "-1" }))

hl.bind(Mod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(Mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Media keys
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd(ipc .. "volume-up"))
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd(ipc .. "volume-down"))
hl.bind("XF86AudioMute", hl.dsp.exec_cmd(ipc .. "volume-mute"))
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd(ipc .. "brightness-up"))
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd(ipc .. "brightness-down"))

hl.bind("SUPER + l", hl.dsp.exec_cmd(ipc .. "panel-toggle session"))

hl.bind("SUPER + p", hl.dsp.exec_cmd(ipc .. "screenshot-region"))
hl.bind("SUPER + CTRL + p", hl.dsp.exec_cmd(ipc .. "screenshot-fullscreen"))
