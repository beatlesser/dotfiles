{config,lib}:{
    programs.starship.enable = true;

    xdg.configFile.source =  lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/starship.toml";
}
