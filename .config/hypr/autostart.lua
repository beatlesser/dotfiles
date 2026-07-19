hl.on("hyprland.start", function()
	hl.exec_cmd("fcitx5")
	hl.exec_cmd("udiskie")
	hl.exec_cmd("noctalia")
	-- autostart app
	hl.exec_cmd("helium-browser")
	hl.exec_cmd("foot -e pi", {
		tag = "ai-agent",
	})
	hl.exec_cmd("flatpak run com.qq.QQ")
end)
