{
  config,
  ...
}: {
  programs.starship.enable = true;

  xdg.configFile.source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/.config/starship.toml";
}
