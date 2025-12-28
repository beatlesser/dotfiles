{
  pkgs,
  myvars,
  mylib,
  ...
}:
{
  programs.foot = {
    enable = true;
    enableFishIntegration = true;
  };
  hjem.users.${myvars.username} = {
    packages = with pkgs; [ kitty ];
    xdg.config.files."kitty".source = mylib.mapToConfig "kitty";
  };
}
