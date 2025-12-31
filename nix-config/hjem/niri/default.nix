{
  exlib,
  pkgs,
  ...
}: {
  packages = [
    pkgs.noctalia-shell
  ];
  rum.desktops.niri = {
    enable = true;
    binds = import ./binds.nix;
  };
}
