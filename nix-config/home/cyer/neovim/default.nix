{config,lib, ...}: {
  programs.neovim.enable = true;

  xdg.configFile."nvim" = {
    source = lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/.config/nvim";
  };
}
