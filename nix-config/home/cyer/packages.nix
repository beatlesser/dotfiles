{stable, ...}: {
  # add your user level packages here
  home.packages = with stable; [
    starship
    neovim
  ];
}
