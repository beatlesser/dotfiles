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
  "Mod+Semicolon" = {
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
}
