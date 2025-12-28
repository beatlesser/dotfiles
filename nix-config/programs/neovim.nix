{ mylib, myvars, ... }:
{
  programs.neovim = {
    enable = true;
    viAlias = true;
    defaultEditor = true;
  };
  hjem.users.${myvars.username}.xdg.config.files."nvim".source = mylib.mapToConfig "nvim";
}
