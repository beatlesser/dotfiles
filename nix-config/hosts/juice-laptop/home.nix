{
  myvars,
  mylib,
  ...
}:
{
  desktop.niri.enable = true;
  terminal.kitty = {
    enable = true;
    configPath = mylib.mapToConfig "kitty";
  };
  vcs.jujutsu.enable = true;
}
