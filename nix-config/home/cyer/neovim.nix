{config, ...}: {

  programs.neovim.enable = true;

  xdg.configFile."nvim" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.config/nvim";
  };

}
