{
  "Mod+Space" = {
    spawn = [
      "nocatalia-shell"
      "ipc"
      "call"
      "launcher"
      "toggle"
    ];
  };
  "XF86AudioRaiseVolume" = {
    spawn = [
      "noctalia-shell"
      "ipc"
      "call"
      "volume"
      "increase"
    ];
  };
  "XF86AudioLowerVolume" = {
    spawn = [
      "noctalia-shell"
      "ipc"
      "call"
      "volume"
      "decrease"
    ];
  };
  "XF86AudioMute" = {
    spawn = [
      "noctalia-shell"
      "ipc"
      "call"
      "volume"
      "muteOutput"
    ];
  };
  "XF86MonBrightnessUp" = {
    spawn = [
      "noctalia-shell"
      "ipc"
      "call"
      "brightness"
      "increase"
    ];
  };
  "XF86MonBrightnessDown" = {
    spawn = [
      "noctalia-shell"
      "ipc"
      "call"
      "brightness"
      "decrease"
    ];
  };
  "Mod+C" = {
    spawn = [
      "noctalia-shell"
      "ipc"
      "call"
      "launcher"
      "clipboard"
    ];
  };
  "Super+L" = {
    spawn = [
      "noctalia-shell"
      "ipc"
      "call"
      "lockScreen"
      "lock"
    ];
  };
  "Mod+Semicolon" = {
    parameters = {
      hotkey-overlay-title = "Open a Main Terminal";
    };
    spawn = [ "kitty" ];
  };
  "Mod+Apostrophe" = {
    parameters = {
      hotkey-overlay-title = "Open a backup Terminal";
    };
    spawn = [ "foot" ];
  };
  "Mod+O" = {
    parameters = {
      repeat = false;
    };
    action = "toggle-overview";
  };
  "Mod+Q" = {
    parameters = {
      repeat = false;
    };
    action = "close-window";
  };
  "Mod+S" = {
    action = "center-column";
  };
  "Mod+R" = {
    action = "switch-preset-column-width";
  };
  "Mod+E" = {
    action = "expand-column-to-available-width";
  };
  "Mod+F" = {
    action = "fullscreen-window";
  };
  "Mod+Ctrl+F" = {
    action = "maximize-column";
  };
  "Mod+H" = {
    action = "focus-column-left";
  };
  "Mod+J" = {
    action = "focus-window-down";
  };
  "Mod+K" = {
    action = "focus-window-up";
  };
  "Mod+L" = {
    action = "focus-column-right";
  };
  "Mod+Ctrl+H" = {
    action = "move-column-left";
  };
  "Mod+Ctrl+J" = {
    action = "move-window-down";
  };
  "Mod+Ctrl+K" = {
    action = "move-window-up";
  };
  "Mod+Ctrl+L" = {
    action = "move-column-right";
  };
  "Mod+Home" = {
    action = "focus-column-first";
  };
  "Mod+Shift+H" = {
    action = "focus-monitor-left";
  };
  "Mod+Shift+J" = {
    action = "focus-monitor-down";
  };
  "Mod+Shift+K" = {
    action = "focus-monitor-up";
  };
  "Mod+Shift+L" = {
    action = "focus-monitor-right";
  };
  "Mod+U" = {
    action = "focus-workspace-down";
  };
  "Mod+I" = {
    action = "focus-workspace-up";
  };
  "Mod+Ctrl+U" = {
    action = "move-column-to-workspace-down";
  };
  "Mod+Ctrl+I" = {
    action = "move-column-to-workspace-up";
  };
  "Mod+Shift+U" = {
    action = "move-workspace-down";
  };
  "Mod+Shift+I" = {
    action = "move-workspace-up";
  };
  "Mod+WheelScrollDown" = {
    parameters = {
      cooldown-ms = 150;
    };
    action = "focus-workspace-down";
  };
  "Mod+WheelScrollUp" = {
    parameters = {
      cooldown-ms = 150;
    };
    action = "focus-workspace-up";
  };
  "Mod+Ctrl+WheelScrollDown" = {
    parameters = {
      cooldown-ms = 150;
    };
    action = "move-column-to-workspace-down";
  };
  "Mod+Ctrl+WheelScrollUp" = {
    parameters = {
      cooldown-ms = 150;
    };
    action = "move-column-to-workspace-up";
  };
  "Mod+WheelScrollRight" = {
    action = "focus-column-right";
  };
  "Mod+WheelScrollLeft" = {
    action = "focus-column-left";
  };
  "Mod+Ctrl+WheelScrollRight" = {
    action = "move-column-right";
  };
  "Mod+Ctrl+WheelScrollLeft" = {
    action = "move-column-left";
  };
  "Mod+Shift+WheelScrollDown" = {
    action = "focus-column-right";
  };
  "Mod+Shift+WheelScrollUp" = {
    action = "focus-column-left";
  };
  "Mod+Ctrl+Shift+WheelScrollDown" = {
    action = "move-column-right";
  };
  "Mod+Ctrl+Shift+WheelScrollUp" = {
    action = "move-column-left";
  };
  "Mod+1" = {
    action = "focus-workspace 1";
  };
  "Mod+2" = {
    action = "focus-workspace 2";
  };
  "Mod+3" = {
    action = "focus-workspace 3";
  };
  "Mod+4" = {
    action = "focus-workspace 4";
  };
  "Mod+5" = {
    action = "focus-workspace 5";
  };
  "Mod+6" = {
    action = "focus-workspace 6";
  };
  "Mod+7" = {
    action = "focus-workspace 7";
  };
  "Mod+8" = {
    action = "focus-workspace 8";
  };
  "Mod+9" = {
    action = "focus-workspace 9";
  };
  "Mod+BracketLeft" = {
    action = "consume-or-expel-window-left";
  };
  "Mod+BracketRight" = {
    action = "consume-or-expel-window-right";
  };
  "Mod+Comma" = {
    action = "consume-window-into-column";
  };
  "Mod+Period" = {
    action = "expel-window-from-column";
  };
  "Mod+Ctrl+C" = {
    action = "center-visible-columns";
  };
  "Mod+Minus" = {
    action = ''set-column-width "-10%"'';
  };
  "Mod+Equal" = {
    action = ''set-column-width "+10%"'';
  };
  "Mod+Shift+Minus" = {
    action = ''set-window-height "10"'';
  };
  "Mod+Shift+Equal" = {
    action = ''set-window-height "+10%"'';
  };
  "Mod+V" = {
    action = "toggle-window-floating";
  };
  "Mod+A" = {
    action = "switch-focus-between-floating-and-tiling";
  };
  "Print" = {
    action = "screenshot";
  };
  "Ctrl+Print" = {
    action = "screenshot-screen";
  };
  "Mod+Print" = {
    action = "screenshot-window";
  };
}
