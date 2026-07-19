hl.on("hyprland.start", function()
	hl.exec_cmd("fcitx5")
	hl.exec_cmd("udiskie")
	hl.exec_cmd("noctalia")
	-- autostart app
	hl.exec_cmd("firefox")
	hl.exec_cmd("foot -e opencode", {
		no_initial_focus = true,
		workspace = "3",
	})
	hl.exec_cmd("flatpak run com.qq.QQ")
end)
