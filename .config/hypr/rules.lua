hl.layer_rule({
	name = "noctalia",
	match = {
		namespace = "^noctalia-(bar-.+|notification|dock|panel|attached-panel|osd|window-switcher)$",
	},
	no_anim = true,
	ignore_alpha = 0.5,
	blur = true,
	blur_popups = true,
})

-- Fix some dragging issues with XWayland
hl.window_rule({
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},

	no_focus = true,
})

-- Noctalia Settings
hl.window_rule({
	match = { class = "dev.noctalia.Noctalia" },
	float = true,
	size = { 1080, 920 },
})

hl.window_rule({
	name = "browser",
	match = { class = "firefox" },
	workspace = "1",
})
hl.window_rule({
	name = "dev",
	match = { class = "kitty|foot" },
	workspace = "2",
})
hl.window_rule({
	name = "qq",
	match = { class = "QQ" },
	workspace = "4",
	no_initial_focus = true,
})
